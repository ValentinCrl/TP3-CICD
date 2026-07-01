variable "ovh_project_id" {

  description = "OVHcloud Public Cloud project ID"
  type        = string
}
variable "region" {
  type    = string
  default = "GRA11"
}
variable "author" {
  type    = string
  default = "CRAT"
}
variable "my_ip" {
  description = "Votre IP publique pour la règle SSH (format: x.x.x.x/32)"
  type        = string
  default     = "176.171.153.132/32"
  sensitive   = true
}

# description = "Définition des 3 tiers de l'architecture"
# default = {
#   web = {
#     flavor     = "d2-2"
#     public_net = true # IP publique
#     role       = "frontend"
#   }
#   api = {
#     flavor     = "d2-2"
#     public_net = true # IP publique
#     role       = "backend"
#   }
#   db = {
#     flavor     = "d2-2"
#     public_net = false # PAS d'IP publique !
#     role       = "database"
#   }
# }

