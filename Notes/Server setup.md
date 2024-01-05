---
type: Tutorial
---

 This is a tutorial for setting up a/my Linux server.

The examples that are going to be used on a Ubuntu Server 22.04 LTS

The user that i am going to be using is : Poaclu (username : poaclu) because that's me.
The server name that I'm going to be using is : Nomex because i used to have a server named kevlar and wanted a similar name.

Since this is a server setup, i wont tell you how to install stuff on the client side, i will tell you what should be needed but not how to install or use it.

My server setup will have a few things:
- SSH server, once this is setup, i will physically put away my server behind my desk, so my computers keyboard (i only have the one) and my extra monitor wont be able to be on the server.
- an SSH connexion to github. (for downloading my repos) (optional but i will use it)
- zsh, because I'm used to it and have a common zshrc file for all my linux devices.
- Docker, for hosting/containing all of my services.
# 1. Connect via SSH

## (Pre-step) : preparation : 
In my case, since i use a server based linux distribution, i didn't really have to think about the ssh server used. I do know that it is openssh-server, so if needed, here's how to install the package:

You will need a direct connexion to the server, you will have to do this after the setup.
You will obviously need to login, then run this command to install :
```shell
sudo apt install openssh-server
```

Then this needs to be launched as a daemon, this command activates it and makes it launch at startup:
```shell
sudo systemctl enable --now ssh.service
```

You can now proceed to connecting from your client. 
## First step : connecting via SSH
```shell
ssh <user>@<server>
```
```shell
ssh poaclu@nomex
```
Then enter the password that you chose for your user on that server.

## Second step : key-based connexion
Once that connexion is working, you should use key based authentication for both security and ease of use.
```shell
ssh-copy-id <user>@<server>
```
```shell
ssh-copy-id poaclu@nomex
```
You should then test the connection :
```shell
ssh <user>@<server>
```
```shell
ssh poaclu@nomex
```
If the connection worked everything should be good !

After that, you should probably close out the connexion to the server to ONLY use key based authentication. This is modified in the file */etc/ssh/sshd_config* :
```shell
sudo nvim /etc/ssh/sshd_config
```
(To execute nvim, you will need to install it):
```shell
sudo apt install neovim
```
(Or go with nano, it's pre-installed on Ubuntu):
```shell
sudo nano /etc/ssh/sshd_config
```

Modify the line :
```
PasswordAuthentication yes
```

To the line:
```
PasswordAuthentication no
```

Once that thing is done, you will need to restart the ssh daemon : 
```shell
systemctl restart ssh
```

# 2. Setting up the server to my liking

I use a very specific setup i have dotfiles hosted on a private github repo, i will need to configure SSH keys to github.

## Setting up SSH keys for GitHub

## Generating the ssh key

First, you will have to generate the ssh key:
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```
then press enter 3 times, it will ask you where to save the file, since this is our server we jut setup, you shouldn't all ready have one. Then it should ask you for a passphrase, it isn't needed.
Here's the official documentation page if needed : [LINK](https://docs.github.com/fr/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Adding SSH key to the ssh-agent

Before adding a new SSH key to the ssh-agent to manage your keys, you should have checked for existing SSH keys and generated a new SSH key:

Start the ssh-agent in the background:
```shell
eval "$(ssh-agent -s)"
```

Add your SSH private key to the ssh-agent:
```shell
ssh-add ~/.ssh/id_ed25519
```

## Adding the SSH key to your GitHub account

Get the ssh key :
```shell
cat ~/.ssh/id_ed25519.pub
```

Then go to the SSH keys part of you GitHub account settings : [LINK](https://github.com/settings/keys)

Click on the [**New SSH key**](https://github.com/settings/ssh/new)

Enter a title/name for your ssh key : mine is nomex-server.

Put the ssh key that you got previously in the **key** section.

## Test SSH connexion to GitHub

Once this setup is all done, you might want to test the connexion.
```shell
ssh -T git@github.com
```

If you get "Hi *user*! You've successfully authenticated, but GitHub does not provide shell access." You have successfully setup SSH key connexion to GitHub.

## Get the dotfiles 

I put my dotfiles in GitHub, that's why I setup the github ssh keys. I get my dotfiles from a private repo.

Here's how i clone the repo :
```shell
cd ~
git clone git@github.com:Poaclu/dotfiles .dotfiles
```

I can now use all of my dotfiles:
```shell
ln -rsf .dotfiles/.zshrc .zshrc
```

```shell
sudo apt-get remove \
	docker \
	docker-engine \
	docker.io \
	containerd \
	runc
```

```shell
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    cargo \
    git \
    btop \
    glances \
    zsh \
    neovim \
    tar \
    cmake \
    neofetch \
    libssl-dev \
    exa \
    build-essential \
    pkg-config \
    ntp
    ```

```shell
cargo install \
	topgrade \
	cargo-update \
	bat
```

```shell
sudo usermod --shell /bin/zsh poaclu
```

```shell
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```shell
sudo apt-get update
```

```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```shell
sudo docker run hello-world
```

```shell
sudo usermod -a -G docker poaclu
```

```shell
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```