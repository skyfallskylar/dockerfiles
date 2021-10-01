FROM python:3.6.7

RUN pip freeze > requirements.txt

RUN pip3 install -r requirements.txt

RUN pip3 install jupyter

RUN pip3 install xgboost==0.81

RUN pip3 install Cython==0.29.2

RUN pip3 install pandas==0.23.4

RUN pip3 install numpy==1.14.6

RUN pip3 install scipy==1.2.0

RUN pip3 install sklearn==0.19.2

RUN pip3 install seaborn==0.9.0

RUN pip3 install matplotlib==3.0.2

RUN pip3 install re==2.2.1

