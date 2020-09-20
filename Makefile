install:
	@echo "-- copy file"
	sudo cp ./main.py /usr/sbin/rns

	@echo "-- creating service"
	sudo mkdir -p /etc/systemd/system
	sudo cp ssh_notify.service /etc/systemd/system/ssh_notify.service

	@echo "-- enable service"
	sudo service ssh_notify start && sudo systemctl enable ssh_notify