# cloud-computing

```
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pyenv install 3.10.4
pyenv virtualenv 3.10.4 cloudcomputing
pyenv  activate cloudcomputing

```

# doctl

```
https://docs.digitalocean.com/reference/doctl/how-to/install/

cd ~
wget https://github.com/digitalocean/doctl/releases/download/v1.124.0/doctl-1.124.0-linux-amd64.tar.gz

tar xf ~/doctl-1.124.0-linux-amd64.tar.gz

sudo mv ~/doctl /usr/local/bin

doctl auth init

```

#doctl serverless install
