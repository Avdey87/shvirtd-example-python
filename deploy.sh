#!/usr/bin/env bash
set -euo pipefail
REPO_URL="https://github.com/Avdey87/shvirtd-example-python.git"
TARGET_DIR="/opt/shvirtd-example-python"

if [ -d "$TARGET_DIR" ]; then
    echo ">>> Удаляем старый каталог $TARGET_DIR"
    sudo rm -rf "$TARGET_DIR"
fi

echo ">>> Клонируем $REPO_URL в $TARGET_DIR"
sudo mkdir -p /opt
sudo git clone "$REPO_URL" "$TARGET_DIR"
sudo chown -R "$USER":"$USER" "$TARGET_DIR"
cd "$TARGET_DIR"

echo ">>> Запускаем docker compose"
docker compose up -d --build

echo ">>> Готово. Проверка:"
echo "    curl -L http://127.0.0.1:8090"
