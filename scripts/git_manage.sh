#!/bin/bash

init_aczg() {
    local caminho=$1
    local nome=$2
    mkdir -p "$caminho/$nome" && cd "$caminho/$nome"
    echo "projeto $nome inicializado...." > README.md
    git init
    git add README.md
    git commit -m "first commit - repositório configurado"
    echo "Projeto $nome criado em $caminho"
}

# Task 2: Gerenciar Branches
aczg_init_feat() {
    local nomeEntrega=$1
    git status
    git checkout -b "feat-$nomeEntrega"
    git branch -a
}

aczg_finish_feat() {
    local branch_atual=$(git branch --show-current)
    git checkout master
    git merge "$branch_atual"
    git branch -d "$branch_atual"
    git push origin --delete "$branch_atual" 2>/dev/null || echo "Branch remota não encontrada."
}
