!#/bin/bash

#ISP
Vboxmanage createvm --name ISP --ostype RedHat_64 --register
VBoxManage modifyvm ISP --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm ISP --nic1 nat
VBoxManage modifyvm ISP --nic2 intnet
VBoxManage modifyvm ISP --intnet2 ISP-HQ
VBoxManage modifyvm ISP --nic3 intnet
VBoxManage modifyvm ISP --intnet3 ISP-BR
VBoxManage storagectl ISP --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach ISP --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./isp.vdi

#HQ-RTR
Vboxmanage createvm --name HQ-RTR --ostype RedHat_64 --register
VBoxManage modifyvm HQ-RTR --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm HQ-RTR --nic1 intnet
VBoxManage modifyvm HQ-RTR --intnet1 ISP-HQ
VBoxManage modifyvm HQ-RTR --nic2 intnet
VBoxManage modifyvm HQ-RTR --intnet2 SRV-Net
VBoxManage modifyvm HQ-RTR --nic3 intnet
VBoxManage modifyvm HQ-RTR --intnet3 CLI-Net
VBoxManage storagectl HQ-RTR --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach HQ-RTR --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./hq_rtr.vdi

#BR-RTR
Vboxmanage createvm --name BR-RTR --ostype RedHat_64 --register
VBoxManage modifyvm BR-RTR --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm BR-RTR --nic1 intnet
VBoxManage modifyvm BR-RTR --intnet1 ISP-BR
VBoxManage modifyvm BR-RTR --nic2 intnet
VBoxManage modifyvm BR-RTR --intnet2 BR-Net
VBoxManage storagectl BR-RTR --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach BR-RTR --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./br_rtr.vdi

#HQ-SRV
Vboxmanage createvm --name HQ-SRV --ostype RedHat_64 --register
VBoxManage modifyvm HQ-SRV --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm HQ-SRV --nic1 intnet
VBoxManage modifyvm HQ-SRV --intnet1 SRV-NET
VBoxManage storagectl HQ-SRV --name "SATA Controller" --add sata --bootable on
Vboxmanage storageattach HQ-SRV --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./hq_srv.vdi

#HQ-CLI
Vboxmanage createvm --name HQ-CLI --ostype RedHat_64 --register
VBoxManage modifyvm HQ-CLI --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm HQ-CLI --nic1 intnet
VBoxManage modifyvm HQ-CLI --intnet1 CLI-NET
VBoxManage storagectl HQ-CLI --name "SATA Controller" --add sata --bootable on
Vboxmanage storageattach HQ-CLI --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./hq_cli.vdi

#BR-SRV
Vboxmanage createvm --name BR-SRV --ostype RedHat_64 --register
VBoxManage modifyvm BR-SRV --cpus 4 --memory 4096 --vram 12
VBoxManage modifyvm BR-SRV --nic1 intnet
VBoxManage modifyvm BR-SRV --intnet1 BR-Net
VBoxManage storagectl BR-SRV --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach BR-SRV --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./br_srv.vdi