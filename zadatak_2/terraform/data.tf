data "archive_file" "hello_world" {
  type        = "zip"
  source_file = "${path.module}/lambda/hello_world.py"
  output_path = "${path.module}/lambda/hello_world.zip"
}