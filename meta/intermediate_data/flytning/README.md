# The convoluted process

## Step 1
Copy pasted the table out of Excel into basic text editor that doesn't insert weird symbols. Ie. use fx. notepad or leafpad, not Wordpad or Word. Alternately export from Excel and ensure the output encoding is UTF-8  
Input: ../original_data/  
Output: tmp1/

## Step 2
Run ParseConvert to turn the year columns into a single year column and reorder from/to in one file to make it easier to detect and remove duplicates.  
Command: java ParseConvert  
Input: tmp1/  
Output: tmp2/

## Step 3
In vim:  
1. Append tmp2/fra_output.csv and tmp2/til_output.csv into a single file.
2. :sort -u    // Sorts the file and removes duplicates
3. Save to tmp3/fra_til_uniq.csv  
Input: tmp2/  
Output: tmp3/

## Step 4
Run kommune_to_id/Substitute to replace all kommune_navn with their IDs.  
Command: java kommune_to_id/Substitute  
Input: tmp3/ and kommune_to_id/kommune_map.tsv  
Output tmp4/

## Step 5
Run aldersgruppe_koen_map.sh to join age groups and gender into a single number (ID).  
Input: tmp3/ and aldersgruppe_koen_map.tsv  
Output: final.csv

Done!
