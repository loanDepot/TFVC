---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Get-TFVCWorkspaceMapping

## SYNOPSIS
Gets the folder mappings in the workspace

## SYNTAX

```
Get-TFVCWorkspaceMapping [-Workspace] <Workspace> [[-Source] <String>] [[-Destination] <String>]
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
$Workspace | Get-TFVCWorkspaceMapping

## PARAMETERS

### -Destination
The location on the local system that gets mapped

```yaml
Type: String
Parameter Sets: (All)
Aliases: DestinationPath, Path, LocalPath, FullName, LocalItem

Required: False
Position: 3
Default value: *
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Source
The TFS locaion to map to the local system

```yaml
Type: String
Parameter Sets: (All)
Aliases: SourcePath, TFSLocaion, ServerItem

Required: False
Position: 2
Default value: *
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
