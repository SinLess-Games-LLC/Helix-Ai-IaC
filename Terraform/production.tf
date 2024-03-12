resource "proxmox_vm_qemu" "k8s-masters-production" {
  count = 3
  name = "k8s-master-${count.index + 1}-production"
  vmid = 200 + count.index
  desc = "Kubernetes Master Node ${count.index + 1}, created by Terraform on ${local.buildtime}  This is part of the production environment"
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
    size = "100G"
    type = "scsi"
    storage = "Group_4"
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

  ipconfig0 = "ip=192.168.86.${100 + count.index}/24,gw=192.168.86.1"

  ssh_user = "sinless777"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

}

resource "proxmox_vm_qemu" "k8s-workers-production" {
  count = 4
  name = "k8s-worker-${count.index + 1}-production"
  vmid = 250 + count.index
  desc = "Kubernetes Worker Node ${count.index + 1}, created by Terraform on ${local.buildtime}  This is part of the production environment"
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
    size = "100G"
    type = "scsi"
    storage = "Group_3"
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

  ipconfig0 = "ip=192.168.86.${150 + count.index}/24,gw=192.168.86.1"

  ssh_user = "sinless777"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

}

