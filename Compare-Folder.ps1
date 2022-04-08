# Get the file hashes
$sourcefile = Get-childitem  "C:\Users\1" -File | Get-fileHash -Algorithm MD5 
$destfile = Get-childitem "C:\Users\2" -File  | Get-fileHash -Algorithm MD5

# =>  Copy from destfile => sourcefile

Compare-Object -ReferenceObject $sourcefile -DifferenceObject $destfile -Property hash -IncludeEqual -PassThru | `
Where-Object {$_.SideIndicator -eq "=>"} | `
select path, sideindicator
