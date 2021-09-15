variable "location" {
    type = string
    description = "Região"
    default = "brazilsouth"
}

variable "responsavel" {
    type = string
    description = "Time responsável por manter essa infraestrutura"
    default = "devops"
}

# variable "rg-storage" {
#     type = string
#     description = "Nome do resource group da storgae"
# }

# variable "account-storage" {
#     type = string
#     description = "Nomde do account storage"
# }

# variable "key-storage" {
#     type = string
#     description = "Chave primária da storage"
# }

# variable "container-storage" {
#     type = string
#     description = "Nome do container storage"
# }