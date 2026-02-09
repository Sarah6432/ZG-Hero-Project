#!/bin/bash

PROJETO_DIR=${1:-$(pwd)}
LOG_FILE="$HOME/aczg_pipeline.log"

cd "$PROJETO_DIR" || exit

if [[ -n $(git status --porcelain) ]]; then
    echo "[$(date)] Alterações detectadas. Iniciando auto-commit..." >> "$LOG_FILE"
    git add .
    DATA_ATUAL=$(date "+%d/%m/%Y %H:%M")
    git commit -m "auto-commit: atualização diária ACZG ($DATA_ATUAL)" >> "$LOG_FILE" 2>&1
    
    if git push origin $(git branch --show-current) >> "$LOG_FILE" 2>&1; then
        echo "[SUCESSO] Alterações enviadas ao repositório remoto." >> "$LOG_FILE"
    else
        echo "[AVISO] Falha ao enviar para o remoto (verifique conexão ou permissões)." >> "$LOG_FILE"
    fi
else
    echo "[$(date)] Nada para commitar no momento." >> "$LOG_FILE"
fi
