variable "location" {
    type = string
    default = "brazilsouth"
}

variable "environment" {
    type = string
    description = "Servicebus"
    default = "pulse-servicebus"
}

variable "responsavel" {
    type = string
    description = "Time responsável por manter essa infraestrutura"
    default = "devops"

}