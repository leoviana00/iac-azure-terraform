variable "location" {
    type = string
    default = "brazilsouth"
}

variable "environment" {
    type = string
    description = "blobstorage-state"
    default = "blobstorage-state"
}

variable "responsavel" {
    type = string
    description = "Time responsável por manter essa infraestrutura"
    default = "devops"

}