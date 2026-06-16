.PHONY: setup run stop restart logs update pull ps shell clean

# Подготовка: создать config.toml, database.db, result/
setup:
	./setup.sh

# Запуск парсера в фоне (24/7)
run:
	docker compose up -d

# Остановить и удалить контейнер
stop:
	docker compose down

# Перезапуск (например, после правки config.toml)
restart:
	docker compose restart

# Логи в реальном времени
logs:
	docker compose logs -f

# Пересобрать образ парсера из исходников и перезапустить
# (новую версию задайте тегом в docker-compose.yml)
update:
	docker compose build --pull
	docker compose up -d

# Статус контейнера
ps:
	docker compose ps

# Зайти внутрь контейнера
shell:
	docker compose exec parser_avito bash

# Полная очистка (контейнер + образ)
clean:
	docker compose down --rmi all
