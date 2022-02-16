FROM jupyter/datascience-notebook:python-3.7.6

RUN apt-get update && apt-get install -y gcc unixodbc-dev

RUN pip install pyodbc

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18
