FROM ubuntu:20.04
LABEL maintainer="aldiviantara"
LABEL version="4.4.0"
LABEL description="ExtraOrdinaryCBT v4.4.0 (Docker) [Unofficial]"
USER root
WORKDIR "/app"
RUN apt update && \
    apt install -y tzdata wget nano unzip
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > />
RUN wget https://s3.ekstraordinary.com/extraordinarycbt/release-ro>
RUN unzip exocbt.zip
RUN cp -R 4.4.0-rosetta-ubuntu/* .
RUN rm exocbt.zip
RUN rm -rf 4.4.0-rosetta-ubuntu
COPY entrypoint.sh .
COPY wait-for-it.sh .
RUN chmod +x *.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["./main-amd64"]
