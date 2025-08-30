resource "aws_cloudwatch_event_rule" "event_schedule" {
    name = "${local.project}-rule"
    schedule_expression = var.schedule_expression
    description = "Triggers the Lambda on a schedule"
}


resource "aws_cloudwatch_event_target" "event_target" {
    rule = aws_cloudwatch_event_rule.event_schedule.name
    target_id = var.event_target_id
    arn = aws_lambda_function.hello_world.arn
}


resource "aws_lambda_permission" "allow_events" {
    statement_id = "AllowExecutionFromEventBridge"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.hello_world.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.event_schedule.arn
}