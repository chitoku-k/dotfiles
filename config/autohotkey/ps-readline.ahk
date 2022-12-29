/**
 * IME制御用 関数群 (IME.ahk)
 * AutoHotkey v2 向けに一部変更あり
 * Original Author: eamat. (http://www6.atwiki.jp/eamat/)
 */
IME_GET(WinTitle := "A") {
    hwnd := ControlGetFocus(WinTitle)
    if WinActive(WinTitle) {
        ; cbSize == sizeof(GUITHREADINFO)
        cbSize := 4 + 4 + (A_PtrSize * 6) + 16
        guiThreadInfo := Buffer(cbSize)
        NumPut("UInt", cbSize, guiThreadInfo)
        ; GUITHREADINFO->hwndFocus
        hwnd := DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", guiThreadInfo)
            ? NumGet(guiThreadInfo, 8 + A_PtrSize, "UInt")
            : hwnd
    }

    return DllCall("SendMessage",
        "UInt", DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hwnd),
        "UInt", 0x0283,
        "Int", 0x0005,
        "Int", 0
    )
}

$*vk1A::{
    if IME_GET() or WinActive("ahk_exe vcxsrv.exe") {
        Send("{vk1D}")
    }
    return
}

$*vk1D::{
    if IME_GET() or WinActive("ahk_exe vcxsrv.exe") {
        Send("{vk1D}")
    }
    return
}
