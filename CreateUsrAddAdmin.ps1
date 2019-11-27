$Computer = [ADSI]"WinNT://$Env:COMPUTERNAME,Computer"
$User = $Computer.Create("User", "useroperator")
$User.SetPassword("senha-definada-ao-usuario")
$User.SetInfo()
$User.FullName = "SetFullName"
$User.SetInfo()
$User.UserFlags = 64 + 65536 # ADS_UF_PASSWD_CANT_CHANGE + ADS_UF_DONT_EXPIRE_PASSWD
$User.SetInfo()
$group = [ADSI]"WinNT://$Env:COMPUTERNAME/Administrators,group"
$group.Add("WinNT://useroperator,user")
