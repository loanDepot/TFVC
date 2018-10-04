---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Remove-TFVCWorkspaceMapping

## SYNOPSIS
Adds a source to folder mapping to the workspace

## SYNTAX

### Source (Default)
```
Remove-TFVCWorkspaceMapping [-Workspace] <Workspace> [-Source] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Destination
```
Remove-TFVCWorkspaceMapping [-Workspace] <Workspace> [-Destination] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### WorkingFolder
```
Remove-TFVCWorkspaceMapping [-Workspace] <Workspace> [-Mapping] <WorkingFolder[]> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
New-TFVCSession -ServerURI https://tfs -ProjectCollection DevOps
```

$workspace = Get-TFVCWorkspace
$workspace | Remove-TFVCWorkspaceMapping -Source '$/PPE/trunk'

## PARAMETERS

### -Destination
The location on the local system that gets mapped

```yaml
Type: String
Parameter Sets: Destination
Aliases: DestinationPath, Path, LocalPath, FullName, LocalItem

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Mapping
The location on the local system that gets mapped

```yaml
Type: WorkingFolder[]
Parameter Sets: WorkingFolder
Aliases: WorkingFolder

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Source
The TFS locaion to map to the local system

```yaml
Type: String
Parameter Sets: Source
Aliases: SourcePath, TFSLocaion, ServerItem

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Workspace
A workspace to add a source mapping to

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
