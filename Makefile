install:
	@echo "-- copy file"
	sudo cp ./main.py /usr/sbin/rns

	@echo "-- creating service"
	sudo mkdir -p /etc/systemd/system
	sudo cp rns.service /etc/systemd/system/rns.service

	@echo "-- enable service"
	sudo service rns start && sudo systemctl enable rns