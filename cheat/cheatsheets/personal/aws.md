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
1. ensure updated SAML token and then:
wd queries
./[query_script].sh

## list all potential log-group names for queries
aws logs describe-log-groups --region us-gov-west-1
