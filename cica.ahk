#NoEnv
#SingleInstance Force
SendMode Input

NumpadAdd::
{
    ; Define a list of rainbow colors
    colors := ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
    colorIndex := 1

    ; Select all text (Ctrl+A)
    Send, ^a
    Sleep, 500

    ; Copy selected text to clipboard (Ctrl+C)
    Send, ^c
    Sleep, 500
    ClipWait, 1

    if (!ErrorLevel) {
        ; Split clipboard contents into words
        words := StrSplit(Clipboard, " ")

        ; Loop through each word
        for index, word in words {
            ; Construct the URL with the current color
            url := "https://cataas.com/cat/says/" . word . "?fontSize=50&fontColor=" . colors[colorIndex]

            ; Send the URL and press Enter
            SendInput, %url%{Enter}
            Sleep, 500

            ; Move to the next color in the list, wrapping around to the start if necessary
            colorIndex := (colorIndex < colors.Length()) ? (colorIndex + 1) : 1
        }
    }
}
return
