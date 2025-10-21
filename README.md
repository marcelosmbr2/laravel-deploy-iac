# Laravel Deploy com Infrastructure as Code (IaC)

Uma aplicação Laravel 12 com Inertia.js e React, deployada automaticamente na AWS EC2 usando Terraform e Ansible. Este projeto serve como introdução prática ao deploy automatizado com ferramentas de Infrastructure as Code.

## Sobre o Projeto

Este repositório demonstra como automatizar o deploy de uma aplicação Laravel moderna utilizando:

- **Laravel 12** - Framework PHP com arquitetura moderna
- **Inertia.js + React** - Stack frontend integrada ao Laravel
- **SQLite** - Banco de dados leve e prático
- **AWS EC2 (Free Tier)** - Instância t3.micro para hospedagem
- **Terraform** - Provisionamento de infraestrutura
- **Ansible** - Configuração e deploy automatizado

## Pré-requisitos

- Conta AWS ativa
- AWS Access Key criada (IAM Security Credentials)
- Par de chaves SSH criado para acessar o EC2 (formato .pem)
- Security Group da instância EC2 configurado para permitir tráfego de entrada e saída
- [AWS CLI](https://aws.amazon.com/cli/) instalado e configurado
- [Terraform](https://www.terraform.io/downloads) instalado
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) instalado

## Provisionando a Infraestrutura

### Terraform

O Terraform criará a instância EC2 automaticamente.

```bash
# Inicializa o Terraform e baixa os providers necessários
terraform init

# Mostra o plano de execução (preview das mudanças)
terraform plan

# Aplica as mudanças e cria a infraestrutura
terraform apply
```
### Configurar Inventário do Ansible

Informe o IP público da sua instância EC2 no arquivo `hosts.yml` 

### Ansible

O Ansible configurará todo o ambiente e instalará a aplicação:

```bash
# Executa o playbook de configuração e deploy
ansible-playbook playbook.yml
```

O playbook irá:
- ✅ Instalar PHP 8.3 e extensões necessárias
- ✅ Instalar Composer
- ✅ Instalar Node.js 20.x e npm
- ✅ Instalar e configurar Nginx
- ✅ Criar projeto Laravel 12
- ✅ Instalar Inertia.js e React
- ✅ Configurar banco de dados SQLite
- ✅ Compilar assets frontend
- ✅ Executar migrations
- ✅ Configurar permissões e variáveis de ambiente

## Acessando a Aplicação

Após o deploy, acesse:

```
http://IP_PUBLICO_DO_EC2
```

