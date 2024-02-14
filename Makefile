start:
	@ docker-compose up --scale agent-android=2 --detach
	@ open http://localhost

stop:
	@ docker-compose down