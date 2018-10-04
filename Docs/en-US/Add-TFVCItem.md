---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Add-TFVCItem

## SYNOPSIS
Adds items to the workspace that will become pending changes

## SYNTAX

```
Add-TFVCItem [[-Path] <String[]>] [-Recurse] [[-Workspace] <Workspace>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Add-TFVCItem -Path $Path
```

## PARAMETERS

### -Path
Parameter help description

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: .
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Recurse
Recursivly add files

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Workspace
The Workspace

```yaml
Type: Workspace
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-TFVCActiveWorkspace)
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
