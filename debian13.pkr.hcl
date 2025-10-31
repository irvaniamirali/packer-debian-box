packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.0"
      source  = "hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "debian13" {
  iso_url        = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso"
  iso_checksum   = "sha256:658b28e209b578fe788ec5867deebae57b6aac5fce3692bbb116bab9c65568b3"
  ssh_username   = "vagrant"
  ssh_password   = "vagrant"
  ssh_wait_timeout = "20m"

  vm_name        = "debian13-packer"
  guest_os_type  = "Debian_64"
  disk_size      = 10240
  memory         = 1024
  cpus           = 1

  # Boot command for unattended installation
  boot_command = [
    "<esc><wait>",
    "install <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
    "<enter>"
  ]
}

build {
  sources = ["source.virtualbox-iso.debian13"]

  # Provision shell script to install packages
  provisioner "shell" {
    script = "scripts/setup.sh"
  }

  # Produce Vagrant box
  post-processor "vagrant" {
    output = "debian13-custom.box"
  }
}

