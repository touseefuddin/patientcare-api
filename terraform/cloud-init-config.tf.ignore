resource "null_resource" "cloud_init_always" {
  depends_on = [aws_instance.app_server]

  provisioner "remote-exec" {
    inline = [
      "sudo sed -i '/^ - scripts-user/ s/scripts-user.*/[scripts-user, always]/' /etc/cloud/cloud.cfg"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/khaja/Downloads/test-keypair.pem")  # Replace with your actual key path
    host        = aws_instance.app_server.public_ip
  }
}
