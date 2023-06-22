# sandstormplayercountAHK
AutoHotKey overlay to display player counts, fetched from Steam API.

Hello,

Insurgency Sandstorm removed player counts from the mainmenu in a previous update. This is just a simple AHK script, that displays an overlay (CTRL+SHIFT+P), where that player count used to be. 

This script, calls a Google Apps Script URL. Google Apps Script is running the actual process of grabbing the data from SteamAPI and outputs it into a JSON format. The current Google Apps Script URL is using my personal API that is currently working but could be removed without any notice. 

Set this up on your own with your own SteamAPI key instead of using mine:

1. Setup Google Apps script, web app. Put your own SteamAPI key in the script.
2. Copy your Web App URL and paste it into the AHK script. 
3. Run the AHK script.
4. CTRL+SHIFT+P minimizes and opens the overlay. You have to exit the autohotkey program in your system tray.
