## trying to get the agent installed on the ec2
```
aws ssm send-command --document-name "AWS-ConfigureAWSPackage" --document-version "1" --targets '[{"Key":"InstanceIds","Values":["<INSTANCE_ID>"]}]' --parameters '{"action":["Install"],"name":["AmazonCloudWatchAgent"]}' --timeout-seconds 600 --max-concurrency "50" --max-errors "0" --region <REGION>
```

## testing a command on an ec2 instance
1. run the command
```
aws ssm send-command --instance-ids i-07102d66586799132 --document-name "AWS-RunShellScript" --parameters commands="echo hi mom"
```
2. get the command-id from the output and then run:
```
aws ssm list-command-invocations --command-id b8adb979-f2a0-4496-8e94-b13f4884026d --instance-id i-00642a165fe917464 --details
```
3. or try this simple script
```
aws ssm list-command-invocations --command-id $(aws ssm send-command --instance-ids i-07102d66586799132 --document-name "AWS-RunShellScript" --parameters commands="ls -al /home/qa" --output json | grep -oP '(?<="CommandId": ")[^"]+') --instance-id i-07102d66586799132 --details
```
4. If you're checking an ls command, use some formatting:
```
aws ssm send-command --instance-ids i-0abe5ccc0e76ac941 --document-name "AWS-RunShellScript" --parameters commands="ls -alh /home/qa/notification-api-qa" --output json | jq -r '.Command.CommandId' | xargs -I {} aws ssm list-command-invocations --command-id {} --instance-id i-0abe5ccc0e76ac941 --details | jq -r '.CommandInvocations[].CommandPlugins[].Output' | sed 's/\n//g'
```



## install aws cli
```
sudo apt-get install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## update SAML Token
1. `wd aws-cli-script`
2. `vim samlrep.txt`
3. `./get-token.py`
4. ```
vim aws-credentials.sh
vim ~/.zshenv
```
5. Open a new tmux pane!

## first time doing the above
7. ```
ln -sf /home/ldraney/github/oddball_helps/scripts/aws-cli-script/credentials /home/ldraney/.aws/credentials
```

## aws start query in AWS CloudWatch Logs
1. ensure updated SAML token and then:
wd queries
./[query_script].sh

## list all potential log-group names for queries
aws logs describe-log-groups --region us-gov-west-1

## filter the output of a command
aws rds describe-db-instances --query 'DBInstances[?Engine==`aurora-postgresql`].Engine'
