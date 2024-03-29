resource "proxmox_vm_qemu" "Piholes" {
  count = 2
  name = "Pihole-${count.index + 1}"
  vmid = 100 + count.index + 1
  desc = "Pihole ${count.index + 1}, created by Terraform on ${local.buildtime}"
  target_node = var.proxmox_node
  clone = var.cloudinit_template_name
  full_clone = true
  onboot = true
  agent = 1
  os_type = "cloud-init"
  cores = 4
  sockets = 1
  cpu = "host"
  memory = 8192
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "Group_1"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.86.${80 + count.index}/24,gw=192.168.86.1"

  ssh_user = "sinless777"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

}