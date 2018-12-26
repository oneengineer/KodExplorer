FROM ubuntu:18.10


ENV LANG C.UTF-8

RUN mkdir /app

WORKDIR /app

RUN apt-get update && apt-get -y install wget && apt-get -y install sudo
RUN apt-get install -y net-tools htop && apt-get install -y git

RUN wget https://www.apachefriends.org/xampp-files/7.3.0/xampp-linux-x64-7.3.0-0-installer.run && \
    chmod +x xampp-linux-x64-7.3.0-0-installer.run && \
    ./xampp-linux-x64-7.3.0-0-installer.run


RUN mkdir /app/www && \ 
    rm -rf /opt/lampp/htdocs && \
    ln -s /app/www /opt/lampp/htdocs
    
    
#-------------- install KodExplorer -------
WORKDIR /app/www


WORKDIR /app
RUN git clone https://github.com/oneengineer/KodExplorer.git
WORKDIR /app/KodExplorer

#RUN git checkout tags/4.36
RUN git checkout master

WORKDIR /app
RUN rm -rf www/* && mv KodExplorer/* www/ && \
    chmod -Rf 777 www
# KodExplorer defult use data folder, make backup of it, preserve privilege
RUN chown -R daemon:daemon www/data && cp -rp www/data/ data/ 
#--------------

WORKDIR /app

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
#RUN rm -rf /www/*

EXPOSE 80 
EXPOSE 8000
EXPOSE 8080
EXPOSE 443

#mysql is for store data
VOLUME /opt/lampp/var/mysql /home /app/www/data

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/opt/lampp/lampp", "start"]
