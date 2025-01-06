# GIFTmaker

## Overview
GIFTmaker is a PowerShell script that converts a CSV file containing multiple-choice questions into a specific format for use in other applications.

## Input File Format
The input CSV file should have the following columns:
- `ID`: The unique identifier for the question.
- `Key`: The correct answer key (e.g., A, B, C, etc.).
- `optA` to `optG`: The options for the multiple-choice question.
- `Stem`: The question text.
- Other columns may be included, but will be ignored.

### Example CSV
```csv
ID,Key,optA,optB,optC,optD,optE,optF,optG,Stem
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
.\GIFTmaker.ps1 -csvFilePath "C:\path\to\epmitems.csv"
```

This will process the CSV file and output the formatted questions to the console.

## Notes
- Ensure that the CSV file is properly formatted and all required columns are present.
- The script will output the formatted questions to the console. You can redirect this output to a file if needed.

```powershell
.\GIFTmaker.ps1 -csvFilePath "C:\path\to\epmitems.csv" > output.txt
```