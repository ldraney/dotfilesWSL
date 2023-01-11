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
***first time***
5. ```
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
