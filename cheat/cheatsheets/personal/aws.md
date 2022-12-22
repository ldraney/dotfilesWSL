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

## aws start query in AWS CloudWatch Logs
```
aws logs start-query-result \
--start-time $((`date -d "2021-08-07 00:00:00" -u +"%s"` * 1000)) \
--end-time $((`date -d "2021-08-08 00:00:00" -u +"%s"` * 1000)) \
--limit 1000 \
--log-group-name "my-server-log" \
--query-string 'field @timestamp, @logStream, @message | filter @message like "Connection Error"'
```

## go to log queries
wd queries

## list all potential log-group names for queries
aws logs describe-log-groups --region us-gov-west-1
