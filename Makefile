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

# Обновить образ парсера до последней версии и перезапустить
update: pull
	docker compose up -d

pull:
	docker compose pull

# Статус контейнера
ps:
	docker compose ps

# Зайти внутрь контейнера
shell:
	docker compose exec parser_avito bash

# Полная очистка (контейнер + образ)
clean:
	docker compose down --rmi all
