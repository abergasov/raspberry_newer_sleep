install:
	@echo "-- copy file"
	sudo cp ./main.py /usr/sbin/rns

	@echo "-- creating crontab"
	(crontab -l ; echo "* * * * * env DISPLAY=:0 /usr/bin/python3 /usr/sbin/rns")| crontab -