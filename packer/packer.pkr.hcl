packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  default = "us-east-2"
}

source "amazon-ebs" "ubuntu_app" {
  ami_name      = "patientcare-api-ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu_app"]


  provisioner "file" {
    source      = "../target/patientcare-api-0.0.1-SNAPSHOT.jar"
    destination = "/tmp/patientcare.jar"
  }

  provisioner "shell" {
    inline = [
      "sudo rm -rf /etc/apt/apt.conf.d/50command-not-found",
      "sudo apt-get update",
      "sudo apt install -y openjdk-17-jdk",
      "sudo mkdir -p /opt/app",
      "echo 'Copying jar...' && sleep 2",
      "sudo cp /tmp/patientcare.jar /opt/app/patientcare.jar",
    ]
  }
}

