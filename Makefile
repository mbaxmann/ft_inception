NAME = inception

all: 
	@ mkdir -p /home/mbaxmann/data/mariadb_vol/
	@ mkdir -p /home/mbaxmann/data/wordpress_vol/
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@ docker-compose -f ./srcs/docker-compose.yml up -d
	
down:
	@ docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@ docker container prune; 

fclean: clean
	@ sudo rm -rf /home/mbaxmann/data/mariadb_vol
	@ sudo rm -rf /home/mbaxmann/data/wordpress_vol
	@ docker system prune -a

re: fclean all

.PHONY: up down clean fclean re all
