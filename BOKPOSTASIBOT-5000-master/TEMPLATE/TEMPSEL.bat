setlocal EnableDelayedExpansion
set count=0
for /f "delims=" %%a in ('dir /b *.jpg , *.png') do @(
	set filename[!count!]=%%a
	set /a count = count + 1
)
set /a choose = (%random% * 32768 + %random%) %% count
set chosen=!filename[%choose%]!
cls
color A
cls
echo Secilen Random Template=  %chosen%

pause

