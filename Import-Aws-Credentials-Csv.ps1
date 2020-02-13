# Imports aws credentials into your environment variables
Function Import-Aws-Credentials-Csv {
    [cmdletbinding()]
    Param( [string] $credentialsCsvPath)
Process {
    $creds = Import-Csv $credentialsCsvPath
    $Env:AWS_ACCESS_KEY_ID = $creds."Access key ID"
    $Env:AWS_SECRET_ACCESS_KEY = $creds."Secret access key"
    }
}
