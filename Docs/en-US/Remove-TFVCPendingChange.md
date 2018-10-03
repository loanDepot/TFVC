---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Remove-TFVCPendingChange

## SYNOPSIS
Removes the specified pending changes

## SYNTAX

```
Remove-TFVCPendingChange [[-Workspace] <Workspace>] [[-Path] <Object>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Remove-TFVCPendingChange -Path $Path
```

### EXAMPLE 2
```
Remove-TFVCPendingChange | Remove-TFVCPendingChages
```

## PARAMETERS

### -Path
Local path to the pending change that should be removed

```yaml
Type: Object
Parameter Sets: (All)
Aliases: FullName, LocalItem

Required: False
Position: 2
Default value: None
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
Position: 1
Default value: (Get-TFVCActiveWorkspace)
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
