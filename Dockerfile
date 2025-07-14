FROM jupyter/datascience-notebook:latest

USER root



# RUN apt-get -y update  && apt-get install -y gcc unixodbc-dev=2.3.7 g++

RUN pip3 install pyodbc

RUN apt-get update && apt-get install -y gnupg2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17 odbcinst=2.3.7 odbcinst1debian2=2.3.7 unixodbc-dev=2.3.7 unixodbc=2.3.7

RUN pip3 install redshift_connector

RUN pip3 install openpyxl

RUN curl -O -L https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar.gz

RUN gunzip mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar.gz

RUN tar xvf mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar

RUN cd mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit 

RUN cp /home/jovyan/mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit/bin/* /usr/local/bin 

RUN cp -r /home/jovyan/mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit/lib/* /usr/local/lib

RUN myodbc-installer -a -d -n "MySQL ODBC 8.0 Driver" -t "Driver=/usr/local/lib/libmyodbc8w.so"

RUN apt-get install -y openjdk-17-jdk

RUN export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

RUN export PATH=$PATH:$JAVA_HOME/bin

RUN curl -L -O https://repo1.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar

RUN pip3 install JayDeBeApi

RUN myodbc-installer -a -d -n "MySQL ODBC 8.0" -t "Driver=/usr/local/lib/libmyodbc8a.so"

RUN apt-get -y install postgresql && apt-get install libpq-dev -y

RUN pip3 install psycopg2

RUN rm -f mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar

RUN rm -rf mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit

RUN pip3 install sqlalchemy

RUN pip3 install pymysql

RUN pip3 intsall slack_sdk

RUN pip3 install atlassian

# RUN pip3 uninstall jupyterlab --y

# RUN pip3 install jupyterlab==4.0.4 

# RUN pip3 install jupyter_ai
