---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Get-TFVCMergeCandidate

## SYNOPSIS
Compares 2 branches and get the changeset that are different between them

## SYNTAX

```
Get-TFVCMergeCandidate [-Workspace] <Workspace> [-SourceBranch] <String> [-TargetBranch] <String>
 [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Get-TFVCMergeCandidate -SourceBranch $SourceBranch -TargetBranch $TargetBbranch -Workspace $Workspace
```

## PARAMETERS

### -SourceBranch
Source banch with the chagnes that need to be merged

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TargetBranch
Target branch to merge the changes into

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Workspace
the workspace

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
