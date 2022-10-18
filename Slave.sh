#!/bin/sh
yes | sudo apt-get update
yes | sudo apt-get upgrade
cd /usr/local/
yes | sudo apt install jq
RED='\033[0;31m'
echo -e " ${RED}|--------------------------------------------------| "
echo -e " ${RED}|--------------Deploying Services------------------| "
echo -e " ${RED}|--------------------------------------------------| "
NC='\033[0m'
echo -e "${NC}"
usr=`jq '.user' info.json`
echo "Your Linux Username Is: ${usr}" | sed "s/['\"]//g"
echo " "

echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Checking for Ubuntu system updates>>>>>"


################################################################ Making Kockpit-Tools Directory #####################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Looking For Directory To Install Services>>>>>"
echo " "
cd /usr/local/
echo "Searching for kockpit-tools directory"
if [[ -d "/usr/local/kockpit-tools" ]]
then
    echo "kockpit-tools directory exists"
else
    echo "Directory does not exist. Creating now"
    sudo mkdir kockpit-tools
fi

################################################################ Installing Java #####################################

echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Installing Java>>>>>"
echo " "
echo "Looking for JAVA in your system."
if [[ -d "/usr/local/kockpit-tools/java-8-openjdk-amd64" ]]
then
    echo "JAVA is already installed in your filesystem."
else
    echo "JAVA does not exist. Installing JAVA"
    yes | sudo apt install openjdk-8-jdk-headless
    sudo cp -r /usr/lib/jvm/java-8-openjdk-amd64 /usr/local/kockpit-tools/
fi

read -t 2 -p "Java Version is: "
java -version
read -t 2 -p "   "

################################################################ Installing Python #####################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Installing Python>>>>>"
echo " "
python=`jq '.pythonVersion' info.json`
echo $python | sed "s/['\"]//g" 
if [[ $python == *3.6* ]] 
then
    echo "Looking for Python in your system."
    if [[ -d "/usr/local/kockpit-tools/Python-3.6" ]]
    then
        echo "Python 3.6 is already installed in your filesystem."
    else
        echo "Python does not exist. Installing Python"
        cd /usr/local/kockpit-tools/
        sudo mkdir Python-3.6
        yes | sudo apt install python3.6-distutils
        yes | sudo apt-get install python3.6-minimal
        yes | sudo apt-get install python3.6-dev
        yes | sudo apt-get install python3.6-stdlib
        # yes | sudo apt-get update
        # yes | sudo apt install software-properties-common
        # yes | sudo add-apt-repository ppa:deadsnakes/ppa
        # yes | sudo apt-get update
        # yes | sudo apt-get upgrade
        # yes | sudo apt install python3.6
        # cd /usr/bin/
        # sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
    fi
elif [[ $python == *3.7* ]]
then
    cd /usr/local/kockpit-tools/
    sudo mkdir Python-3.7
    yes | sudo apt-get update
    yes | sudo apt install software-properties-common
    yes | sudo add-apt-repository ppa:deadsnakes/ppa
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    yes | sudo apt install python3.7-full
    yes | sudo apt install python3.7-distutils
    yes | sudo apt-get install python3.7-minimal
    yes | sudo apt-get install python3.7-dev
    yes | sudo apt-get install python3.7-stdlib
    yes | sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
    yes | sudo -H python3 -m pip install cffi
    sudo ln -s /usr/lib/python3/dist-packages/gi/_gi.cpython-{36m,37m}-x86_64-linux-gnu.so
    cd /usr/bin/
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
elif [[ $python == *3.8* ]]
then
    cd /usr/local/kockpit-tools/
    sudo mkdir Python-3.8
    yes | sudo apt-get update
    yes | sudo apt install software-properties-common
    yes | sudo add-apt-repository ppa:deadsnakes/ppa
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    #yes | sudo apt install python3.8
    yes | sudo apt install python3.8-full
    yes | sudo apt install python3.8-distutils
    yes | sudo apt-get install python3.8-minimal
    yes | sudo apt-get install python3.8-dev
    yes | sudo apt-get install python3.8-stdlib
    cd /usr/bin/
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1    
elif [[ $python == *3.9* ]]
then
    cd /usr/local/kockpit-tools/
    sudo mkdir Python-3.9
    yes | sudo apt-get update
    yes | sudo apt install software-properties-common
    yes | sudo add-apt-repository ppa:deadsnakes/ppa
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    #yes | sudo apt install python3.7
    yes | sudo apt install python3.9-full
    yes | sudo apt install python3.9-distutils
    yes | sudo apt-get install python3.9-minimal
    yes | sudo apt-get install python3.9-dev
    yes | sudo apt-get install python3.9-stdlib
    cd /usr/bin/
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
elif [[ $python == *3.10* ]]
then
    cd /usr/local/kockpit-tools/
    sudo mkdir Python-3.10
    yes | sudo apt-get update
    yes | sudo apt install software-properties-common
    yes | sudo add-apt-repository ppa:deadsnakes/ppa
    yes | sudo apt-get update
    yes | sudo apt-get upgrade
    #yes | sudo apt install python3.10
    yes | sudo apt install python3.10-full
    yes | sudo apt install python3.10-distutils
    yes | sudo apt-get install python3.10-minimal
    yes | sudo apt-get install python3.10-dev
    yes | sudo apt-get install python3.10-stdlib
    cd /usr/bin/
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1    
else
   echo "None of the python version installed"
