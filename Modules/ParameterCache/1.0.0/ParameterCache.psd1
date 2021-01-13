
@{

# Module Loader File
RootModule = 'loader.ps1'

# Version Number
ModuleVersion = '1.0.0'

# Unique Module ID
GUID = '6b4b2a62-8ccb-4778-8273-459f4de3c7af'

# Module Author
Author = 'Dr. Tobias Weltner'

# Company
CompanyName = 'https://powershell.one'

# Copyright
Copyright = '(c) 2021 Dr. Tobias Weltner. All rights reserved.'

# Module Description
Description = 'provides attributes for parameters that cache previous values and autosuggest them on later use'

# Minimum PowerShell Version Required
PowerShellVersion = '5.1'

# Name of Required PowerShell Host
PowerShellHostName = ''

CompatiblePSEditions = @('Desktop', 'Core')

# Minimum Host Version Required
PowerShellHostVersion = ''

# List of exportable functions
FunctionsToExport = 'Register-ParameterCache'

# Private data that needs to be passed to this module
PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @(
                'Attribute'
                'Parameter'
                'Autocomplete'
                'Cache'
                'SecureString'
		'Security'
                'powershell.one'
                'Windows'
                'MacOS'
                'Linux'
            )

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/TobiasPSP/ParameterCache'


        } # End of PSData hashtable

    } # End of PrivateData hashtable

}