/**
 * IME制御用 関数群 (IME.ahk)
 * Author: eamat. (http://www6.atwiki.jp/eamat/)
 */
IME_GET(WinTitle = "A") {
    ControlGet,hwnd,HWND,,,%WinTitle%
    if (WinActive(WinTitle)) {
        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        VarSetCapacity(stGTI, cbSize := 4 + 4 + (PtrSize * 6) + 16, 0)
        NumPut(cbSize, stGTI, 0, "UInt")
        hwnd := DllCall("GetGUIThreadInfo", Uint, 0, Uint, &stGTI) ? NumGet(stGTI, 8 + PtrSize, "UInt") : hwnd
    }

    return DllCall("SendMessage"
        , UInt, DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hwnd)
        , UInt, 0x0283
        , Int, 0x0005
        , Int, 0)
}

$*vk1A::
if IME_GET() or WinActive("ahk_exe vcxsrv.exe") {
    Send,{vk1D}
}
return

$*vk1D::
if IME_GET() or WinActive("ahk_exe vcxsrv.exe") {
    Send,{vk1D}
}
return