fi

read -t 1 -p "Python Version is: "
python3 --version
read -t 2 -p "   "

cd  /usr/lib/python3/dist-packages
sudo cp apt_pkg.cpython-36m-x86_64-linux-gnu.so apt_pkg.so
cd /usr/local/

################################################################ Installing Hadoop #####################################

echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Installing Hadoop>>>>>"
echo " "
hadoop=`jq '.hadoopVersion' info.json`
#echo $hadoop | sed "s/['\"]//g"
if [[ $hadoop == *3.2* ]] 
then
    if [[ -d "/usr/local/kockpit-tools/hadoop-3.2.3" ]]
    then
        echo "HADOOP is already installed in your filesystem."
    else
        echo "HADOOP does not exist. Downloading HADOOP"
        cd /usr/local/kockpit-tools/
        sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.2.3/hadoop-3.2.3.tar.gz

        sudo tar -xvf hadoop-3.2.3.tar.gz
        sudo rm -rf hadoop-3.2.3.tar.gz
        sudo mkdir /usr/local/kockpit-tools/hadoop_store/
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store
        sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        #sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
    
        read -t 2 -p "Changing ownership from root to user"
        echo " "
        cd /usr/local/
        sudo touch user1.txt
        sudo chmod 777 user1.txt
        user=`jq '.user' info.json`
        echo $user | sed "s/['\"]//g" > user1.txt
        user1=`awk 'FNR ==1 {print $1}' /usr/local/user1.txt`
        sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        sudo chmod 777 /usr/local/kockpit-tools
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop
        
        ############ Saving Master IP into Master File #############
        cd /usr/local/
        masterIP=`jq '.masterIP' info.json`
        echo $masterIP | sed "s/['\"]//g"
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/master 
        cd /etc
        sudo chmod 777 hosts
        echo $masterIP | sed "s/['\"]//g" >> hosts
        cd /usr/local/
        sudo touch hosts.txt
        sudo chmod 777 hosts.txt
        echo $masterIP | sed "s/['\"]//g" >> hosts.txt

        ############ Saving Worker IP into Workers File #############
        cd /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/
        sudo rm workers
        sudo touch workers
        sudo chmod 777 workers
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers
        done
        masterIP=`jq '.masterIP' info.json`
        #workerIP1=`jq '.workerIP1' info.json`
        #workerIP2=`jq '.workerIP2' info.json`
        #workerIP3=`jq '.workerIP3' info.json`
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers
        #echo $workerIP1 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        #cho $workerIP2 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        #echo $workerIP3 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            cd /etc/
            echo "$i" | sed "s/['\"]//g" >> hosts
        done

        #echo $workerIP1 | sed "s/['\"]//g" >> hosts
        #echo $workerIP2 | sed "s/['\"]//g" >> hosts
        #echo $workerIP3 | sed "s/['\"]//g" >> hosts
    
        echo " "
        cd /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/hdfs-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/mapred-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/yarn-site.xml
        sudo rm core-site.xml
        sudo rm hdfs-site.xml
        sudo rm mapred-site.xml
        sudo rm yarn-site.xml
    
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/hadoop-env.sh
        echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> hadoop-env.sh
    
        echo "==================================================="
        read -t 2 -p "Setting up the configuration files in /etc/hadoop"
        echo " "
    
        sudo touch core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/core-site.xml
        cd /usr/local
        hn=`jq '.hostname' info.json`
        sudo touch hosts.txt
        sudo chmod 777 hosts.txt
        echo $hn | sed "s/['\"]//g" > hosts.txt
        #echo $hostname | sed "s/['\"]//g" >> hosts.txt
        master=`awk 'FNR ==1 {print $1}' /usr/local/hosts.txt`
        cd /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/
        sudo touch core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/core-site.xml
        sudo echo "  <configuration>
                            <property>
                                      <name>fs.defaultFS</name>
                                      <value>hdfs://$master:9000</value> 
                            </property>
                </configuration>" >> core-site.xml
        
        sudo touch hdfs-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/hdfs-site.xml
        sudo echo "  <configuration>
                                <property>
    
                                          <name>dfs.replication</name>
                                          <value>100</value>
    
                                </property>
                                <property>
                                          <name>dfs.datanode.data.dir</name>
                                          <value>file:/usr/local/kockpit-tools/hadoop_store/hdfs/datanode</value>
                                </property>
                </configuration>" >> hdfs-site.xml
    
        sudo touch mapred-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/mapred-site.xml
        sudo echo "  <configuration>
                                <property>
                                         <name>mapreduce.framework.name</name>
                                         <value>yarn</value>
                                </property>
                                <property>
                                         <name>mapred.job.tracker</name>
                                         <value>localhost:54311</value>
                                </property>
                </configuration>" >> mapred-site.xml        
        
        sudo touch yarn-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/yarn-site.xml
        sudo echo "  <configuration>
                                <property>
                                         <name>yarn.resourcemanager.resource-tracker.address</name>
                                         <value>$master:8025</value>
                                </property>
                                <property>
                                         <name>yarn.resourcemanager.scheduler.address</name>
                                         <value>$master:8030</value>
                                </property>
                                <property>
                                         <name>yarn.resourcemanager.address</name>
                                         <value>$master:8050</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.aux-services</name>
                                         <value>mapreduce_shuffle</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
                                         <value>org.apache.hadoop.mapred.ShuffleHandler</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.disk-health-checker.min-healthy-disks</name>
                                         <value>0</value>
                                </property>
                </configuration>" >> yarn-site.xml
    fi
