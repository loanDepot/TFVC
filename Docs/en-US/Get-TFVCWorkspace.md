---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Get-TFVCWorkspace

## SYNOPSIS

## SYNTAX

### Default (Default)
```
Get-TFVCWorkspace [[-Name] <String>] [[-Owner] <String>] [-TFVCSession <TFVCSession>] [<CommonParameters>]
```

### LocalPath
```
Get-TFVCWorkspace [-Path] <String> [-TFVCSession <TFVCSession>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Get-TFVCWorkspace -Path $Path
```

## PARAMETERS

### -Name
Workspace name

```yaml
Type: String
Parameter Sets: Default
Aliases: WorkspaceName, Workspace

Required: False
Position: 1
Default value: [NullString]::Value
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Owner
Workspace owner

```yaml
Type: String
Parameter Sets: Default
Aliases: WorkspaceOwner

Required: False
Position: 1
Default value: $env:USERNAME
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Local path to a working folder

```yaml
Type: String
Parameter Sets: LocalPath
Aliases: LocalPath, Folder, Directory, FullName, WorkingFolder

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TFVCSession
{{Fill TFVCSession Description}}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
