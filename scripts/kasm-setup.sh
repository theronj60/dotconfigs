# create swap for kasm
sudo dd if=/dev/zero bs=1M count=1024 of=/mnt/1GiB.swap &&\
	sudo mkswap /mnt/1GiB.swap &&\
	sudo swapon /mnt/1GiB.swap &&\
	cat /proc/swaps &&\
	echo '/mnt/1GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab

# get kasm and run install
wget https://kasm-static-content.s3.amazonaws.com/kasm_release_1.11.0.18142e.tar.gz &&\
	tar -xf kasm_release*.tar.gz &&\
	sudo bash kasm_release/install.sh
