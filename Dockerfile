FROM ubuntu:20.04
 
RUN apt update
RUN apt install nginx -y
RUN apt install curl nano wget net-tools bash -y 

RUN rm -f /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/default.conf
RUN chmod +x /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

#RUN mkdir /usr/share/nginx/html
#COPY index.html /usr/share/nginx/html

CMD sed -i "s|CHANGE_PORT|$PORT|g" /etc/nginx/conf.d/default.conf &&\ 
	nginx -g "daemon off;" 
 
