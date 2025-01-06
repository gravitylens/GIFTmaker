# GIFTmaker

## Overview
GIFTmaker is a PowerShell script that converts a CSV file containing multiple-choice questions into the GIFT format used by several LMS systems.

## Input File Format
The input CSV file should have the following columns:
- `Name`: The unique identifier for the question.
- `Answer`: The correct answer key (e.g., A, B, C, etc.).
- `Option A` to `Option G`: The options for the multiple-choice question.
- `Question`: The question text.
- Other columns may be included, but will be ignored.

### Example CSV
```csv
Name,Answer,Option A,Option B,Option C,Option D,Option E,Option F,Option G,Question
1,A,Paris,London,Berlin,Madrid,,,,What is the capital of France?
2,B,3,4,5,6,,,,What is 2 + 2?
3,C,Red,Blue,Green,Yellow,,,,What color do you get when you mix blue and yellow?
4,D,Earth,Mars,Jupiter,Saturn,,,,Which planet is known as the Red Planet?
5,E,Water,Fire,Earth,Air,,,,Which element is associated with the zodiac sign Aquarius?
```

## Usage
To run the script, use the following command in PowerShell:

```powershell
.\GIFTmaker.ps1 -csvFilePath <path_to_csv_file>
```

### Example
```powershell
.\GIFTmaker.ps1 -csvFilePath "ITQuiz.csv"
```

This will process the CSV file and output the formatted questions to the console.

## Notes
- Ensure that the CSV file is properly formatted and all required columns are present.
- The script will output the formatted questions to the console. You can redirect this output to a file if needed.

```powershell
.\GIFTmaker.ps1 -csvFilePath "ITQuiz.csv" > output.txt
```
