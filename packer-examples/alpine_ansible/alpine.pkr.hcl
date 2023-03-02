##
##
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "example" {
  ami_name      = "packer__apine_ldap_phpldapadmin"
  instance_type = "t2.micro"
  region 	= "us-east-1"
  source_ami_filter {
    filters = {
      #https://alpinelinux.org/cloud/
      #The login user for the images is alpine. 
      #SSH keys for this user will be installed from the instance metadata service.
      #The current AMI names are:
        # owners 538276064493
        # alpine-3.17.2-x86_64-bios-tiny-r0
        # https://gitlab.alpinelinux.org/alpine/cloud/alpine-cloud-images
      #name = "alpine-3.17.2-x86_64-bios-tiny-r0"
      name = "alpine-3.17.2-x86_64-bios-cloudinit-r0"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["538276064493"]
  }
  ssh_username = "alpine"
}

build {
  sources = ["source.amazon-ebs.example"]

  # https://www.ansible.com/blog/ansible-and-packer-why-they-are-better-together
  provisioner "ansible" {
    playbook_file = "./playbook_packer.yaml"
    user = "alpine"
  }
}

