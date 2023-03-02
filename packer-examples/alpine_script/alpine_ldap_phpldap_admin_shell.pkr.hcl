##
##

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# source blocks configure your builder plugins; your source is then used inside
# build blocks to create resources. A build block runs provisioners and
# post-processors on an instance created by the source.
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

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.example"]

  provisioner "file" {
    destination = "/tmp/DB_CONFIG"
    source      = "./DB_CONFIG"
  }

  provisioner "file" {
    destination = "/tmp/edt-org.ldif"
    source      = "./edt-org.ldif"
  }

  provisioner "file" {
    destination = "/tmp/ldap.conf"
    source      = "./ldap.conf"
  }

  provisioner "file" {
    destination = "/tmp/slapd.conf"
    source      = "./slapd.conf"
  }

  provisioner "file" {
    destination = "/tmp/phpldapadmin.conf"
    source      = "./phpldapadmin.conf"
  }

  provisioner "file" {
    destination = "/tmp/config.php"
    source      = "./config.php"
  }

  provisioner "shell" {
    script = "./script.sh"
  }

}