else
    echo "Hadoop3.2 Installation Skipped"    
fi

cd /usr/local/
hadoop=`jq '.hadoopVersion' info.json`
#echo $hadoop | sed "s/['\"]//g"
if [[ $hadoop == *3.3* ]]  
then
    if [[ -d "/usr/local/kockpit-tools/hadoop-3.3.2" ]]
    then
        echo "HADOOP is already installed in your filesystem."
    else
        echo "HADOOP does not exist. Downloading HADOOP"
        cd /usr/local/kockpit-tools/
        sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.2/hadoop-3.3.2.tar.gz

        sudo tar -xvf hadoop-3.3.2.tar.gz
        sudo rm -rf hadoop-3.3.2.tar.gz
        sudo mkdir /usr/local/kockpit-tools/hadoop_store/
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store
        sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo mkdir -p /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        #sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo chmod 777 /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
    
        read -t 2 -p "Changing ownership from root to user"
        echo " "
        cd /usr/local/
        sudo touch user1.txt
        sudo chmod 777 user1.txt
        user=`jq '.user' info.json`
        echo $user | sed "s/['\"]//g" > user1.txt
        user1=`awk 'FNR ==1 {print $1}' /usr/local/user1.txt`
        sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        sudo chown -R $user1.$user1  /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs/namenode
        #sudo chown -R $USER.$USER  /usr/local/kockpit-tools/hadoop_store/hdfs/datanode
        sudo chmod 777 /usr/local/kockpit-tools
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop

        ############ Saving Master IP into Master File #############
        cd /usr/local/
        masterIP=`jq '.masterIP' info.json`
        echo $masterIP | sed "s/['\"]//g"
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/master 
        cd /etc
        sudo chmod 777 hosts
        echo $masterIP | sed "s/['\"]//g" >> hosts
        cd /usr/local/
        sudo touch hosts.txt
        sudo chmod 777 hosts.txt
        echo $masterIP | sed "s/['\"]//g" >> hosts.txt
    
        ############ Saving Worker IP into Workers File #############
        cd /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/
        sudo rm workers
        sudo touch workers
        sudo chmod 777 workers
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/workers
        done
        masterIP=`jq '.masterIP' info.json`
        #workerIP1=`jq '.workerIP1' info.json`
        #workerIP2=`jq '.workerIP2' info.json`
        #workerIP3=`jq '.workerIP3' info.json`
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/workers
        #echo $workerIP1 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        #cho $workerIP2 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        #echo $workerIP3 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers 
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            cd /etc/
            echo "$i" | sed "s/['\"]//g" >> hosts
        done

        #echo $workerIP1 | sed "s/['\"]//g" >> hosts
        #echo $workerIP2 | sed "s/['\"]//g" >> hosts
        #echo $workerIP3 | sed "s/['\"]//g" >> hosts

        echo " "
        cd /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/hdfs-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/mapred-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/yarn-site.xml
        sudo rm core-site.xml
        sudo rm hdfs-site.xml
        sudo rm mapred-site.xml
        sudo rm yarn-site.xml
    
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/hadoop-env.sh
        echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> hadoop-env.sh
    
        echo "==================================================="
        read -t 5 -p "Setting up the configuration files in /etc/hadoop"
        echo " "
    
        sudo touch core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/core-site.xml
        cd /usr/local
        hn=`jq '.hostname' info.json`
        sudo touch hosts.txt
        sudo chmod 777 hosts.txt
        echo $hn | sed "s/['\"]//g" > hosts.txt
        master=`awk 'FNR ==1 {print $1}' /usr/local/hosts.txt`
        cd /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/
        sudo touch core-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/core-site.xml
        sudo echo "  <configuration>
                            <property>
                                      <name>fs.defaultFS</name>
                                      <value>hdfs://$master:9000</value>
                            </property>
                </configuration>" >> core-site.xml
        
        sudo touch hdfs-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/hdfs-site.xml
        sudo echo "  <configuration>
                                <property>
    
                                          <name>dfs.replication</name>
                                          <value>100</value>
    
                                </property>
                                <property>
                                          <name>dfs.datanode.data.dir</name>
                                          <value>file:/usr/local/kockpit-tools/hadoop_store/hdfs/datanode</value>
                                </property>
                </configuration>" >> hdfs-site.xml
    
        sudo touch mapred-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/mapred-site.xml
        sudo echo "  <configuration>
                                <property>
                                         <name>mapreduce.framework.name</name>
                                         <value>yarn</value>
                                </property>
                                <property>
                                         <name>mapred.job.tracker</name>
                                         <value>localhost:54311</value>
                                </property>
                </configuration>" >> mapred-site.xml        
        
        sudo touch yarn-site.xml
        sudo chmod 777 /usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop/yarn-site.xml
        sudo echo "  <configuration>
                                <property>
                                         <name>yarn.resourcemanager.resource-tracker.address</name>
                                         <value>$master:8025</value>
                                </property>
                                <property>
                                         <name>yarn.resourcemanager.scheduler.address</name>
                                         <value>$master:8030</value>
                                </property>
                                <property>
                                         <name>yarn.resourcemanager.address</name>
                                         <value>$master:8050</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.aux-services</name>
                                         <value>mapreduce_shuffle</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
                                         <value>org.apache.hadoop.mapred.ShuffleHandler</value>
                                </property>
                                <property>
                                         <name>yarn.nodemanager.disk-health-checker.min-healthy-disks</name>
                                         <value>0</value>
                                </property>
                </configuration>" >> yarn-site.xml
    fi
