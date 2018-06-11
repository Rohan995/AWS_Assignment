import boto3
def lambda_handler(event, context):
    s3=boto3.resource("s3")
    if event:
        file_obj=event["Records"][0]
        filename=str(file_obj['s3']['object']['key'])
        source= { 'Bucket' : 'rohan002', 'Key': filename}
        dest = s3.Bucket('rohan003')
        dest.copy(source, filename)
        
    return "copied"
