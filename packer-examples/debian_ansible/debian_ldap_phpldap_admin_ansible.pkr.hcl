##
##

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# source blocks configure your builder plugins; your source is then used inside
# build blocks to create resources. A build block runs provisioners and
# post-processors on an instance created by the source.
source "amazon-ebs" "example" {
  ami_name      = "packaer_debian_ldap_phpldapadmin"
  instance_type = "t2.micro"
  region 	= "us-east-1"
  source_ami_filter {
    filters = {
      #name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      #https://wiki.debian.org/Cloud/AmazonEC2Image/Bullseye
      #The current AMI names are:
	#debian-11-arm64-20230124-1270
	#debian-11-amd64-20230124-1270
	#SSH to Debian instances as user admin using your SSH key, and then sudo -i to gain root access.
	#The AMIs are owned by AWS account ID 136693071363 and can be launched via the AWS Marketplace or directly 
	#using the AMI IDs listed below.
	#us-east-1 ARM: ami-0e6694e5116a0086f AMD: ami-0fec2c2e2017f4e7b
	#
      name = "debian-11-amd64-20230124-1270"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["136693071363"]
  }
  ssh_username = "admin"
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    inline = [
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install -y tree nmap vim ",
    ]
  }
  
  provisioner "ansible" {
    playbook_file = "./playbook_packer.yaml"
  }

}

