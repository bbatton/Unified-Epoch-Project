timeout 10

taskkill /im bec.exe

timeout 10
 
:: start the server..
set dayzpath="C:\Users\grave\Desktop\Dayz Server"
cd /d %dayzpath%
start /b "Dayz Epoch Server" "DayZ_Epoch_instance_11_Chernarus.bat"
 
timeout 15
:: start bec
set becpath="C:\Users\grave\Desktop"
cd /d %becpath%
start /b "BattlEye Extended Control" "BEC control Epoch.bat"
 
cls
@exit
