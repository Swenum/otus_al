terraform {
  required_providers {
    ah = {
      source = "advancedhosting/ah"
      version = "0.1.3"
    }
    
  }
}


provider "ah" {
  access_token = var.auth_token_ah
}

resource "ah_cloud_server" "example" {
  name = "First-Server"
  datacenter = var.datacenter_ah
  image = "centos-7-x64"
  product = "start-xs"
  ssh_keys = var.ssh_keys_ah
}



locals {
 ipsLocals=flatten(ah_cloud_server.example.*.ips)
}
### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
   {
     ip_address = local.ipsLocals.*.ip_address
   }
 )
  filename = "ansible/hosts"
}