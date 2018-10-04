---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Set-TFVCActiveWorkspace

## SYNOPSIS
Sets a workspace as the default one for the current powershell session

## SYNTAX

```
Set-TFVCActiveWorkspace [-Workspace] <Workspace> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
```

$workspace = Get-TFVCWorkspace
Set-TFVCActiveWorkspace -Workspace $Workspace

## PARAMETERS

### -Workspace
The workspace

```yaml
Type: Workspace
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
