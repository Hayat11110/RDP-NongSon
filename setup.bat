@echo off
echo delete epic games shortcut
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
net config server /srvcomment:"Github VPS"
echo make taskbar small
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F
echo add fake administrator account with password @Password123456
net user Administrator @Password1234 /add 
echo make fake administrator account admin access and rdp access
net localgroup administrators Administrator /add
net localgroup "Remote Desktop Users" Administrator /add
echo make admin account acive
net user Administrator /active:yes
echo delete installer account
net user installer /delete
echo add disk space
diskperf -Y
echo start audio service
sc config Audiosrv start= auto
sc start audiosrv
echo give user access files
ICACLS C:\Windows\Temp /grant administrator:F
ICACLS C:\Windows\installer /grant administrator:F
echo finished
echo ngrok ip:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "ngrok not work try again ):"
echo Username: Administrator
echo Password: @Password1234
echo wait for 10 secs (use ping command)
ping -n 10 127.0.0.1 >nul
