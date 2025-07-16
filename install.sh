#!/bin/bash

echo "📦 Updating APT packages..."
sudo apt update

echo "🔧 Installing Python, pip, build tools, and unzip..."
sudo apt install -y python3 python3-pip build-essential curl file git unzip

echo "🐍 Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -

# Add poetry to PATH for the current session
export PATH="$HOME/.local/bin:$PATH"

echo "📄 Creating or updating requirements.txt..."
cat > requirements.txt <<EOF
websocket-client
requests
beautifulsoup4
playwright
playwright-stealth
numpy
termcolor
pytz
httpx
niquests
pandas
numba
matplotlib
python-telegram-bot
Telethon
Candlestick
tqdm
PyYAML
psutil
certifi
Flask
ntplib
EOF


echo "📦 Installing Python dependencies from requirements.txt..."

python3 -m pip install --upgrade --ignore-installed pip setuptools --break-system-packages
python3 -m pip install -r requirements.txt --break-system-packages

python3 -m pip install --upgrade --ignore-installed blinker --break-system-packages

echo "🧠 Installing smartmoneyconcepts from GitHub..."
python3 -m pip install git+https://github.com/joshyattridge/smart-money-concepts.git --break-system-packages

echo "📦 Installing Poetry project dependencies..."
poetry install

echo "🧪 Installing Playwright + dependencies..."
playwright install-deps
playwright install

echo "💬 Installing Telethon, termcolor, pyfiglet..."
python3 -m pip install Telethon termcolor pyfiglet --break-system-packages

echo "📦 Setting up batcat and tmux..."
sudo apt install -y bat tmux

echo "✅ Done! You can now run your bot using Poetry:"
echo "   poetry run python app.py get_profile"
