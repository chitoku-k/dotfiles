; PS ボタン -> 原神とタスクバーを交互にフォーカス
Joy13::{
    if WinActive("ahk_exe GenshinImpact.exe") {
        WinActivate("ahk_class Shell_TrayWnd")
    } else {
        try WinActivate("ahk_exe GenshinImpact.exe")
    }
}
