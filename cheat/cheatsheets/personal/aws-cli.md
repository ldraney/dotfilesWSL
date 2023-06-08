# check aws instance profile
aws iam get-instance-profile --instance-profile-name project-qa-ec2-profile
# if you need to delete it
aws iam delete-instance-profile --instance-profile-name project-qa-ec2-profile
