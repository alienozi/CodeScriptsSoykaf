Dim fs, f, f1, fc, s

Set fs = CreateObject("Scripting.FileSystemObject")

Set f = fs.GetFolder(".")

Randomize
i = CInt((Rnd() * f.Files.Count) + 1)
j = 1


For Each fi In f.Files

If j >= i Then 
MsgBox fi.Name
Exit For
End If
j = j + 1
Next