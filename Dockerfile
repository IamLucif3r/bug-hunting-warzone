FROM kalilinux/kali-rolling:latest

LABEL maintainer="Anmol Singh Yadav (@IamLucif3r)" \
      description="A ready to hunt container for bug hunting" \
      version="1.0"

# Environment Variables
ENV HOME /root

WORKDIR /root

RUN mkdir ${HOME}/tools
RUN mkdir ${HOME}/wordlist 

# Installing the necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    iputils-ping\
    git \
    vim \
    wget \
    tar \
    zip \
    curl \
    make \
    nmap \
    whois \
    python3 \
    python3-pip \
    perl \
    nikto \
    dnsutils \
    net-tools \
    feroxbuster \
    python3 \
    python3-pip

RUN apt-get update && \
    apt-get upgrade -y 

# Installing Golang
RUN wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz &&\
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz &&\
    export PATH=$PATH:/usr/local/go/bin 

ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

# Seclists
RUN cd ${HOME}/wordlist \
    wget -cq https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/wordlists/SecList.zip \
    cd /usr/share/wordlists/  \
    unzip -o /usr/share/wordlists/SecList.zip \
    mv SecLists-master SecLists \
    rm -f /usr/share/wordlists/SecList.zip \
    cd ${HOME}

# Go-Buster
RUN cd ${HOME}/tools && \
    git clone https://github.com/OJ/gobuster.git && \
    cd gobuster && \
    go get && go install

# Dependencies
RUN pip3 install --upgrade setuptools && \
    pip3 install pyyaml pymongo requests s3recon

# Nuclei
RUN go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# Subfinder
RUN GO111MODULE=on go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Amass
RUN go install github.com/OWASP/Amass/v3/...

# Arjun
RUN pip3 install arjun

# XSStrike
RUN cd ${HOME}/tools\
    git clone https://github.com/s0md3v/XSStrike.git \
    cd ${HOME} 

# GAU
RUN go install github.com/lc/gau/v2/cmd/gau@latest

# Headi
RUN go install github.com/mlcsec/headi@latest

#Subjack
RUN go install github.com/haccer/subjack@latest

#SubOver
RUN go install github.com/Ice3man543/SubOver@latest

# FFUF
RUN go install github.com/ffuf/ffuf@latest

# HTTProbe
RUN go install github.com/tomnomnom/httprobe@latest

#Gitgrabber
RUN cd ${HOME}/tools && \
    git clone https://github.com/hisxo/gitGraber.git && \
    cd gitGraber && \
    ln -sf ${HOME}/tools/gitGraber/gitGraber.py /usr/local/bin/gitGraber

RUN go install github.com/tomnomnom/waybackurls@latest