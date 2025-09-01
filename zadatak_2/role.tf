data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "hello_world_role" {
  name               = "${local.project}_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "lambda_inline" {
  name = "${local.project}-lambda-policy"
  policy = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    sid ="AllowPublishToMyTopic"
    actions = ["sns:Publish"]
    resources = [aws_sns_topic.hello_world.arn]
  }
}

resource "aws_iam_role_policy_attachment" "attach" {
  role = aws_iam_role.hello_world_role.name
  policy_arn = aws_iam_policy.lambda_inline.arn
}