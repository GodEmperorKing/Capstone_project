# resource "tls_private_key" "testquad" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "testquad" {
#   private_key_pem = tls_private_key.testquad.private_key_pem
# }

# output "private_key" {
#   value     = tls_private_key.testquad.private_key_pem
#   sensitive = true
# }

# output "public_key" {
#   value = data.tls_public_key.testquad.public_key_openssh
# }


resource "aws_key_pair" "TF_key" {
  key_name = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

### creating s local key pair that lives only while the app is running
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

resource "local_file" "TF_key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "TF_key.pem"
}