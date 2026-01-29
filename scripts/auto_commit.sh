#!/bin/bash

PROJETO_DIR=${1:-$(pwd)}
LOG_FILE="$HOME/aczg_pipeline.log"

cd "$PROJETO_DIR" || exit

# 1. Verifica se há alterações (staged ou unstaged)
if [[ -n $(git status --porcelain) ]]; then
    echo "[$(date)] Alterações detectadas. Iniciando auto-commit..." >> "$LOG_FILE"
    
    # 2. Adiciona tudo
    git add .
    
    # 3. Commit com mensagem automática datada
    DATA_ATUAL=$(date "+%d/%m/%Y %H:%M")
    git commit -m "auto-commit: atualização diária ACZG ($DATA_ATUAL)" >> "$LOG_FILE" 2>&1
    
    # 4. Tenta dar push (opcional, mas recomendado)
    if git push origin $(git branch --show-current) >> "$LOG_FILE" 2>&1; then
        echo "[SUCESSO] Alterações enviadas ao repositório remoto." >> "$LOG_FILE"
    else
        echo "[AVISO] Falha ao enviar para o remoto (verifique conexão ou permissões)." >> "$LOG_FILE"
    fi
else
    echo "[$(date)] Nada para commitar no momento." >> "$LOG_FILE"
fi
