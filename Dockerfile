FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y
RUN apt install sudo wget curl tar zip nano runit -y
COPY ./setup.sh ./
CMD sed -i 's/\r//' setup.sh && ./setup.sh
