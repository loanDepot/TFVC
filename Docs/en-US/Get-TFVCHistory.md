---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Get-TFVCHistory

## SYNOPSIS

## SYNTAX

```
Get-TFVCHistory [-ServerPath] <String> [[-User] <String>] [-MaxCount <Int32>] [-IncludeChanges]
 [-SortAscending] [-TFVCSession <TFVCSession>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Get-TFVCHistory -Path $Path
```

## PARAMETERS

### -IncludeChanges
include change information

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MaxCount
max number of history items to return

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ServerPath
The server path to checck the history on.
Supports wildcards

```yaml
Type: String
Parameter Sets: (All)
Aliases: Path

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SortAscending
Sort the results Ascending

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
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

### -User
User to search the history for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: [NullString]::Value
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
