@echo off
set theme=paper
title Square Game
set moves=0
:start
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
cls
:mode_start
echo [Zen]
echo [Challenge]
echo.
:mode_select
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
echo Type your game mode:
set mode=null
set /p mode=:
if "%mode%" == "dev_move" set moves=100
if "%mode%" == "dev_moves" set moves=9999999999
if "%mode%" == "dev_win" goto win
if "%mode%" == "dev_invert" set theme=invert
if "%mode%" == "dev_paper" set theme=paper
if "%mode%" == "dev_hacker" set theme=hacker
if "%mode%" == "dev" echo.&& echo dev_move&& echo dev_moves&& echo dev_win&& echo dev_invert&& echo dev_paper&& echo dev_hacker&& goto mode_select
if "%mode%" == "credits" cls&& echo Made by Maxwell Fisher&& echo. && goto mode_start

if "%mode%" == "zen" goto zen
if "%mode%" == "challenge" goto challenge
if "%mode%" == "Zen" goto zen
if "%mode%" == "Challenge" goto challenge

goto start
::if "%mode%" == "dev_" 

:challenge
set space_01=[11]
set space_02=[01]
set space_03=[12]
set space_04=[15]
set space_05=[06]
set space_06=[05]
set space_07=[03]
set space_08=[14]
set space_09=[04]
set space_10=[07]
set space_11=[09]
set space_12=[02]
set space_13=[10]
set space_14=[08]
set space_15=[13]
set space_16=[16]
goto beginning

:zen
set space_01=[01]
set space_02=[02]
set space_03=[03]
set space_04=[04]
set space_05=[05]
set space_06=[06]
set space_07=[07]
set space_08=[08]
set space_09=[09]
set space_10=[10]
set space_11=[11]
set space_12=[12]
set space_13=[13]
set space_14=[14]
set space_15=[15]
set space_16=[16]
goto beginning


:beginning
:print

if "%mode%" == "challenge" goto check_win
if "%mode%" == "Challenge" goto check_win
goto dont_check_win
:check_win
if "%space_01% %space_02% %space_03% %space_04% %space_05% %space_06% %space_07% %space_08% %space_09% %space_10% %space_11% %space_12% %space_13% %space_14% %space_15% %space_16%" == "[01] [02] [03] [04] [05] [06] [07] [08] [09] [10] [11] [12] [13] [14] [15] [16]" goto win
:dont_check_win
cls
echo.
echo                           %moves%
echo       1    2    3    4
echo   5  %space_01% %space_02% %space_03% %space_04%
echo   6  %space_05% %space_06% %space_07% %space_08%
echo   7  %space_09% %space_10% %space_11% %space_12%
echo   8  %space_13% %space_14% %space_15% %space_16%
echo.
echo.
if %moves% geq 10000 echo You must be hacking...&& goto secret_end
if %moves% geq 1000 echo Why have you done this?!&& goto secret_end
if %moves% geq 100 echo Why and how did you use 100 moves..?&& goto secret_end
if %moves% lss 0 echo How did you move a negative amount of times..?&& goto secret_end
echo.
:secret_end
echo.
echo.

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
set /p input=:
if "%input%" == "1" set /a moves=%moves%+1&& goto input_1
if "%input%" == "2" set /a moves=%moves%+1&& goto input_2
if "%input%" == "3" set /a moves=%moves%+1&& goto input_3
if "%input%" == "4" set /a moves=%moves%+1&& goto input_4
if "%input%" == "5" set /a moves=%moves%+1&& goto input_5
if "%input%" == "6" set /a moves=%moves%+1&& goto input_6
if "%input%" == "7" set /a moves=%moves%+1&& goto input_7
if "%input%" == "8" set /a moves=%moves%+1&& goto input_8

if "%input%" == "dev_move" set moves=100
if "%input%" == "dev_moves" set moves=9999999999
if "%input%" == "dev_win" goto win
if "%input%" == "dev_invert" set theme=invert
if "%mode%" == "dev_paper" set theme=paper
if "%input%" == "dev_hacker" set theme=hacker
if "%input%" == "dev" echo.&& echo dev_move&& echo dev_moves&& echo dev_win&& echo dev_invert&& echo dev_paper&& echo dev_hacker&& goto get_input

goto print

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

:win
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
if "%theme%" == "paper" color F0
if "%theme%" == "hacker" color 0A
if "%theme%" == "invert" color 0F
echo.
echo It took you %moves% moves
if "%moves%" == "0" set moves=10000
if "%score%" NEQ "0" set /a score=10000/%moves%
if "%score%" NEQ "0" echo Your score is %score%
if "%score%" == "1" echo=It seems that you have cheated...
echo.
echo Press any button to restart the game.
pause >nul
goto start