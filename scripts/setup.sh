#!/bin/bash

chmod +x ./scripts/*.sh

SCRIPT_PATH=$(readlink -f ./scripts)

if ! grep -q "ACZG_HERO" ~/.bashrc; then
    echo -e "\n# ACZG_HERO CONFIG" >> ~/.bashrc
    echo "alias aczginit_proj='source $SCRIPT_PATH/init_project.sh'" >> ~/.bashrc
    echo "alias aczglog='grep \"ACZG\" ~/aczg_pipeline.log'" >> ~/.bashrc
fi

(crontab -l 2>/dev/null; echo "0 */6 * * * $SCRIPT_PATH/pipeline.sh /caminho/do/seu/projeto") | crontab -
(crontab -l 2>/dev/null; echo "0 18 * * * $SCRIPT_PATH/auto_commit.sh /caminho/do/seu/projeto") | crontab -

echo "Tudo pronto! Lembre-se de rodar 'source ~/.bashrc' para ativar os aliases."
