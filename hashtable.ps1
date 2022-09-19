#hastable
$user = @{ FirstName = 'John'; LastName = 'Smith';
PhoneNumber = '555-1212' }

#hashliteral
<#
<hashLiteral> = '@{' <keyExpression> '='
<pipeline> ] * '}'
#>

#when on the commandline semicolon can be ommited, each member of the hashtable has its own line!
$user = @{
FirstName = 'John'
LastName = 'Smith'
PhoneNumber = '555-1212'
}

#accesing
<#
PS> $user.firstname

PS> $user['firstname','lastname']
#>

#get list of all keys
<#
$user[$user.keys]
#>