else
    echo "Hadoop3.3 Installation Skipped"    
fi

############################################################  Patching BashRC  ##############################################################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Adding Paths to .bashrc>>>>>" 
cd /usr/local
hadoop=`jq '.hadoopVersion' info.json`
#echo $hadoop | sed "s/['\"]//g"
if [[ $hadoop == *3.2* ]]  
then
    echo "Looking for BashRC in your system."
    if [[ -d "/usr/local/kockpit-tools/BashRC3.2" ]]
    then
        echo "Paths are already added into your BashRC."
    else
        sudo mkdir /usr/local/kockpit-tools/BashRC3.2
        read -t 2 -p "Adding Paths to .bashrc" 
        echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> ~/.bashrc
        echo "export HADOOP_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/hadoop-3.2.3/bin" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/hadoop-3.2.3/sbin" >> ~/.bashrc
        echo "export HADOOP_MAPRED_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> ~/.bashrc
        echo "export HADOOP_COMMON_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> ~/.bashrc
        echo "export HADOOP_HDFS_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> ~/.bashrc
        echo "export YARN_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> ~/.bashrc
        echo "export HADOOP_CONF_DIR=/usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop" >> ~/.bashrc
        echo "export HADOOP_COMMON_local_NATIVE_DIR=/usr/local/kockpit-tools/hadoop-3.2.3/local/native" >> ~/.bashrc
        echo "export SPARK_HOME=/usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/bin" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/sbin" >> ~/.bashrc
        echo 'export LD_localRARY_PATH=$HADOOP/local/native:$LD_localRARY_PATH' >> ~/.bashrc
        echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.bashrc
        echo 'export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON' >> ~/.bashrc
        echo "export HIVE_HOME=/usr/local/kockpit-tools/apache-hive-3.1.2-bin" >> ~/.bashrc
        echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc
        echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
    fi
else
    echo "Hadoop 3.2 BashRC Skipped"
fi

cd /usr/local
hadoop=`jq '.hadoopVersion' info.json`
echo $hadoop | sed "s/['\"]//g"
if [[ $hadoop == *3.3* ]]
then
    echo "Looking for BashRC in your system."
    if [[ -d "/usr/local/kockpit-tools/BashRC3.3" ]]
    then
        echo "Paths are already added into your BashRC."
    else
        sudo mkdir /usr/local/kockpit-tools/BashRC3.3
        read -t 2 -p "Adding Paths to .bashrc" 
        echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> ~/.bashrc
        echo "export HADOOP_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/hadoop-3.3.2/bin" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/hadoop-3.3.2/sbin" >> ~/.bashrc
        echo "export HADOOP_MAPRED_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> ~/.bashrc
        echo "export HADOOP_COMMON_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> ~/.bashrc
        echo "export HADOOP_HDFS_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> ~/.bashrc
        echo "export YARN_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> ~/.bashrc
        echo "export HADOOP_CONF_DIR=/usr/local/kockpit-tools/hadoop-3.3.2/etc/hadoop" >> ~/.bashrc
        echo "export HADOOP_COMMON_local_NATIVE_DIR=/usr/local/kockpit-tools/hadoop-3.3.2/local/native" >> ~/.bashrc
        echo "export SPARK_HOME=/usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/bin" >> ~/.bashrc
        echo 'export PATH=$PATH:'"/usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/sbin" >> ~/.bashrc
        echo 'export LD_localRARY_PATH=$HADOOP/local/native:$LD_localRARY_PATH' >> ~/.bashrc
        echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.bashrc
        echo 'export PYSPARK_DRIVER_PYTHON=$PYSPARK_PYTHON' >> ~/.bashrc
        echo "export HIVE_HOME=/usr/local/kockpit-tools/apache-hive-3.1.2-bin" >> ~/.bashrc
        echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc
        echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
    fi
else
    echo "Hadoop 3.3 BashRC Skipped"
fi

