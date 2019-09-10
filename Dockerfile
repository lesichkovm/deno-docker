FROM ubuntu:19.04

ENV DENO_VERSION=0.11.0
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nano
RUN apt-get install -y curl
RUN apt-get install -y tzdata

# set timezone
RUN ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno_linux_x64.gz --output deno.gz
RUN gunzip deno.gz
RUN chmod 777 deno
RUN mv deno /usr/bin/deno
RUN apt-get remove -y curl
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY main.ts     /main.ts

EXPOSE 8080 443

CMD ["deno", "/main.ts", "--allow-all"]
