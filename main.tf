# Configuração do Terraform - Define requisitos de versão e providers
terraform {
  # Especifica os providers necessários para este projeto
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Fonte oficial do provider AWS
      version = "~> 4.16"       # Versão 
    }
  }

  # Versão mínima do Terraform necessária para executar este código
  required_version = ">= 1.2.0"
}

# Configuração do provider AWS
provider "aws" {
  region = "us-east-2" # Região onde os recursos serão criados (Ohio)
}

# Recurso EC2 Instance - Máquina virtual na AWS
resource "aws_instance" "app_server" {
  ami           = "ami-0cfde0ea8edd312d4" # Amazon Machine Image - Ubuntu Server 24.04 LTS
  instance_type = "t3.micro"              # Tipo da instância 

  key_name = "Laravel-IaC" # Nome da chave SSH criada no AWS 

  # Tags para organização e identificação dos recursos
  tags = {
    Name = "Laravel-IaC" # Nome da instância para identificação
  }
}
