---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Get-TFVCChangeset

## SYNOPSIS
Get specified changeset details

## SYNTAX

```
Get-TFVCChangeset [-ChangesetID] <Int32[]> [-TFVCSession <TFVCSession>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Get-TFVCChangeset -ChangesetID $ChangesetID
```

## PARAMETERS

### -ChangesetID
Parameter help description

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
GetChagneSet: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/ff737622%28v%3dvs.120%29
Changeset: https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/bb170151%28v%3dvs.120%29

## RELATED LINKS
