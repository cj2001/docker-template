FROM python:3.6.3
MAINTAINER @wingr <wingr@github.com>

# send SIGQUIT to stop container
STOPSIGNAL SIGQUIT

RUN touch /etc/inside-container

COPY . /src
WORKDIR /src

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essential

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt