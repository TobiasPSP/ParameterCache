# ParameterCache
Home of the "ParameterCache" PowerShell module, adding cached parameter values and autocompletion

## Installation

Install the module from the *PowerShell Gallery*:

```powershell
Install-Module -Name ParameterCache -Scope CurrentUser
```

## Loading

Either run `Register-ParameterCache` to load the module implicitly, or import the module:

```powershell
Import-Module -Name ParameterCache
```

## Using

The module provides you with four new attributes that can be used to decorate parameters (and variables in general).

With these attributes, you can easily implement parameter value caching and autocompletion.

### Unprotected Caching

For insensitive data like computer names or ip addresses, use `[AutoLearn()]` and `[AutoComplete()]`. Each attribute takes a string id so you can use different caching lists for different parameters.

This is an example. Run the command multiple times, and see how each time you submit values to the parameters, the autocompletion lists grow:

```powershell
function Connect-MyServer
{
  param
  (
    [string]
    [Parameter(Mandatory)]
    # auto-learn user names to user.hint
    [AutoLearn('user')]
    # auto-complete user names from user.hint
    [AutoComplete('user')]
    $UserName,

    [string]
    [Parameter(Mandatory)]
    # auto-learn computer names to server.hint
        [AutoLearn('server')]
        # auto-complete computer names from server.hint
        [AutoComplete('server')]
        $ComputerName
    )

    "hello $Username, connecting you to $ComputerName"
}
```

### Safe Credential Store

To cache credentials in a safe and encrypted way, use `[AutoLearnCredential()]` and `[AutocompleteCredential()]`:

```powershell
function New-Login
{
  param
  (
    [PSCredential]
    [Parameter(Mandatory)]
    # cache credentials to username.xmlhint
    [AutoLearnCredential('usernameSafe')]
    # auto-complete user names from username.xmlhint
    [AutocompleteCredential('usernameSafe')]
    $Credential
  )

  $username = $Credential.UserName
  Write-Host "hello $username!"
  return $Credential
}
```

## Notes

The full article about the techniques used here can be found here: https://powershell.one/powershell-internals/attributes/custom-attributes#final-example

It is noteworthy that this module shows a simple way to *export PowerShell classes*. Typically, classes defined by PowerShell can be exported by modules only when you use the awkward *using module...* statement. `Import-Module` won't make such classes available in the caller context.

The simple solution is to rename your module file inside the module from *.psm1*  to *.ps1*, making it a plain script without separate scope. That will suffice like this module show-cases.
