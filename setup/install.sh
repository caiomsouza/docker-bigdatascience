#!/bin/bash

#OPT=$1
#INSTALL_DIR=`pwd`
#PDI_BUILD=${INSTALL_DIR}/pdi
#BISERVER_BUILD=${INSTALL_DIR}/biserver
#RUN_STACK="docker-compose up -d"

sudo apt-get -y install wget git

# Docker Installer
sudo wget https://raw.githubusercontent.com/it4biz/ubuntu-docker-installer/master/ubuntu-docker-installer.sh
sudo sh ubuntu-docker-installer.sh

#NLTK Installer
sudo sh setup/nltk-installer.sh

#NLTK ALL Data Installer
sh setup/nltk-installer-all-data.sh

#cd ${PDI_BUILD} && sh ${PDI_BUILD}/build.sh
#cd ${BISERVER_BUILD} && sh ${BISERVER_BUILD}/build.sh
#cd ${INSTALL_DIR}

# ubuntu 16.04

# Install Java 8
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
java -version

# Install git
sudo apt-get install git

# Install wget
sudo apt-get install wget

# Install Apache Spark
sudo mkdir /usr/local/share/spark
sudo curl http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2.tgz | sudo tar xvz -C /usr/local/share/spark
cd /usr/local/share/spark/spark-2.0.2
sudo ./build/mvn -DskipTests clean package


[INFO] Reactor Summary:
[INFO] 
[INFO] Spark Project Parent POM ........................... SUCCESS [01:10 min]
[INFO] Spark Project Tags ................................. SUCCESS [ 23.510 s]
[INFO] Spark Project Sketch ............................... SUCCESS [  7.369 s]
[INFO] Spark Project Networking ........................... SUCCESS [ 14.190 s]
[INFO] Spark Project Shuffle Streaming Service ............ SUCCESS [  6.794 s]
[INFO] Spark Project Unsafe ............................... SUCCESS [ 11.479 s]
[INFO] Spark Project Launcher ............................. SUCCESS [ 19.824 s]
[INFO] Spark Project Core ................................. SUCCESS [03:28 min]
[INFO] Spark Project GraphX ............................... SUCCESS [ 16.796 s]
[INFO] Spark Project Streaming ............................ SUCCESS [01:43 min]
[INFO] Spark Project Catalyst ............................. SUCCESS [01:42 min]
[INFO] Spark Project SQL .................................. SUCCESS [01:56 min]
[INFO] Spark Project ML Local Library ..................... SUCCESS [  8.662 s]
[INFO] Spark Project ML Library ........................... SUCCESS [01:25 min]
[INFO] Spark Project Tools ................................ SUCCESS [  2.857 s]
[INFO] Spark Project Hive ................................. SUCCESS [ 48.357 s]
[INFO] Spark Project REPL ................................. SUCCESS [  5.217 s]
[INFO] Spark Project Assembly ............................. SUCCESS [  2.622 s]
[INFO] Spark Project External Flume Sink .................. SUCCESS [  9.378 s]
[INFO] Spark Project External Flume ....................... SUCCESS [  9.937 s]
[INFO] Spark Project External Flume Assembly .............. SUCCESS [  2.662 s]
[INFO] Spark Integration for Kafka 0.8 .................... SUCCESS [ 11.350 s]
[INFO] Spark Project Examples ............................. SUCCESS [ 22.037 s]
[INFO] Spark Project External Kafka Assembly .............. SUCCESS [  4.117 s]
[INFO] Spark Integration for Kafka 0.10 ................... SUCCESS [ 10.486 s]
[INFO] Spark Integration for Kafka 0.10 Assembly .......... SUCCESS [  3.456 s]
[INFO] Kafka 0.10 Source for Structured Streaming ......... SUCCESS [  8.321 s]
[INFO] Spark Project Java 8 Tests ......................... SUCCESS [  5.474 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 15:43 min
[INFO] Finished at: 2017-02-15T07:24:54-08:00
[INFO] Final Memory: 83M/825M
[INFO] ------------------------------------------------------------------------
pentaho@ubuntu:/usr/local/share/spark/spark-2.0.2$


# Install R
sudo apt-get install r-base

# Install R DevTools
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev
sudo su - -c "R -e \"install.packages('devtools', repos = 'http://cloud.r-project.org/')\""

# Install Sparklyr
sudo su - -c "R -e \"install.packages('sparklyr', repos = 'http://cran.rstudio.com/')\""

# Install SparkR from github.com/amplab-extras 
sudo su - -c "R -e \"devtools::install_github('amplab-extras/SparkR-pkg', subdir='pkg')\""


# Install Python Pip
sudo apt install python-pip

# Install Numpy
sudo pip install numpy



# Spark Home folder:
/usr/local/share/spark/spark-2.0.2

# Run Spark Test
./bin/run-example SparkPi 10

# Run Spark Shell
./bin/spark-shell --master local

# Spark CSV
./bin/spark-shell --packages com.databricks:spark-csv_2.11:1.5.0

# Exit Scala Shell Console
sys.exit

# Run PySparkq
./bin/pyspark --master local[2]

# Run WordCount Example
./bin/pyspark examples/src/main/python/wordcount.py file_name_to_count.txt

# Real Example
./bin/spark-submit examples/src/main/python/wordcount.py /home/pentaho/Downloads/sentiment\ labelled\ sentences/sentiment\ labelled\ sentences/amazon_cells_labelled.txt

# Random Forest Example
./bin/spark-submit examples/src/main/python/ml/random_forest_classifier_example.py



# Exit PySpark Shell Console
exit()



CREATE TABLE cars
USING com.databricks.spark.csv
OPTIONS (path "/home/pentaho/Desktop/dataset/cars.csv", header "true", inferSchema "true")




./bin/spark-submit examples/src/main/python/kmeans.py



# Other types of builds

# Apache Hadoop 2.7.X and later
./build/mvn -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.0 -DskipTests clean package

# Apache Hadoop 2.4.X with Hive 1.2.1 support
./build/mvn -Pyarn -Phadoop-2.4 -Dhadoop.version=2.4.0 -Phive -Phive-thriftserver -DskipTests clean package





