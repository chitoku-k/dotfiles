; F13 -> PrintScreen
vk7C::vk2C

; Command+Enter -> Control+Enter
#Enter::^Enter

; かな -> 変換
*vk16::Send("{vk1C}")

; イコール（テンキー） -> イコール
vk0C::+vkBD

; カンマ（テンキー） -> カンマ
vkC2::vkBC

; (X410.exe) 英数 -> 無変換
$*vk1A::{
    if WinActive("ahk_exe X410.exe") {
        Send("{vk1D}")
    } else {
        Send("{vk1A}")
    }
}
