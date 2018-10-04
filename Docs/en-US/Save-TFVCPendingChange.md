---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Save-TFVCPendingChange

## SYNOPSIS

## SYNTAX

```
Save-TFVCPendingChange [-CommitMessage] <String> [[-Workspace] <Workspace>] [[-Path] <String[]>]
 [[-PendingChange] <PendingChange[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Save-TFVCPendingChange
```

## PARAMETERS

### -CommitMessage
Commit Message

```yaml
Type: String
Parameter Sets: (All)
Aliases: Message, CM

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Local path to the pending change that should be removed

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName, LocalItem

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PendingChange
Pending changes to commit

```yaml
Type: PendingChange[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-TFVCPendingChange)
Accept pipeline input: True (ByValue)
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
