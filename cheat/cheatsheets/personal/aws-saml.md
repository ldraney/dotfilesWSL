wd aws-cli-setup
vim samlrep.txt
python3 get-token.py
vim aws-credentials.sh
vim ~/.zshenv





not working
<!--# literally type this command:-->
<!--aws-saml-->














wd aws-cli-setup
vim samlrep.txt
python3 get-token.py
vim aws-credentials.sh
vim ~/.zshenv






## update SAML Token
1. `wd aws-cli-setup`
2. `vim samlrep.txt`
3. `python3 ./get-token.py`
4. ```
vim aws-credentials.sh
vim ~/.zshenv
```
5. Open a new tmux pane!

## first time doing the above
7. ```
ln -sf /home/ldraney/github/oddball_helps/scripts/aws-cli-script/credentials /home/ldraney/.aws/credentials
