#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j::			  ; CTRL+J starts
times = 176		  ; Loop Counter, How many pixels to be shifted
layer = 1		  ; Do Not Touch Loop Variable

Loop, %times%
{
Send, +^n         	  ; NEW LAYER
Send, {Enter}	  	  ; DIALOG CLOSE
Send, ^v	  	  ; PASTE LAYER
Send, R
Send, {Left %layer%}	  ; SHIFT ONE PIXEL
layer = %layer%+1	  ; increase var+1
}

; NOTE: PASTE YOUR IMAGE SIDE BY SIDE AND RUN THE SCRIPT. THEN USE IMAGEMAGICK
; OR https://ezgif.com/resize TO CROP IT TO HALF SIZE
