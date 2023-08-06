#!/bin/bash

# Função para verificar se um pacote está instalado
check_package() {
    dpkg -s $1 &> /dev/null
}

# Baixar o arquivo 'app.py' do Git
wget -O app.py https://raw.githubusercontent.com/universoflix/script/main/app.py

# Verificar se o Python 3 está instalado
if ! check_package "python3"; then
    echo "Instalando Python 3..."
    sudo apt update
    sudo apt install python3 -y
fi

# Verificar se o Flask está instalado
if ! python3 -c "import flask" &> /dev/null; then
    echo "Instalando Flask e suas dependências..."
    sudo apt update
    sudo apt install python3-flask -y
fi

# Executar o arquivo
echo "Executando o arquivo app.py..."
python3 app.py