######################################################### Spark Installation ############################################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Installing Spark>>>>>" 
echo " "
cd /usr/local
spark=`jq '.sparkVersion' info.json`
#echo $spark | sed "s/['\"]//g"
if [[ $spark == *3.1* ]]
then
    echo "Looking for Spark in your system."
    if [[ -d "/usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2" ]]
    then
        echo "Spark is already installed in your filesystem."
    else
        echo "Spark does not exist. Downloading Spark"
        cd /usr/local/kockpit-tools/
        sudo wget https://dlcdn.apache.org/spark/spark-3.1.3/spark-3.1.3-bin-hadoop3.2.tgz
        sudo tar -xvf spark-3.1.3-bin-hadoop3.2.tgz
        sudo rm -rf spark-3.1.3-bin-hadoop3.2.tgz
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2
        
        cd /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/
        
        sudo touch spark-env.sh
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/spark-env.sh
    
        echo "Example for how to create worker cores and memory"
        echo "export SPARK_WORKER_CORES=32"
        echo "export SPARK_WORKER_MEMORY=60g"
    
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        #echo $sparkCores | sed "s/['\"]//g"
        echo " "
        sudo touch /usr/local/Spark_config.txt
        sudo chmod 777 /usr/local/Spark_config.txt
        free -h >> /usr/local/Spark_config.txt
        nproc >> /usr/local/Spark_config.txt
        cores=`awk '{if(NR==4) print $0}' /usr/local/Spark_config.txt`
        echo $sparkCores | sed "s/['\"]//g" >> /usr/local/Spark_config.txt
        sparkCoresInput=`awk '{if(NR==5) print $0}' /usr/local/Spark_config.txt`
        #echo $cores
        echo " "
        read -t 5 -p "Understanding your system configuration."
        echo " " 
        
        # while true; do
        #     echo 'Enter the Number of Cores for you want to provide for your Spark Cluster'
        #     read osbit
        #     if [ "$osbit" -gt "$cores" ];then
        #         echo "Your Linux has $cores core. Enter less than or equal to $cores cores."
        #         read -rp "Your cores wasn't within the range. Please Press Enter"
        #     elif [ "$osbit" -le "$cores" ];then
        #         echo "$osbit Cores you have entered"
        #         echo "export SPARK_WORKER_CORES=$osbit" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/spark-env.sh
        #         break
        #     fi
        # done
        read -t 1 -p "Spark Worker Cores: "
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        echo "export SPARK_WORKER_CORES=$sparkCores" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/spark-env.sh
        read -t 1 -p "Spark Worker Memory: "
        cd /usr/local
        sudo rm Spark_config.txt
        sparkMemory=`jq '.sparkMemory' info.json`
        echo $sparkMemory | sed "s/['\"]//g"
        echo "export SPARK_WORKER_MEMORY=$sparkMemory" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/spark-env.sh
        sudo echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/spark-env.sh
        cd /usr/local/
        masterIP=`jq '.masterIP' info.json`
        workerIP1=`jq '.workerIP1' info.json`
        workerIP2=`jq '.workerIP2' info.json`
        workerIP3=`jq '.workerIP3' info.json`
        cd /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf
        sudo touch slaves
        sudo chmod 777 slaves
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            cd /etc/
            echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        done
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP1 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP2 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP3 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves

        cd /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/jars
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/sqljdbc42.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/postgresql-42.2.20.jre7.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/mssql-jdbc-7.2.0.jre8.jar
        yes | sudo apt-get install python3-pip
        pip3 install pyspark==3.1.3
        sudo pip3 install pyspark==3.1.3
    fi
else
    echo "Spark3.1 Installation Skipped"    
fi  

cd /usr/local
spark=`jq '.sparkVersion' info.json`
#echo $spark | sed "s/['\"]//g"
if [[ $spark == *3.2* ]]
then
    echo "Looking for Spark in your system."
    if [[ -d "/usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2" ]]
    then
        echo "Spark is already installed in your filesystem."
    else
        echo "Spark does not exist. Downloading Spark"
        cd /usr/local/kockpit-tools/
        sudo wget https://dlcdn.apache.org/spark/spark-3.2.2/spark-3.2.2-bin-hadoop3.2.tgz
        sudo tar -xvf spark-3.2.2-bin-hadoop3.2.tgz
        sudo rm -rf spark-3.2.2-bin-hadoop3.2.tgz
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2
        
        cd /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/
        
        sudo touch spark-env.sh
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/spark-env.sh
    
        echo "Example for how to create worker cores and memory"
        echo "export SPARK_WORKER_CORES=32"
        echo "export SPARK_WORKER_MEMORY=60g"
    
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        #echo $sparkCores | sed "s/['\"]//g"
        echo " "
        sudo touch /usr/local/Spark_config.txt
        sudo chmod 777 /usr/local/Spark_config.txt
        free -h >> /usr/local/Spark_config.txt
        nproc >> /usr/local/Spark_config.txt
        cores=`awk '{if(NR==4) print $0}' /usr/local/Spark_config.txt`
        echo $sparkCores | sed "s/['\"]//g" >> /usr/local/Spark_config.txt
        sparkCoresInput=`awk '{if(NR==5) print $0}' /usr/local/Spark_config.txt`
        #echo $cores
        echo " "
        read -t 5 -p "Understanding your system configuration."
        echo " " 
        
        # while true; do
        #     echo 'Enter the Number of Cores for you want to provide for your Spark Cluster'
        #     read osbit
        #     if [ "$osbit" -gt "$cores" ];then
        #         echo "Your Linux has $cores core. Enter less than or equal to $cores cores."
        #         read -rp "Your cores wasn't within the range. Please Press Enter"
        #     elif [ "$osbit" -le "$cores" ];then
        #         echo "$osbit Cores you have entered"
        #         echo "export SPARK_WORKER_CORES=$osbit" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/spark-env.sh
        #         break
        #     fi
        # done
        read -t 1 -p "Spark Worker Cores: "
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        echo "export SPARK_WORKER_CORES=$sparkCores" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/spark-env.sh
        read -t 1 -p "Spark Worker Memory: "
        cd /usr/local
        sudo rm Spark_config.txt
        sparkMemory=`jq '.sparkMemory' info.json`
        echo $sparkMemory | sed "s/['\"]//g"
        echo "export SPARK_WORKER_MEMORY=$sparkMemory" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/spark-env.sh
        sudo echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/spark-env.sh
        cd /usr/local/
        masterIP=`jq '.masterIP' info.json`
        workerIP1=`jq '.workerIP1' info.json`
        workerIP2=`jq '.workerIP2' info.json`
        workerIP3=`jq '.workerIP3' info.json`
        cd /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf
        sudo touch slaves
        sudo chmod 777 slaves
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            cd /etc/
            echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/slaves
        done
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/slaves
        #echo $workerIP1 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/slaves
        #echo $workerIP2 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/slaves
        #echo $workerIP3 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/conf/slaves

        cd /usr/local/kockpit-tools/spark-3.2.2-bin-hadoop3.2/jars
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/sqljdbc42.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/postgresql-42.2.20.jre7.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/mssql-jdbc-7.2.0.jre8.jar
        yes | sudo apt-get install python3-pip
        pip3 install pyspark==3.2.2
        sudo pip3 install pyspark==3.2.2
    fi
