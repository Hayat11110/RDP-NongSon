@echo off
echo delete epic games shortcut
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk">del.txt
net config server /srvcomment:"Github VPS">>del.txt
echo make taskbar small
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F>>del.txt
echo add fake administrator account with password @Password123456
net user Administrator @Password1234 /add >>del.txt
echo make fake administrator account admin access and rdp access
net localgroup administrators Administrator /add>>del.txt
net localgroup "Remote Desktop Users" Administrator /add>>del.txt
echo make admin account acive
net user Administrator /active:yes>>del.txt
echo delete installer account
net user installer /delete>>del.txt
echo add disk space
diskperf -Y>>del.txt
echo start audio service
sc config Audiosrv start= auto>>del.txt
sc start audiosrv>>del.txt
echo give user access files
ICACLS C:\Windows\Temp /grant administrator:F>>del.txt
ICACLS C:\Windows\installer /grant administrator:F>>del.txt
echo finished
echo ngrok ip:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "ngrok not work try again ):"
echo Username: Administrator
echo Password: @Password1234
echo wait for 10 secs (use ping command)
ping -n 10 127.0.0.1 >ping.txt
