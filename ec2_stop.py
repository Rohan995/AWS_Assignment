import boto3

region='us-east-1'

ec2=boto3.client('ec2')

def lambda_handler(event, context):
    
    ec2.stop_instances(InstanceIds=['i-0043aa3038a0287ff'])
    
    return 'Instance Stopped'
