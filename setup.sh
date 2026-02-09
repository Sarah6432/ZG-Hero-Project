#!/bin/bash

echo "Configurando ambiente ACZG Hero..."


SCRIPT_PATH="$(pwd)/scripts"
BASHRC="$HOME/.bashrc"

sed -i '/# ACZG ALIASES/d' "$BASHRC" 
echo "# ACZG ALIASES" >> "$BASHRC"
echo "source $SCRIPT_PATH/git_manage.sh" >> "$BASHRC"
echo "alias aczginit_proj='init_aczg'" >> "$BASHRC"
echo "alias aczginit='aczg_init_feat'" >> "$BASHRC"
echo "alias aczgfinish='aczg_finish_feat'" >> "$BASHRC"

echo "alias aczglog='grep \"ACZG\" ~/aczg_pipeline.log'" >> "$BASHRC"


(crontab -l 2>/dev/null; echo "0 18 * * * cd $(pwd)/scripts && ./auto_commit.sh") | crontab -

echo "Ambiente configurado! Reinicie o terminal ou digite 'source ~/.bashrc'."

chmod +x $SCRIPT_PATH/*.sh
