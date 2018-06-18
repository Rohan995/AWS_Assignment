import boto3
import json

def lambda_invoke(event, function):
    client = boto3.client('lambda')
    response = client.invoke(
        FunctionName=function,
        InvocationType='Event',
        Payload=json.dumps(event)
    )
    print response
    print response['Payload'].read()
    return {"result": "OK"}

event = {
  "key3": "value3",
  "key2": "value2",
  "key1": "hello"
}

lambda_invoke(event, 'Pe_Rohan')