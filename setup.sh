#!/usr/bin/env bash

set -e  # para o script parar em erro

# Nome do ambiente (pode passar como argumento)

ENV_NAME=${1:-.venv}

echo "📦 Criando ambiente virtual com uv..."
uv venv $ENV_NAME

echo "🔌 Ativando ambiente..."
source $ENV_NAME/bin/activate

echo "⬆️ Instalando dependências (jupyter + ipykernel)..."
uv pip install jupyterlab ipykernel

echo "🧠 Registrando kernel no Jupyter..."
python -m ipykernel install --user 
--name=$(basename $ENV_NAME) 
--display-name="Python ($(basename $ENV_NAME))"



echo "✅ Ambiente pronto!"
echo ""
echo "Para usar:"
echo "1. Ative: source $ENV_NAME/bin/activate"
echo "2. Rode: jupyter lab"
echo "3. Escolha o kernel: Python ($(basename $ENV_NAME))"


