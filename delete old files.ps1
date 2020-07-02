$FileLocation='\\server\SFTP_Root\' 
 
set-Location C:
Set-Location $FileLocation

Write-Output "Deleteing   ftp files  with no data extension and older than 1 day"
 
 
Get-ChildItem -File  $FileLocation -exclude *.csv,*.xlsx,*.xls,*.txt | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-1)} | Remove-Item -Force
   
Write-Output "File  successfully deleted"
