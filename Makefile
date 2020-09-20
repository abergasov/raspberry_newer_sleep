install:
	@echo "-- copy file"
	sudo cp ./main.py /usr/sbin/rns

	@echo "-- creating crontab"
	(crontab -l ; echo "*/5 * * * * env DISPLAY=:0 /usr/bin/python3 /usr/sbin/rns")| crontab -