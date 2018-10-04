---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Save-TFVCShelveset

## SYNOPSIS
Creates a Shelveset with the current pending changes

## SYNTAX

```
Save-TFVCShelveset [[-Name] <String>] [[-Comment] <String>] [[-Workspace] <Workspace>]
 [[-PendingChange] <PendingChange[]>] [-TFVCSession <TFVCSession>] [-ShevlingOptions <ShelvingOptions>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
TFShelve
```

### EXAMPLE 2
```
Save-TFVCShelveset -Workspace $Workspace
```

## PARAMETERS

### -Comment
The message or comment on the shelveset

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $env:USERNAME
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
The Workspace

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ('{0}-{1:yyyyMMddHHmmss}' -f $env:USERNAME, (Get-Date) )
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PendingChange
Pending changes to shelve

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

### -ShevlingOptions
ShelvingOptions

```yaml
Type: ShelvingOptions
Parameter Sets: (All)
Aliases:
Accepted values: None, Move, Replace

Required: False
Position: Named
Default value: Replace
Accept pipeline input: False
Accept wildcard characters: False
```

### -TFVCSession
Active TFVC Session

```yaml
Type: TFVCSession
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-TFVCSession)
Accept pipeline input: False
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
Shows what would happen if the cmdlet runs. The cmdlet is not run.

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
Workspace.Shelve: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb139422(v%3dvs.120)
Shelveset Class: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb171628%28v%3dvs.120%29

## RELATED LINKS