else
    echo "Spark3.2 Installation Skipped"    
fi  

cd /usr/local
spark=`jq '.sparkVersion' info.json`
#echo $spark | sed "s/['\"]//g"
if [[ $spark == *3.0* ]]
then
    echo "Looking for Spark in your system."
    if [[ -d "/usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2" ]]
    then
        echo "Spark is already installed in your filesystem."
    else
        echo "Spark does not exist. Downloading Spark"
        cd /usr/local/kockpit-tools/
        sudo wget https://dlcdn.apache.org/spark/spark-3.0.3/spark-3.0.3-bin-hadoop3.2.tgz
        sudo tar -xvf spark-3.0.3-bin-hadoop3.2.tgz
        sudo rm -rf spark-3.0.3-bin-hadoop3.2.tgz
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2
        
        cd /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/
        
        sudo touch spark-env.sh
        sudo chmod 777 /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/spark-env.sh
    
        echo "Example for how to create worker cores and memory"
        echo "export SPARK_WORKER_CORES=32"
        echo "export SPARK_WORKER_MEMORY=60g"
    
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        #echo $sparkCores | sed "s/['\"]//g"
        echo " "
        sudo touch /usr/local/Spark_config.txt
        sudo chmod 777 /usr/local/Spark_config.txt
        free -h >> /usr/local/Spark_config.txt
        nproc >> /usr/local/Spark_config.txt
        cores=`awk '{if(NR==4) print $0}' /usr/local/Spark_config.txt`
        echo $sparkCores | sed "s/['\"]//g" >> /usr/local/Spark_config.txt
        sparkCoresInput=`awk '{if(NR==5) print $0}' /usr/local/Spark_config.txt`
        #echo $cores
        echo " "
        read -t 5 -p "Understanding your system configuration."
        echo " " 
        
        # while true; do
        #     echo 'Enter the Number of Cores for you want to provide for your Spark Cluster'
        #     read osbit
        #     if [ "$osbit" -gt "$cores" ];then
        #         echo "Your Linux has $cores core. Enter less than or equal to $cores cores."
        #         read -rp "Your cores wasn't within the range. Please Press Enter"
        #     elif [ "$osbit" -le "$cores" ];then
        #         echo "$osbit Cores you have entered"
        #         echo "export SPARK_WORKER_CORES=$osbit" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/spark-env.sh
        #         break
        #     fi
        # done
        read -t 1 -p "Spark Worker Cores: "
        cd /usr/local
        sparkCores=`jq '.sparkCores' info.json`
        echo "export SPARK_WORKER_MEMORY=$sparkCores" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/spark-env.sh
        read -t 1 -p "Spark Worker Memory: "
        cd /usr/local
        sudo rm Spark_config.txt
        sparkMemory=`jq '.sparkMemory' info.json`
        echo $sparkMemory | sed "s/['\"]//g"
        echo "export SPARK_WORKER_MEMORY=$sparkMemory" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/spark-env.sh
        sudo echo "export JAVA_HOME=/usr/local/kockpit-tools/java-8-openjdk-amd64" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/spark-env.sh
        cd /usr/local/
        masterIP=`jq '.masterIP' info.json`
        workerIP1=`jq '.workerIP1' info.json`
        workerIP2=`jq '.workerIP2' info.json`
        workerIP3=`jq '.workerIP3' info.json`
        cd /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf
        sudo touch slaves
        sudo chmod 777 slaves
        cd /usr/local/
        jq -c '.slaveIP[]' info.json |
        while read i;
        do
            cd /etc/
            echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        done
        echo $masterIP | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP1 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP2 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/slaves
        #echo $workerIP3 | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/conf/slaves

        cd /usr/local/kockpit-tools/spark-3.0.3-bin-hadoop3.2/jars
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/sqljdbc42.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/postgresql-42.2.20.jre7.jar
    
        sudo wget --no-check-certificate --content-disposition https://github.com/anmolpal/Spark-Drivers/raw/main/mssql-jdbc-7.2.0.jre8.jar
    
    fi
