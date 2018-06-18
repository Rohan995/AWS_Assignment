#!/bin/bash
echo Enter the Start time for today in the format HH MM
read start
echo Enter the Stop Time for today in the format HH MM
read stop
aws lambda invoke --function-name 'Pe_Rohan' --invocation-type 'Event' --payload '{"start":"$start"}' start.txt 
aws lambda invoke --function-name 'Pe_Rohan' --invocation-type 'Event' --payload '{"stop":"$stop"}' stop.txt 
