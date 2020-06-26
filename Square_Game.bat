@echo off
setlocal Enabledelayedexpansion
setlocal
call :setESC
set theme=color
set color1_1=%ESC%[41m
set color1_2=%ESC%[0m%ESC%[37m
set color2_1=%ESC%[43m
set color2_2=%ESC%[0m%ESC%[37m
set color3_1=%ESC%[42m
set color3_2=%ESC%[0m%ESC%[37m
set color4_1=%ESC%[44m
set color4_2=%ESC%[0m%ESC%[37m
set looptimes=0
set scramble=[
set solution=[
:start
set moves=0
title Square Game
mode 51,15
set dev=0
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
if "%theme%" == "color" color 07
cls
:mode_start
echo Press Z for zen mode
echo Press C for challenge mode
echo When in a game, you can press 0 to access the menu
:mode_select
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
if "%theme%" == "color" color 07
set mode=null
choice /c ZCQIPHDNMEL >nul
set mode=%errorlevel%
::z=zen, c=challenge, q=credits, i=invert, p=paper, h=hacker, d=dev, l=color
if "%mode%" == "8" set solution=%solution%0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000&&set moves=100
if "%mode%" == "9" set solution=Hacks&& set scramble=[None&& set moves=999999999
if "%mode%" == "10" set scramble=[None&& set solution=[There was no solution, only cheats.&& goto win
if "%mode%" == "4" set theme=invert&& goto notcolor
if "%mode%" == "5" set theme=paper&& goto notcolor
if "%mode%" == "6" set theme=hacker&& goto notcolor
if "%mode%" == "11" goto color
if "%mode%" == "7" if "%dev%"=="0" goto dev
if "%mode%" == "3" cls&& echo Made by Maxwell Fisher&& title Maxwell Fisher&& echo. && goto mode_start

if "%mode%" == "1" goto zen
if "%mode%" == "2" mode 21,2&& goto challenge

::goto mode_select
goto start

:color
set theme=color
::Why does Windows not allow colour, only color??? It just makes everything more confusing :(
set color1_1=%ESC%[41m
set color1_2=%ESC%[0m%ESC%[37m
set color2_1=%ESC%[43m
set color2_2=%ESC%[0m%ESC%[37m
set color3_1=%ESC%[42m
set color3_2=%ESC%[0m%ESC%[37m
set color4_1=%ESC%[44m
set color4_2=%ESC%[0m%ESC%[37m
goto start

:notcolor
set color1_1=
set color1_2=
set color2_1=
set color2_2=
set color3_1=
set color3_2=
set color4_1=
set color4_2=
goto start

:dev
echo.
set dev=1
echo Dev mode:
echo Press N to add 100 moves
echo Press M to add 999,999,999 moves
echo Press E to go to end screen
echo Press P to set theme as paper
echo Press I to set theme as inverted
echo Press H to set theme as hacker
echo Press Q for credits

goto mode_select

:challenge
echo Randomizing board...

set space_01=%color1_1%01%color1_2%
set space_02=%color1_1%02%color1_2%
set space_03=%color1_1%03%color1_2%
set space_04=%color1_1%04%color1_2%
set space_05=%color2_1%05%color2_2%
set space_06=%color2_1%06%color2_2%
set space_07=%color2_1%07%color2_2%
set space_08=%color2_1%08%color2_2%
set space_09=%color3_1%09%color3_2%
set space_10=%color3_1%10%color3_2%
set space_11=%color3_1%11%color3_2%
set space_12=%color3_1%12%color3_2%
set space_13=%color4_1%13%color4_2%
set space_14=%color4_1%14%color4_2%
set space_15=%color4_1%15%color4_2%
set space_16=%color4_1%16%color4_2%

::helps with randomizing the generated numbers
ping 127.0.0.1 -n %random:~0,1% >nul

:random-loop

set old_01=%space_01%
set old_02=%space_02%
set old_03=%space_03%
set old_04=%space_04%
set old_05=%space_05%
set old_06=%space_06%
set old_07=%space_07%
set old_08=%space_08%
set old_09=%space_09%
set old_10=%space_10%
set old_11=%space_11%
set old_12=%space_12%
set old_13=%space_13%
set old_14=%space_14%
set old_15=%space_15%
set old_16=%space_16%

if "%looptimes%"=="100" goto beginning
set key=%random:~0,1%
if "%key%"=="0" goto random-loop
if "%key%"=="9" goto random-loop
set scramble=%scramble%%key%
set /a looptimes=%looptimes%+1
goto random_%key%


:random_1
set space_01=%old_13%
set space_05=%old_01%
set space_09=%old_05%
set space_13=%old_09%
goto random-loop

:random_2
set space_02=%old_14%
set space_06=%old_02%
set space_10=%old_06%
set space_14=%old_10%
goto random-loop

:random_3
set space_03=%old_15%
set space_07=%old_03%
set space_11=%old_07%
set space_15=%old_11%
goto random-loop

:random_4
set space_04=%old_16%
set space_08=%old_04%
set space_12=%old_08%
set space_16=%old_12%
goto random-loop

:random_5
set space_01=%old_04%
set space_02=%old_01%
set space_03=%old_02%
set space_04=%old_03%
goto random-loop

:random_6
set space_05=%old_08%
set space_06=%old_05%
set space_07=%old_06%
set space_08=%old_07%
goto random-loop

:random_7
set space_09=%old_12%
set space_10=%old_09%
set space_11=%old_10%
set space_12=%old_11%
goto random-loop

:random_8
set space_13=%old_16%
set space_14=%old_13%
set space_15=%old_14%
set space_16=%old_15%
goto random-loop

:zen
set space_01=%color1_1%01%color1_2%
set space_02=%color1_1%02%color1_2%
set space_03=%color1_1%03%color1_2%
set space_04=%color1_1%04%color1_2%
set space_05=%color2_1%05%color2_2%
set space_06=%color2_1%06%color2_2%
set space_07=%color2_1%07%color2_2%
set space_08=%color2_1%08%color2_2%
set space_09=%color3_1%09%color3_2%
set space_10=%color3_1%10%color3_2%
set space_11=%color3_1%11%color3_2%
set space_12=%color3_1%12%color3_2%
set space_13=%color4_1%13%color4_2%
set space_14=%color4_1%14%color4_2%
set space_15=%color4_1%15%color4_2%
set space_16=%color4_1%16%color4_2%
goto beginning


:beginning
:print
mode 17,7
if "%mode%" == "2" goto check_win
goto dont_check_win
:check_win
if "%space_01% %space_02% %space_03% %space_04% %space_05% %space_06% %space_07% %space_08% %space_09% %space_10% %space_11% %space_12% %space_13% %space_14% %space_15% %space_16%" == "[01] [02] [03] [04] [05] [06] [07] [08] [09] [10] [11] [12] [13] [14] [15] [16]" goto win
:dont_check_win
cls
echo   %moves% moves
echo     1  2  3  4
echo   5 %space_01% %space_02% %space_03% %space_04%
echo   6 %space_05% %space_06% %space_07% %space_08%
echo   7 %space_09% %space_10% %space_11% %space_12%
echo   8 %space_13% %space_14% %space_15% %space_16%
::if %moves% geq 10000 echo You must be hacking...&& goto secret_end
::if %moves% geq 1000 echo Why have you done this?!&& goto secret_end
::if %moves% geq 100 echo Why and how did you use 100 moves..?&& goto secret_end
if %moves% lss 0 echo How did you move a negative amount of times..?&& goto secret_end
:secret_end

set old_01=%space_01%
set old_02=%space_02%
set old_03=%space_03%
set old_04=%space_04%
set old_05=%space_05%
set old_06=%space_06%
set old_07=%space_07%
set old_08=%space_08%
set old_09=%space_09%
set old_10=%space_10%
set old_11=%space_11%
set old_12=%space_12%
set old_13=%space_13%
set old_14=%space_14%
set old_15=%space_15%
set old_16=%space_16%

:get_input
set input=null
choice /c 123456780 >nul
set input=%errorlevel%
if not "%input%"=="9" set solution=%solution%%input%
if "%input%" == "1" set /a moves=%moves%+1&& goto input_1
if "%input%" == "2" set /a moves=%moves%+1&& goto input_2
if "%input%" == "3" set /a moves=%moves%+1&& goto input_3
if "%input%" == "4" set /a moves=%moves%+1&& goto input_4
if "%input%" == "5" set /a moves=%moves%+1&& goto input_5
if "%input%" == "6" set /a moves=%moves%+1&& goto input_6
if "%input%" == "7" set /a moves=%moves%+1&& goto input_7
if "%input%" == "8" set /a moves=%moves%+1&& goto input_8
if "%input%" == "9" goto input_0

if "%input%" == "10" set moves=100
if "%input%" == "11" set moves=999999999
if "%input%" == "12" goto win
if "%input%" == "14" set theme=invert
if "%input%" == "13" set theme=paper
if "%input%" == "15" set theme=hacker
if "%input%" == "16" goto dev2

goto get_input

goto get_input

:input_1
set space_01=%old_13%
set space_05=%old_01%
set space_09=%old_05%
set space_13=%old_09%
goto print

:input_2
set space_02=%old_14%
set space_06=%old_02%
set space_10=%old_06%
set space_14=%old_10%
goto print

:input_3
set space_03=%old_15%
set space_07=%old_03%
set space_11=%old_07%
set space_15=%old_11%
goto print

:input_4
set space_04=%old_16%
set space_08=%old_04%
set space_12=%old_08%
set space_16=%old_12%
goto print

:input_5
set space_01=%old_04%
set space_02=%old_01%
set space_03=%old_02%
set space_04=%old_03%
goto print

:input_6
set space_05=%old_08%
set space_06=%old_05%
set space_07=%old_06%
set space_08=%old_07%
goto print

:input_7
set space_09=%old_12%
set space_10=%old_09%
set space_11=%old_10%
set space_12=%old_11%
goto print

:input_8
set space_13=%old_16%
set space_14=%old_13%
set space_15=%old_14%
set space_16=%old_15%
goto print

:input_0
cls
mode 20,4
echo Press H to go home
echo Press C to cancel
echo Press Q to quit
choice /c HCQ >nul
set restart-choice=%errorlevel%
if "%restart-choice%"=="1" goto start
if "%restart-choice%"=="2" goto print
if "%restart-choice%"=="3" exit
goto input_0

:win
mode 20,8
cls
title You win!
echo.
echo You win!
ping 127.0.0.1 -n 1 >nul&& color 00
ping 127.0.0.1 -n 1 >nul&& color 01
ping 127.0.0.1 -n 1 >nul&& color 02
ping 127.0.0.1 -n 1 >nul&& color 03
ping 127.0.0.1 -n 1 >nul&& color 04
ping 127.0.0.1 -n 1 >nul&& color 05
ping 127.0.0.1 -n 1 >nul&& color 06
ping 127.0.0.1 -n 1 >nul&& color 07
ping 127.0.0.1 -n 1 >nul&& color 08
ping 127.0.0.1 -n 1 >nul&& color 09
ping 127.0.0.1 -n 1 >nul&& color 10
ping 127.0.0.1 -n 1 >nul&& color 11
ping 127.0.0.1 -n 1 >nul&& color 12
ping 127.0.0.1 -n 1 >nul&& color 13
ping 127.0.0.1 -n 1 >nul&& color 14
ping 127.0.0.1 -n 1 >nul&& color 15
ping 127.0.0.1 -n 1 >nul&& color 16
ping 127.0.0.1 -n 1 >nul&& color 17
ping 127.0.0.1 -n 1 >nul&& color 18
ping 127.0.0.1 -n 1 >nul&& color 19
ping 127.0.0.1 -n 1 >nul&& color 20
ping 127.0.0.1 -n 1 >nul&& color 21
ping 127.0.0.1 -n 1 >nul&& color 22
ping 127.0.0.1 -n 1 >nul&& color 23
ping 127.0.0.1 -n 1 >nul&& color 24
ping 127.0.0.1 -n 1 >nul&& color 25
ping 127.0.0.1 -n 1 >nul&& color 26
ping 127.0.0.1 -n 1 >nul&& color 27
ping 127.0.0.1 -n 1 >nul&& color 28
ping 127.0.0.1 -n 1 >nul&& color 29
ping 127.0.0.1 -n 1 >nul&& color 30
ping 127.0.0.1 -n 1 >nul&& color 31
ping 127.0.0.1 -n 1 >nul&& color 32
ping 127.0.0.1 -n 1 >nul&& color 33
ping 127.0.0.1 -n 1 >nul&& color 34
ping 127.0.0.1 -n 1 >nul&& color 35
ping 127.0.0.1 -n 1 >nul&& color 36
ping 127.0.0.1 -n 1 >nul&& color 37
ping 127.0.0.1 -n 1 >nul&& color 38
ping 127.0.0.1 -n 1 >nul&& color 39
ping 127.0.0.1 -n 1 >nul&& color 40
ping 127.0.0.1 -n 1 >nul&& color 41
ping 127.0.0.1 -n 1 >nul&& color 42
ping 127.0.0.1 -n 1 >nul&& color 43
ping 127.0.0.1 -n 1 >nul&& color 44
ping 127.0.0.1 -n 1 >nul&& color 45
ping 127.0.0.1 -n 1 >nul&& color 46
ping 127.0.0.1 -n 1 >nul&& color 47
ping 127.0.0.1 -n 1 >nul&& color 48
ping 127.0.0.1 -n 1 >nul&& color 49
ping 127.0.0.1 -n 1 >nul&& color 50
ping 127.0.0.1 -n 1 >nul&& color 51
ping 127.0.0.1 -n 1 >nul&& color 52
ping 127.0.0.1 -n 1 >nul&& color 53
ping 127.0.0.1 -n 1 >nul&& color 54
ping 127.0.0.1 -n 1 >nul&& color 55
ping 127.0.0.1 -n 1 >nul&& color 56
ping 127.0.0.1 -n 1 >nul&& color 57
ping 127.0.0.1 -n 1 >nul&& color 58
ping 127.0.0.1 -n 1 >nul&& color 59
ping 127.0.0.1 -n 1 >nul&& color 60
ping 127.0.0.1 -n 1 >nul&& color 61
ping 127.0.0.1 -n 1 >nul&& color 62
ping 127.0.0.1 -n 1 >nul&& color 63
ping 127.0.0.1 -n 1 >nul&& color 64
ping 127.0.0.1 -n 1 >nul&& color 65
ping 127.0.0.1 -n 1 >nul&& color 66
ping 127.0.0.1 -n 1 >nul&& color 67
ping 127.0.0.1 -n 1 >nul&& color 68
ping 127.0.0.1 -n 1 >nul&& color 69
ping 127.0.0.1 -n 1 >nul&& color 70
ping 127.0.0.1 -n 1 >nul&& color 71
ping 127.0.0.1 -n 1 >nul&& color 72
ping 127.0.0.1 -n 1 >nul&& color 73
ping 127.0.0.1 -n 1 >nul&& color 74
ping 127.0.0.1 -n 1 >nul&& color 75
ping 127.0.0.1 -n 1 >nul&& color 76
ping 127.0.0.1 -n 1 >nul&& color 77
ping 127.0.0.1 -n 1 >nul&& color 78
ping 127.0.0.1 -n 1 >nul&& color 79
ping 127.0.0.1 -n 1 >nul&& color 80
ping 127.0.0.1 -n 1 >nul&& color 81
ping 127.0.0.1 -n 1 >nul&& color 82
ping 127.0.0.1 -n 1 >nul&& color 83
ping 127.0.0.1 -n 1 >nul&& color 84
ping 127.0.0.1 -n 1 >nul&& color 85
ping 127.0.0.1 -n 1 >nul&& color 86
ping 127.0.0.1 -n 1 >nul&& color 87
ping 127.0.0.1 -n 1 >nul&& color 88
ping 127.0.0.1 -n 1 >nul&& color 89
ping 127.0.0.1 -n 1 >nul&& color 90
ping 127.0.0.1 -n 1 >nul&& color 91
ping 127.0.0.1 -n 1 >nul&& color 92
ping 127.0.0.1 -n 1 >nul&& color 93
ping 127.0.0.1 -n 1 >nul&& color 94
ping 127.0.0.1 -n 1 >nul&& color 95
ping 127.0.0.1 -n 1 >nul&& color 96
ping 127.0.0.1 -n 1 >nul&& color 97
ping 127.0.0.1 -n 1 >nul&& color 98
ping 127.0.0.1 -n 1 >nul&& color 99
ping 127.0.0.1 -n 1 >nul
:end
mode 101,8
cls
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
if "%theme%" == "color" color 07
echo It took you %moves% moves
if "%moves%" == "0" set moves=10000
if "%score%" NEQ "0" set /a score=10000/%moves%
if "%score%" NEQ "0" echo Your score is %score%
if "%score%" == "1" echo=It seems that you have cheated...
echo.
echo Press P to play another game, press Q to quit, or press S to see the solve info.
:end-choice
choice /c PQS >nul
set end-choice=%errorlevel%
if "%end-choice%"=="1" goto start
if "%end-choice%"=="2" exit
if "%end-choice%"=="3" echo The scramble that you had was %scramble%]&& echo Your solution was %solution%]&& goto end-choice
goto end

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)