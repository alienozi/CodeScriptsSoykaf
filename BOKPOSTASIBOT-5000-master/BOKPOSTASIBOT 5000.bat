chcp 65001
ECHO OFF
CLS
color A
title Bokpostasıbot 5000 by alienozi

:MENU
CLS
ECHO.
ECHO  --------------------------------------------
ECHO    BOKPOSTASIBOT 5000 by alienozi
ECHO  --------------------------------------------
ECHO.
ECHO 1 - TEMPLATE SEÇ
ECHO 2 - FOTO SEÇ
ECHO 3 - EXTRALAR
ECHO 4 - Exit
ECHO.

SET /P M=Numara Yazıp ENTER'a basın:
IF %M%==1 GOTO CLEAN
IF %M%==2 GOTO MS
IF %M%==3 GOTO SCAN
IF %M%==4 GOTO FIM

:CLEAN
cd "./TEMPLATE"
TEMPSEL.vbs
cd ..
goto MENU

:MS
cd "./FOTO/"
PSEL.vbs
cd ..
goto MENU

:SCAN
ECHO.
ECHO Türk meme komünitesinin bir bokpostası
ECHO  makinesine olan ihtiyca yönelik yaptım.
ECHO -Oğuz Alp DURAN / alienozi
ECHO  Ulaş Devrim /devrim-chan 'a teşekkürler
ECHO BIR SEY SEÇ
ECHO 1 - POKEMON BAT OYUNU
ECHO 2 -EXIT
ECHO.
SET /P O=Numara Yazıp ENTER'a basın:
IF %O%==1 GOTO PKM
IF %O%==2 GOTO MENU

PAUSE
goto MENU
goto scan

:PKM
cd"./FOTO/"
call "pkm.bat"

:FIM
CLS
color 07
ECHO  ---------------------------------------
ECHO       thanks 4 using le menu
ECHO  ---------------------------------------
timeout /t 3 /nobreak>nul
start http://steamcommunity.com/id/alienozi
timeout /t 15 /nobreak>nul
exit
goto fim 

GOTO MENU
