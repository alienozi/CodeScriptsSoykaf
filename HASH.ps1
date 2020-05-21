Write-Host "Welcome to alienozi's Hash Calculator!"

$fairu = Read-Host -Prompt 'Drag and drop file.'  
$fairu = $fairu -replace ".$"
$Leaf=Split-Path -Path $fairu -Leaf

function Show-Menu
{
     param (
           [string]$Title = 'Hash Types'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for SHA1."
     Write-Host "2: Press '2' for SHA256."
     Write-Host "3: Press '3' for SHA384."
     Write-Host "4: Press '4' for SHA512."
     Write-Host "5: Press '5' for MD5."
     Write-Host "Q: Press 'Q' to quit."
}
do
{
     Show-Menu
     $input = Read-Host "Please select a hash calculation operation method!"
     switch ($input)
     {
           '1' {
                Get-FileHash $Leaf -Algorithm SHA1  | Format-List
                
                'You chose option #1'
           } 
           '2' {
                Get-FileHash $Leaf -Algorithm SHA256  | Format-List
                'You chose option #2'
           } 
           '3' {
                Get-FileHash $Leaf -Algorithm SHA384  | Format-List
                'You chose option #3'
           
           }
           '4' {
                Get-FileHash $Leaf -Algorithm SHA512  | Format-List
                'You chose option #4'
           
           }
           '5' {
                Get-FileHash $Leaf -Algorithm MD5  | Format-List
                
                'You chose option #5'
           
           } 
           'q' {
                Write-Host "Thanks for using-a my Program!"
                Write-Host "alienozi/ www.alienozi.c1.biz "
                pause
                return
           }
     }
     pause
}
until ($input -eq 'q')
