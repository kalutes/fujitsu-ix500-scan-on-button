FROM debian:bullseye-slim
RUN apt-get update && apt-get upgrade -y && \
    apt install \
        git \
        time \
        sane \
        sane-utils \
        scanbd \
        netpbm \
        ghostscript \
        poppler-utils \
        util-linux \
        units \
        bc \
        nano \
        texlive-extra-utils \
        python3 \
        python3-pip -y

WORKDIR /app
RUN git clone https://github.com/rocketraman/sane-scan-pdf.git
RUN mkdir /scans

RUN pip3 install pdfcropmargins

# Add the scanner VID:PID
RUN   echo "usb 0x04c5 0x132b" >> /etc/sane.d/fujitsu.conf
RUN   echo "usb 0x04c5 0x132b" >> /etc/scanbd/fujitsu.conf

COPY scanbd.conf /etc/scanbd/scanbd.conf
COPY scan.sh /etc/scanbd/scripts/scan.sh

VOLUME /scans

CMD scanbd -d1 -f
