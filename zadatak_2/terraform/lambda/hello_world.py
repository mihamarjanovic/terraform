import os
import boto3

client = boto3.client('sns')

def handler(event, context):
    topic_arn = os.environ["TOPIC_ARN"]
    message = os.environ["MESSAGE"]

    response = client.publish(
        TopicArn=topic_arn,
        Message=message
    )

    print("Message sent:", message)
    return response
