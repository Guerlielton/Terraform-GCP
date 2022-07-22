# module "teste" {
#   source = "git::https://github.com/Guerlielton/modules.git//poc-test/"
# }

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "echo mentoria-iac"
  }
}
