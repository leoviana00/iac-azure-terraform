variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "ambiente" {
  type        = string
  description = "Ambiente: dev, hom ou prod"
  default     = "dev"
}

variable "responsavel" {
  type        = string
  description = "Time responsável por manter essa infraestrutura"
  default     = "devops"

}

