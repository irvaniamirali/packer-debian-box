# Packer Debian 13 Box

A simple Packer template to build a Debian 13 VM with essential packages installed.

## Features

- Debian 13 Netinstall
- Essential packages: git, curl, vim, htop
- Creates a projects folder at `/home/vagrant/projects`
- Outputs a ready-to-use Vagrant box

## Usage

```bash
packer init debian13.pkr.hcl
packer build debian13.pkr.hcl
vagrant box add debian13-custom debian13-custom.box
vagrant init debian13-custom
vagrant up
```

