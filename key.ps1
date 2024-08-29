$profiles = netsh wlan show profiles | Select-String "All User Profile"
foreach ($profile in $profiles) {
    $profileName = $profile -replace "All User Profile     : ", ""
    Write-Output $profileName
    $key = netsh wlan show profile name="$profileName" key=clear | Select-String "Key Content"
    Write-Output $key
}
