import boto3
region = 'us-east-1'
instance = ['i-0043aa3038a0287ff']

def lambda_handler(event, context):
    ec2 = boto3.client('ec2', region_name=region)
    ec2.start_instances(InstanceIds=instance)
    print (' instance started: ' + str(instance))