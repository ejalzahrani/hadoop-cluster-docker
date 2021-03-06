#!/bin/bash

# test the hadoop cluster by running wordcount

# create input files 
mkdir input
echo "eidah eidah eidah eidah al ala lala lala lala la la laala llaa " >input/file2.txt
wget https://raw.githubusercontent.com/ejalzahrani/hadoop-cluster-docker/master/config/DataGoogleTrace
cat DataGoogleTrace >input/file1.txt

#echo "eidah al lal eidah alzahrani faten faten" >input/file1.txt

# create input directory on HDFS
hadoop fs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./input/* input

# run wordcount 
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output

# print the input files
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000

