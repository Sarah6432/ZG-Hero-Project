#!/bin/bash

PROJETO_DIR=${1:-$(pwd)}
LOG_FILE="$HOME/aczg_pipeline.log"

cd "$PROJETO_DIR" || exit

echo "[$(date)] Verificando tecnologia do projeto em: $PROJETO_DIR" >> "$LOG_FILE"

if [ -f "build.gradle" ]; then
    echo "Projeto Gradle detectado. Executando testes..." >> "$LOG_FILE"
    ./gradlew test >> "$LOG_FILE" 2>&1
    
elif [ -f "package.json" ]; then
    echo "Projeto Node.js detectado. Executando testes..." >> "$LOG_FILE"
    npm test >> "$LOG_FILE" 2>&1

elif [ -f "manage.py" ]; then
    echo "Projeto Django/Python detectado..." >> "$LOG_FILE"
    python3 manage.py test >> "$LOG_FILE" 2>&1

elif ls *.java >/dev/null 2>&1; then
    echo "Arquivos Java soltos detectados. Compilando..." >> "$LOG_FILE"
    javac *.java >> "$LOG_FILE" 2>&1

else
    echo "[AVISO] Nenhuma ferramenta de build conhecida encontrada. Apenas verificando integridade." >> "$LOG_FILE"
    ls -R >> "$LOG_FILE"
fi

if [ $? -eq 0 ]; then
    STATUS="SUCESSO"
    MSG="Pipeline concluída com êxito!"
else
    STATUS="FALHA"
    MSG="Erro na execução do Pipeline. Verifique os logs."
fi

echo "[$STATUS] em $(date)" >> "$LOG_FILE"
notify-send "ACZG Hero Project" "$MSG"
