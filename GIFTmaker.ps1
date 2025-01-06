<#
.SYNOPSIS
    Converts a CSV file containing multiple-choice questions into a specific format for use in other applications.

.DESCRIPTION
    This script reads a CSV file with multiple-choice questions and converts it into a specific format.
    The CSV file should have the following columns: ID, Key, optA to optG, and Stem.

.PARAMETER csvFilePath
    The path to the CSV file containing the questions.

.EXAMPLE
    .\GIFTmaker.ps1 -csvFilePath "C:\path\to\epmitems.csv"

.NOTES
    Ensure that the CSV file is properly formatted and all required columns are present.
    The script will output the formatted questions to the console. You can redirect this output to a file if needed.
#>

param (
    [string]$csvFilePath
)

function IsKey {
    param (
        [string]$column,
        [string]$optionText,
        [string]$key
    )

    if ($optionText -eq ""){
        $returnText = $null
    }
    elseif($column -eq $key) {
        $returnText = "=%100%$optionText"
    } 
    else {
        $returnText = "~%0%$optionText"
    }
    return $returnText;
}

Import-CSV $csvFilePath | ForEach-Object{
    $qid = $_.ID
    $stem = $_.Stem

    $optA = IsKey -column "A" -optionText $_.optA -key $_.Key
    $optB = IsKey -column "B" -optionText $_.optB -key $_.Key
    $optC = IsKey -column "C" -optionText $_.optC -key $_.Key
    $optD = IsKey -column "D" -optionText $_.optD -key $_.Key
    $optE = IsKey -column "E" -optionText $_.optE -key $_.Key
    $optF = IsKey -column "F" -optionText $_.optF -key $_.Key
    $optG = IsKey -column "G" -optionText $_.optG -key $_.Key

    write-output "// question: $qid"
    write-output "::::[choice_multiple]<p>$stem</p>{"

    if ($optA) {write-output "`t $optA"}
    if ($optB) {write-output "`t $optB"}
    if ($optC) {write-output "`t $optC"}
    if ($optD) {write-output "`t $optD"}
    if ($optE) {write-output "`t $optE"}
    if ($optF) {write-output "`t $optF"}
    if ($optG) {write-output "`t $optG"}
    write-output "}"
    write-output ""
}
