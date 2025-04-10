FROM alpine:3.14

RUN apk add --no-cache wget
RUN apk add --no-cache curl
RUN apk add --no-cache bash
RUN apk add --no-cache jq
RUN apk add --no-cache yq

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl   

RUN curl -sLO "https://github.com/argoproj/argo-workflows/releases/download/v3.6.5/argo-linux-amd64.gz"
RUN gunzip "argo-linux-amd64.gz"
RUN chmod +x "argo-linux-amd64"
RUN mv "./argo-linux-amd64" /usr/local/bin/argo

ENTRYPOINT bash