else
    echo "Spark3.0 Installation Skipped"    
fi  


##################################################### Hive Installation Hadoop 3.2#############################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 2 -p "<<<<<Installing Hive>>>>>" 
echo " "
cd /usr/local
hive=`jq '.hive' info.json`
if [[ $hive == *yes* ]] && [[ $hadoop == *3.2* ]] 
then
    if [[ -d "/usr/local/kockpit-tools/apache-hive-3.1.2-bin" ]]
    then
        echo "Hive is already installed in your filesystem."
    else
        echo "Hive does not exist. Downloading Hive"
        cd /usr/local/kockpit-tools/
        sudo wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
        sudo tar xzf apache-hive-3.1.2-bin.tar.gz
        sudo rm -rf apache-hive-3.1.2-bin.tar.gz
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/bin/
        sudo chmod 777 hive-config.sh 
        echo "export HADOOP_HOME=/usr/local/kockpit-tools/hadoop-3.2.3" >> hive-config.sh
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/
        sudo wget https://github.com/Anmol-Recker/Hive/archive/refs/heads/main.zip
        sudo apt install unzip
        sudo unzip main.zip
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/Hive-main/
        sudo mv hive-site.xml /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/lib/
        sudo rm guava-19.0.jar
        sudo wget https://github.com/Anmol-Recker/Hive/raw/main/guava-27.0-jre.jar
    fi
else
    echo "Hive Installation Skipped"    
fi

##################################################### Hive Installation Hadoop 3.3#############################################
echo " "
echo "==================================================="
echo "==================================================="
#read -t 2 -p "<<<<<Installing Hive>>>>>" 
echo " "
cd /usr/local
hive=`jq '.hive' info.json`
if [[ $hive == *yes* ]] && [[ $hadoop == *3.3* ]] 
then
    if [[ -d "/usr/local/kockpit-tools/apache-hive-3.1.2-bin" ]]
    then
        echo "Hive is already installed in your filesystem."
    else
        echo "Hive does not exist. Downloading Hive"
        cd /usr/local/kockpit-tools/
        sudo wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
        sudo tar xzf apache-hive-3.1.2-bin.tar.gz
        sudo rm -rf apache-hive-3.1.2-bin.tar.gz
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/bin/
        sudo chmod 777 hive-config.sh 
        echo "export HADOOP_HOME=/usr/local/kockpit-tools/hadoop-3.3.2" >> hive-config.sh
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/
        sudo wget https://github.com/Anmol-Recker/Hive/archive/refs/heads/main.zip
        sudo apt install unzip
        sudo unzip main.zip
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/Hive-main/
        sudo mv hive-site.xml /usr/local/kockpit-tools/apache-hive-3.1.2-bin/conf/
        cd /usr/local/kockpit-tools/apache-hive-3.1.2-bin/lib/
        sudo rm guava-19.0.jar
        sudo wget https://github.com/Anmol-Recker/Hive/raw/main/guava-27.0-jre.jar
    fi
else
    echo " "    
fi

####################################################Configuring SSH############################################################
echo " "
echo "==================================================="
echo "==================================================="
read -t 1 -p "<<<<<Configuring SSH>>>>>"
if [[ -d "/usr/local/kockpit-tools/SSH" ]]
then
    echo "SSH keys already generated."
else
    sudo mkdir /usr/local/kockpit-tools/SSH
    echo "Installing openssh-server"
    sudo apt-get install openssh-server
    ssh-keygen -t rsa # Replace with your command.
    sudo cat ~/.ssh/id_rsa.pub >>  ~/.ssh/authorized_keys
    chmod 700 ~/.ssh/
    read -t 2 -p "Transfering Keys to Slave Servers"
    cd /usr/local/
    user=`jq '.user' info.json`
    sudo touch SSH.sh
    sudo chmod 777 SSH.sh
    jq -c '.masterIP1[]' info.json |
    while read i;
    do
        echo "sudo ssh-copy-id -i /home/$user/.ssh/id_rsa.pub $user@$i" | sed "s/['\"]//g" >> SSH.sh
    done
    /bin/bash SSH.sh
    sudo rm -rf SSH.sh
    sudo service ssh --full-restart
    service ssh status
fi

