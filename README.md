# codigo-ao-container-infra

Infraestrutura como código para orquestração de containers usando **Terraform** + **Kubernetes**.



## Descrição

Este repositório contém os códigos e configurações para provisionar infraestrutura relevante para containers, utilizando **Terraform** para a infraestrutura e **Kubernetes** para orquestração.  
Os arquivos estão organizados em duas pastas principais: `terraform` e `k8s`.



## Tecnologias usadas

- [Terraform](https://www.terraform.io/)  
- [Kubernetes](https://kubernetes.io/)  
- Shell / scripts


## Estrutura de pastas

    /
    ├── terraform/            # Configurações Terraform
    ├── k8s/                  # Manifests / configurações Kubernetes
    ├── .gitignore            # Arquivos/pastas ignorados pelo git
    ├── LICENSE               # Licença MIT
    └── README.md             # Documentação do projeto


## Como usar / rodar localmente

### 1. Clonar o repositório
    git clone https://github.com/joao1912/codigo-ao-container-infra.git
    cd codigo-ao-container-infra

### 2. Pré-requisitos
- [Terraform](https://www.terraform.io/downloads) instalado localmente  
- `kubectl` instalado para interagir com o cluster Kubernetes  
- Credenciais / acesso configurado para o cluster Kubernetes (kubeconfig)

### 3. Provisionar infraestrutura com Terraform
    cd terraform
    terraform init
    terraform apply
