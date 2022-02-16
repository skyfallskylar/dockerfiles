FROM jupyter/datascience-notebook:python-3.7.6  

USER root

RUN apt-get -y update  && apt-get install -y gcc unixodbc-dev

RUN pip install pyodbc

RUN apt-get update && apt-get install -y gnupg2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18

RUN pip install redshift_connector

RUN pip install openpyxl

RUN curl -O -L https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar.gz

RUN gunzip mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar.gz

RUN tar xvf mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit.tar

RUN cd mysql-connector-odbc-8.0.28-linux-glibc2.12-x86-64bit 

RUN cp bin/* /usr/local/bin 

RUN cp lib/* /usr/local/lib

RUN myodbc-installer -a -d -n "MySQL ODBC 8.0 Driver" -t "Driver=/usr/local/lib/libmyodbc8w.so"

RUN myodbc-installer -a -d -n "MySQL ODBC 8.0" -t "Driver=/usr/local/lib/libmyodbc8a.so"
