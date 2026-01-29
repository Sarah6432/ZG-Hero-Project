#!/bin/bash

echo "Configurando ambiente ACZG Hero..."

# 1. Definir caminhos
SCRIPT_PATH="$(pwd)/scripts"
BASHRC="$HOME/.bashrc"

# 2. Criar os Alias no .bashrc
sed -i '/# ACZG ALIASES/d' "$BASHRC" # Limpa se já existir
echo "# ACZG ALIASES" >> "$BASHRC"
echo "source $SCRIPT_PATH/git_manage.sh" >> "$BASHRC"
echo "alias aczginit_proj='init_aczg'" >> "$BASHRC"
echo "alias aczginit='aczg_init_feat'" >> "$BASHRC"
echo "alias aczgfinish='aczg_finish_feat'" >> "$BASHRC"

# Task 4: Alias para Log
echo "alias aczglog='grep \"ACZG\" ~/aczg_pipeline.log'" >> "$BASHRC"

# 3. Configurar Cron Jobs
# (Aqui você usaria o crontab -e via script)
(crontab -l 2>/dev/null; echo "0 18 * * * cd $(pwd)/scripts && ./auto_commit.sh") | crontab -

echo "Ambiente configurado! Reinicie o terminal ou digite 'source ~/.bashrc'."

chmod +x $SCRIPT_PATH/*.sh
