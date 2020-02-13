$regions = (aws ec2 describe-regions | jq .[][].RegionName)
foreach ($region in $regions) {
    $id = (aws ec2 describe-security-groups --group-name Default --region $region| jq .SecurityGroups[].GroupId)
    aws ec2 revoke-security-group-ingress --group-id $id --source-group $id --protocol all --region $region
    aws ec2 revoke-security-group-egress --group-id $id --cidr 0.0.0.0/0 --protocol all --region $region
    }