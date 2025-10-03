loop
{
WinGet, winid ,, A
winactivate, Roblox
send,{9}
sleep, 100
WinGetClass, var, A
WinMinimize, A
WinActivate ahk_id %winid%
Sleep, 1140000
}