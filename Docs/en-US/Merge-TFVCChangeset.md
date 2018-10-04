---
external help file: TFVC-help.xml
Module Name: TFVC
online version:
schema: 2.0.0
---

# Merge-TFVCChangeset

## SYNOPSIS
Performs a merge in the workspace with the specified changes

## SYNTAX

```
Merge-TFVCChangeset [[-Workspace] <Workspace>] [-SourceBranch] <String> [-TargetBranch] <String>
 [-FromChangeset] <Changeset> [[-ToChangeset] <Changeset>] [-MergeOptions <MergeOptionsEx>]
 [-LockLevel <LockLevel>] [-RecursionType <RecursionType>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Merge-TFVCChangeset -Path $Path
```

## PARAMETERS

### -FromChangeset
First or oldest changeset in the list to merge

```yaml
Type: Changeset
Parameter Sets: (All)
Aliases: Changeset, Start, First

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LockLevel
Specified lock level

```yaml
Type: LockLevel
Parameter Sets: (All)
Aliases:
Accepted values: None, Checkin, CheckOut, Unchanged

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MergeOptions
Special options to use for the merge. Default is None

```yaml
Type: MergeOptionsEx
Parameter Sets: (All)
Aliases:
Accepted values: None, ForceMerge, Baseless, NoMerge, AlwaysAcceptMine, Silent, NoImplicitBaseless, Conservative, NoAutoResolve

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RecursionType
Recursion type

```yaml
Type: RecursionType
Parameter Sets: (All)
Aliases:
Accepted values: None, OneLevel, Full

Required: False
Position: Named
Default value: Full
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceBranch
Source banch with the chagnes that need to be merged

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ToChangeset
Latest or newest change to be merged

```yaml
Type: Changeset
Parameter Sets: (All)
Aliases: Last, End

Required: False
Position: 4
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

Required: False
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
