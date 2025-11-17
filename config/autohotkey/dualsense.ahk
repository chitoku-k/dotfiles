; クリエイトボタン -> Windows+Alt+PrintScreen
Joy9::#!PrintScreen

; PS ボタン -> 原神とタスクバーを交互にフォーカス
Joy13::{
    static last_mouse_x, last_mouse_y
    CoordMode("Mouse", "Screen")

    if WinActive("ahk_exe GenshinImpact.exe") {
        WinActivate("ahk_class Shell_TrayWnd")

        if IsSet(last_mouse_x) && IsSet(last_mouse_y) {
            MouseMove(last_mouse_x, last_mouse_y)
        }
    } else {
        MouseGetPos(&last_mouse_x, &last_mouse_y)
        try WinActivate("ahk_exe GenshinImpact.exe")
    }
}
