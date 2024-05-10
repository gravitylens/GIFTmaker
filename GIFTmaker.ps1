
function IsKey {
    param (
        [string]$column,
        [string]$optionText,
        [string]$key
    )

    if($column -eq $key) {
        $returnText = "=%100%$optionText"
    } else {
        $returnText = "~%0%$optionText"
    }
    return $returnText;
}

Import-CSV ./ITQuiz.csv | ForEach-Object{
    $qid = $_.RefNum
    $stem = $_.Question

    $optA = IsKey -column "A" -optionText $_.optA -Key $_.Key
    $optB = IsKey -column "B" -optionText $_.optB -Key $_.Key
    $optC = IsKey -column "C" -optionText $_.optC -Key $_.Key
    $optD = IsKey -column "D" -optionText $_.optD -Key $_.Key

    write-output "// question: $QID"
    write-output "::::[choice_multiple]<p>$stem</p>{"

    write-output "`t $optA"
    write-output "`t $optB"
    write-output "`t $optC"
    write-output "`t $optD"
    write-output "}"
    write-output ""
}
