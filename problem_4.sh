#!/bin/sh

instance1_id=$(aws ec2 run-instances --image-id ami-14c5486b --count 1 --instance-type t2.micro --key-name Nawaz@1995 --security-group-ids sg-66323b2e --subnet-id subnet-de0385f2 --iam-instance-profile Name=PE_trainee_Admin_role --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Rohan},
{Key=emailid,Value=rohan.raha@quantiphi.com},{Key=Project,Value=Shell_Assign}]' --user-data '#!/bin/sh

sudo su ec2-user
ssh-keygen -b 2048 -t rsa -f /home/ec2-user/.ssh/id_rsa -q -N ""
cd /home/ec2-user/.ssh
aws s3 cp id_rsa.pub s3://rohan002/id_rsa.pub'


status=$(aws ec2 describe-instance-status --instance-id $instance1_id --query InstanceStatuses[0].InstanceState.Code)
while [[ "$status" !=  16 ]]
do
	   echo wait........
	      sleep 5
	         status=$(aws ec2 describe-instance-status --instance-id $instance1_id --query InstanceStatuses[0].InstanceState.Code)
	 done

	 aws ec1 run-instances --image-id ami-14c5486b --count 1 --instance-type t2.micro --key-name Pe_Rohan --security-group-ids sg-66323b2e --subnet-id subnet-de0385f2 --iam-instance-profile Name=PE_trainee_Admin_role --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Rohan},
    {Key=emailid,Value=rohan.raha@quantiphi.com},{Key=Project,Value=Shell_Assign}]' --user-data '#!/bin/sh

sudo su ec2-user
aws s3 cp s3://rohan002/id_rsa.pub /home/ec2-user/id_rsa.pub
cat /home/ec2-user/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys
chmod 700 /home/ec2-user/.ssh
chmod 600 /home/ec2-user/.ssh/*'

