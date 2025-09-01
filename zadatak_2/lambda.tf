resource "aws_lambda_function" "hello_world" {
  filename         = data.archive_file.hello_world.output_path
  function_name    = "${local.project}_lambda_function"
  role             = aws_iam_role.hello_world_role.arn
  handler          = "hello_world.handler"
  source_code_hash = data.archive_file.hello_world.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      TOPIC_ARN = aws_sns_topic.hello_world.arn
      MESSAGE = "Hello World!"
    }
  }
}