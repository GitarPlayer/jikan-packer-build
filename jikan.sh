# install dependencies
sudo apt-get update && sudo apt-get install -y git \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker key to apt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add the docker repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# install latest stable docker version
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# create jikan group 
sudo groupadd jikan
# create jikan user
sudo su -c "useradd jikan -s /bin/bash -m -g jikan -G docker"
echo jikan:1.mal-api | sudo chpasswd
# give him sudo rights
sudo usermod -aG sudo jikan
# change into his home directory
cd /home/jikan

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

who
# clone the dockerized version of Jikan
sudo git clone https://github.com/zunjae/JikanDockerized

# change the group to jikan
sudo chown -R jikan:jikan ./JikanDockerized/run.sh 
# make the bash script executable
sudo chmod -R +x ./JikanDockerized/run.sh


