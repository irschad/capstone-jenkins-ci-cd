FROM python:3.7.3-stretch
	
WORKDIR /app
	
COPY . app.py /app/

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

#Install dependencies
#hadolint ignore=DL3008,DL3015
RUN apt-get -y install \
    python3-pip \
    python-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \

#Install requirements
RUN python -m pip3 install --trusted-host pypi.python.org -r requirements.txt

#Download corpora
RUN curl https://raw.githubusercontent.com/codelucas/newspaper/master/download_corpora.py | python3

# Expose port 5000
EXPOSE 5000

# Run app.py at container launch
CMD ["python3", "app.py"]