###################################################### Installing Airflow #####################################################
echo " "    
cd /usr/local
airflow=`jq '.airflow' info.json`
#echo $airflow | sed "s/['\"]//g"
if [[ $airflow == *yes* ]] 
then
    echo "Looking for Airflow in your system."
    if [[ -d "/usr/local/kockpit-tools/env_airflow" ]]
    then
        echo "Airflow is already installed in your filesystem."
    else
        echo " "
        echo "==================================================="
        echo "==================================================="
        read -t 1 -p "<<<<<Installing Airflow V2.1>>>>>" 
        echo " "
        echo "Apache Airflow does not exist. Downloading Apache Airflow"
        cd /usr/local/kockpit-tools/
        yes | sudo -H pip3 install --ignore-installed PyYAML
        yes | sudo apt install python3-pip
        yes | sudo apt-get install python3-venv
        yes | sudo python3 -m venv env_airflow
        source env_airflow/bin/activate
        yes | sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
        yes | sudo -H python3 -m pip install cffi
        yes | sudo -H pip3 install WTForms==2.3.3
        yes | sudo pip3 install apache-airflow
        airflow db init
        cd /usr/local/kockpit-tools/
        flask fab
        airflow users  create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin
        cd /usr/local/
        sudo touch user2.txt
        sudo chmod 777 user2.txt
        user=`jq '.user' info.json`
        echo $user | sed "s/['\"]//g" > user2.txt
        user2=`awk 'FNR ==1 {print $1}' /usr/local/user2.txt`
        cd /home/$user2/airflow/
        #cd /home/$USER/airflow/
        sudo mkdir dags
        cd /usr/local/kockpit-tools/
        source env_airflow/bin/activate
        airflow webserver -p 8181 -D
        airflow scheduler -D
    fi
else
    echo "Airflow Installation Skipped"    
fi

###################################################### Installing Postgres #####################################################
cd /usr/local
postgres=`jq '.postgres' info.json`
#echo $postgres | sed "s/['\"]//g"
if [[ $postgres == *yes* ]] 
then
    echo "Looking for Postgres in your system."
    if [[ -d "/usr/local/kockpit-tools/Postgres" ]]
    then
        echo "Postgres is already installed in your filesystem."
    else
        echo " "
        echo "==================================================="
        echo "==================================================="
        read -t 3 -p "<<<<<Installing Postgres>>>>>" 
        echo " "
        
        cd /usr/local/kockpit-tools
        sudo mkdir Postgres
        yes | sudo apt install postgresql-10
        yes | sudo apt install postgresql postgresql-contrib
    fi
else
    echo "Postgresql Installation Skipped"
fi 

###################################################### Installing MySQL #####################################################
echo " "
cd /usr/local
mysql=`jq '.mysql' info.json`
#echo $mysql | sed "s/['\"]//g"
if [[ $mysql == *yes* ]] 
then
    echo "Looking for MYSQL in your system."
    if [[ -d "/usr/local/kockpit-tools/MYSQL" ]]
    then
        echo "MYSQL is already installed in your filesystem."
    else
        echo " "
        echo "==================================================="
        echo "==================================================="
        read -t 3 -p "<<<<<Installing MYSQL>>>>>" 
        echo " "
        cd /usr/local/kockpit-tools
        sudo mkdir MYSQL
        yes | sudo apt-get install mysql-server
        echo " "
        mysql --version
        sudo mysql_secure_installation
        sudo systemctl restart mysql
        sudo systemctl enable mysql
        sudo systemctl start mysql
    fi    
else
    echo "MYSQL Installation Skipped"
fi

###################################################### Installing MongoDB #####################################################
echo " "
cd /usr/local
mongodb=`jq '.mongodb' info.json`
#echo $mongodb | sed "s/['\"]//g"
if [[ $mongodb == *yes* ]] 
then
    echo "Looking for MongoDB in your system."
    if [[ -d "/usr/local/kockpit-tools/MongoDB" ]]
    then
        echo "MongoDB is already installed in your filesystem."
    else
        echo " "
        echo "==================================================="
        echo "==================================================="
        read -t 3 -p "<<<<<Installing MongoDB>>>>>" 
        echo " "
        cd /usr/local/kockpit-tools
        sudo mkdir MongoDB
        yes | sudo apt-get install mongodb
        mongo --version
    fi    
else
    echo "MongoDB Installation Skipped"
fi


######################################################### Installing MSSQL #####################################################
echo " "
cd /usr/local
mssql=`jq '.mssql' info.json`
#echo $mongodb | sed "s/['\"]//g"
if [[ $mssql == *yes* ]] 
then
    echo "Looking for MSSQL in your system."
    if [[ -d "/usr/local/kockpit-tools/MSSQL" ]]
    then
        echo "MSSQL is already installed in your filesystem."
    else
        echo " "
        echo "==================================================="
        echo "==================================================="
        read -t 3 -p "<<<<<Installing MSSQL>>>>>" 
        echo " "

        cd /usr/local/kockpit-tools
        sudo mkdir MSSQL
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
        sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"
        curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
        curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
        #echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
        
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt install mssql-server -y
        sudo /opt/mssql/bin/mssql-conf setup
        #systemctl status mssql-server
        sudo apt-get update
        sudo apt install mssql-tools -y
        #eval "$(cat ~/.bashrc | tail -n +10)"
        sudo ufw allow 1433
        sudo ufw allow 1434
    fi 
else
    echo "MSSQL Installation Skipped"
fi
echo -e "####Kockpit Signal Abort####"