CoordMode("Mouse", "Screen")

; クリエイトボタン -> Windows+Alt+PrintScreen
Joy9::#!PrintScreen

; PS ボタン -> 原神とアクティブウィンドウを交互にフォーカス
Joy13::{
    static last_active, last_mouse_x, last_mouse_y

    if WinActive("ahk_exe GenshinImpact.exe") {
        if !IsSet(last_active) || !IsSet(last_mouse_x) || !IsSet(last_mouse_y) {
            WinActivate("ahk_class Shell_TrayWnd")
            return
        }
        try {
            WinActivate(last_active)
        } catch {
            WinActivate("ahk_class Shell_TrayWnd")
        }
        MouseMove(last_mouse_x, last_mouse_y)
    } else {
        last_active := WinExist("A")
        MouseGetPos(&last_mouse_x, &last_mouse_y)
        try WinActivate("ahk_exe GenshinImpact.exe")
    }
}
