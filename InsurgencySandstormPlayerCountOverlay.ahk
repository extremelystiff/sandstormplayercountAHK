#NoEnv
#SingleInstance force
#Persistent

SetBatchLines, -1
Gui +AlwaysOnTop -Caption +ToolWindow +LastFound +E0x20 +HwndHwnd
Gui Color, 000000 ; Background color
WinSet, TransColor, 000000 255 ; Transparency color and level
Gui Font, s12 cWhite ; Font size and color
Gui Add, Text, vPlayerCount x355 y270, Player Count: Loading... ; Position of text
Gui Show, x0 y0 w1920 h1080, Player Count Overlay ; Window size and position

SetTimer, FetchJsonData, 1000 ; Fetch every second for the first time
return

^+p::
Gui, % (toggle := !toggle) ? "Show" : "Hide"
return

FetchJsonData:
    SetTimer, FetchJsonData, 300000 ; Fetch every 5 minutes
    Url := "https://script.google.com/macros/s/AKfycbx1m1uhoccMnIi1zup_qD2JbkAUpXGUq0EcNR68eAG6853etNjDZn0rgCwo26ct7JVXbw/exec" ; Replace with your actual URL

    WinHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WinHttp.Open("GET", Url)
    WinHttp.Send()

    Response := WinHttp.ResponseText
    ; Simple string manipulation to get the count from the JSON response
    Response := StrReplace(Response, "{""player_count"":", "") ; Remove '{"player_count":'
    Response := StrReplace(Response, "}") ; Remove '}'
    GuiControl,, PlayerCount, Player Count: %Response%
return

GuiClose:
    ExitApp
return

