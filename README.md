🚀 ZG-Hero Project: Shell Automation & CI Pipeline
Este repositório contém uma solução completa de automação para o cotidiano de desenvolvimento no ACZG. O objetivo é otimizar tarefas repetitivas de Git, gerenciar ambientes de forma consistente e implementar uma pipeline de CI (Continuous Integration) local utilizando Shell Script, Aliases e Cron Jobs.

🛠️ Tecnologias Utilizadas
Shell Script (Bash): Lógica principal de automação.

Git: Controle de versão e automação de fluxos.

Crontab: Agendamento de tarefas automáticas (Pipeline e Commits).

Libnotify: Alertas visuais no sistema operacional.

📁 Estrutura do Projeto
Plaintext

.
├── scripts/
│   ├── git_manage.sh    # Lógica para criação de projetos e gerenciamento de branches
│   ├── pipeline.sh      # Script agnóstico para testes e compilação
│   └── auto_commit.sh   # Script de commit automático inteligente
├── setup.sh             # O "Instalador" - Configura todo o ambiente
└── README.md            # Documentação do projeto
⚙️ Instalação e Configuração
Para configurar todas as ferramentas em qualquer máquina Linux, basta clonar o repositório e executar o script de setup:

Bash

git clone https://github.com/seu-usuario/zg-hero-project.git
cd zg-hero-project
chmod +x setup.sh
./setup.sh
source ~/.bashrc
📋 Funcionalidades (Tasks)
1. Inicialização de Projetos (aczginit_proj)
Cria uma estrutura padronizada com pasta, README.md e repositório Git inicializado com um único comando.

Uso: aczginit_proj /caminho/do/projeto nome_do_projeto

2. Fluxo de Feature (aczginit e aczgfinish)
Automatiza o padrão de branches feat-.

aczginit <nome>: Mostra o status, cria a branch de feature e lista as existentes.

aczgfinish: Volta para a master, realiza o merge, deleta a branch local e tenta remover a remota.

3. Pipeline de CI e Auto-Commit
Pipeline: Detecta automaticamente a tecnologia do projeto (Gradle, Node.js ou Java puro), executa os testes/compilação e gera um alerta visual no sistema.

Auto-Commit: Verifica se há alterações pendentes no repositório. Se houver, realiza um commit com timestamp e faz o push automaticamente.

Cron Jobs: Ambas as tarefas são agendadas via Crontab (configuradas automaticamente no setup.sh).

4. Monitoramento de Logs (aczglog)
Um alias prático para filtrar e visualizar o histórico de execuções da pipeline diretamente no terminal.

Uso: aczglog

💡 Diferenciais do Projeto
Scripts Agnósticos: O pipeline identifica o projeto baseado nos arquivos presentes (build.gradle, package.json, etc).

Instalação "One-Click": O setup.sh lida com permissões, escrita no .bashrc e agendamento no Crontab de forma transparente.

Inteligência no Commit: Evita commits vazios ou erros de histórico ao verificar o estado do repositório antes de agir.
