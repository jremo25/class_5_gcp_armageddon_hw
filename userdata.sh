#!/bin/bash
sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get upgrade -yq 

#install git
sudo apt install git -y && \

sudo apt install -y nginx  && \
sudo cat <<EOF > /var/www/html/index.html
<html><body>
<h1>Hello, Class 5.5</h1>
<br/>
Hostname: $(curl "http://metadata.google.internal/computeMetadata/v1/instance/hostname" -H "Metadata-Flavor: Google")
<br/>
Instance ID: $(curl "http://metadata.google.internal/computeMetadata/v1/instance/id" -H "Metadata-Flavor: Google")
<br/>
Project ID: $(curl "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")
<br/>
Zone ID: $(curl "http://metadata.google.internal/computeMetadata/v1/instance/zone" -H "Metadata-Flavor: Google")
<br/>
</body></html>
EOF