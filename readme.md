# HelloID-Task-SA-Target-HelloID-SendEmail

## Prerequisites

>:information_source: The builtin variables `$product`, `$requester`, `$request` and `$manager` are used in this snippet.<br><br> For an overview of available variables, please refer to: https://docs.helloid.com/en/service-automation/service-automation-variables.html

## Description

This code snippet can be used to send an email using the `Write-Information -Tags 'Email'` cmdlet.

This snippet executes the following tasks:

1. Define the _emailBody_ object containing the email wrapped in basic HTML.

2. Define a hash table `$splatEmailParams`. The keys of the hash table represent the properties of the `Write-Information -Tags 'Email'` cmdlet, while the values represent the values entered in the hash table. For an overview of available properties, please refer to: https://docs.helloid.com/en/service-automation/delegated-forms/delegated-form-powershell-scripts.html#email-sends-in-delegated-form-powershell-scripts

3. Send the email message. Currently, the email address of the builtin variable `$manager` is used as recipient.
