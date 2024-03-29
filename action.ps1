# HelloID-Task-SA-Target-HelloID-SendEmail
##########################################

try {
    Write-Information "Executing HelloID action: [SendNotification] for: [$($requester.userName)]"

    $body = "
    <p>
    Dear [Recipient],
    Product: [$($product.Name)] has been requested by: [$($requester.fullName)] with the following comment:
    </p>

    <p>
        $($request.comment)
    </p>

    <p>Kind regards,<br>
    </p>
    <p>HelloID<br>
    </p>
    "

    $splatMailParams = @{
        From         = 'noreply@helloid.com'
        To           = $manager.ContactEmail
        Subject      = 'Product requested'
        Body         = $body
        Confidential = $false
    }
    Write-Information -Tags 'Email' $splatMailParams

    $auditLog = @{
        Action            = 'SendNotification'
        System            = 'HelloID'
        TargetIdentifier  = $product.productGUID
        TargetDisplayName = $product.name
        Message           = "HelloID action: [SendNotification] for: [$($requester.userName)] executed successfully"
        IsError           = $false
    }
    Write-Information -Tags 'Audit' -MessageData $auditLog
    Write-Information "HelloID action: [SendNotification] for: [$($requester.userName)] executed successfully"
} catch {
    $ex = $_
    $auditLog = @{
        Action            = 'SendNotification'
        System            = 'HelloID'
        TargetIdentifier  = $product.productGUID
        TargetDisplayName = $product.name
        Message           = "Could not execute HelloID action: [SendNotification] for: [$($requester.userName)], error: $($ex.Exception.Message)"
        IsError           = $true
    }
    Write-Information -Tags "Audit" -MessageData $auditLog
    Write-Error "Could not execute HelloID action: [SendNotification] for: [$($requester.userName)], error: $($ex.Exception.Message)"
}
#######################################
