# Open Git bash here
# Permissão: chmod 744 clone-all.sh
# Rodar: ./clone-all.sh

# Lista dos repositórios da organização
repositories=(
    "https://github.com/challenge-mottu/MOBILE-APPLICATION-DEVELOPMENT"
    "https://github.com/challenge-mottu/MASTERING-RELATIONAL-AND-NON-RELATIONAL-DATABASE"
    "https://github.com/challenge-mottu/JAVA-ADVANCED"
    "https://github.com/challenge-mottu/DISRUPTIVE-ARCHITECTURES-IOT-IOB-GENERATIVE-IA"
    "https://github.com/challenge-mottu/DEVOPS-TOOLS-CLOUD-COMPUTING"
    "https://github.com/challenge-mottu/COMPLIANCE-QUALITY-ASSURANCE-TESTS"
    "https://github.com/challenge-mottu/ADVANCED-BUSINESS-DEVELOPMENT-WITH-.NET"
    "https://github.com/challenge-mottu/mottu-canhaozinho-rfid"
)

# Loop para clonar todos
for repo in "${repositories[@]}"; do
    echo "Clonando: $repo"
    git clone "$repo"
done

echo "Todos os repositórios foram clonados com sucesso!"
