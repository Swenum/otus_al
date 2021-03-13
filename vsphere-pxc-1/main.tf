# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "terraform@vsphere.local"
  password     = var.auth_pass_vsphere
  vsphere_server = "10.1.1.111" 

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

# Deploy 3 linux VMs
module "example-server-linuxvm" {
  source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "2.1.0"
  vmtemp        = "by-test-terraform"
  instances     = 3
  vmname        = "example-server-linux"
  vmrp          = "10.200.10.14/Resources"
  network = {
    "VM Network" = ["", "", ""] # To use DHCP create Empty list ["",""]
  }
#  vmgateway         = "10.1.10.10"
  dc        = "Port1_Tower"
  datastore = "Dts_10.14_HDD1"
}

output "vmnames" {
  value = module.example-server-linuxvm.Linux-ip
}

output "vmnameswip" {
  value = module.example-server-linuxvm.Linux-guest-ip
}