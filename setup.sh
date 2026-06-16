#!/usr/bin/env bash
# Быстрая подготовка к первому запуску парсера на VPS.
set -e

cd "$(dirname "$0")"

if [ ! -f config.toml ]; then
  cp config.example.toml config.toml
  echo "Создан config.toml из шаблона. Откройте его и заполните vk_token, vk_user_id, proxy_string."
else
  echo "config.toml уже существует — пропускаю."
fi

# database.db должна существовать как файл, иначе docker создаст каталог.
[ -e database.db ] || touch database.db
mkdir -p result

echo "Готово. Дальше: отредактируйте config.toml, затем запустите: make run (или docker compose up -d)"
