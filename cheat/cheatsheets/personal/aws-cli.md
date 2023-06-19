# check aws instance profile
aws iam get-instance-profile --instance-profile-name project-qa-ec2-profile
aws iam get-instance-profile --instance-profile-name project-ec2-ssm-role-rInstProfile-17S10DN45EX0Q
# if you need to delete it
aws iam delete-instance-profile --instance-profile-name project-qa-ec2-profile
