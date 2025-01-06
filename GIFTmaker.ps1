<#
.SYNOPSIS
    Converts a CSV file containing multiple-choice questions into a specific format for use in other applications.

.DESCRIPTION
    This script reads a CSV file with multiple-choice questions and converts it into a specific format.
    The CSV file should have the following columns: Name, Answer, Option A to Option G, and Question.

.PARAMETER csvFilePath
    The path to the CSV file containing the questions.

.EXAMPLE
    .\GIFTmaker.ps1 -csvFilePath "C:\path\to\items.csv"

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
    $qid = $_.Name
    $stem = $_.Question

    $optA = IsKey -column "A" -optionText $_.'Option A' -key $_.Answer
    $optB = IsKey -column "B" -optionText $_.'Option B' -key $_.Answer
    $optC = IsKey -column "C" -optionText $_.'Option C' -key $_.Answer
    $optD = IsKey -column "D" -optionText $_.'Option D' -key $_.Answer
    $optE = IsKey -column "E" -optionText $_.'Option E' -key $_.Answer
    $optF = IsKey -column "F" -optionText $_.'Option F' -key $_.Answer
    $optG = IsKey -column "G" -optionText $_.'Option G' -key $_.Answer

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
