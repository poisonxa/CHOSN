@echo off
setlocal enabledelayedexpansion
COLOR A
echo ###############################################
echo ########### 1Bash Windows Installer ###########
echo ###############################################
echo.
echo.
echo.
echo Welcome to CHOSN questionnaire for setting up your RIG
echo take your time, read the instructions carefully.
echo.
echo.
echo If you make a mistake in one of your answer,
echo type "clear" to any question to restart the section.
echo.
echo.
echo.
echo.
echo.
<nul set /p "=Press Enter to continue..."
pause >nul
cls

::#######################################

::############ WIFI SETTINGS ############

:whileWIFI
	@echo [WIFI Settings]>> 1Bash.ini
	set /p WIFI=Is your rig connected by WIFI [y/n]?
	if %WIFI%==y (
		set result=true
	)
	if %WIFI%==n (
		set result=true
	)
	if NOT "%result%"=="true" (
		echo Error in your answer, must be [y/n]
		GOTO :whileWIFI
	)
	@echo WIFI=%WIFI%>> 1Bash.ini
	if %WIFI%==y (
		set /p WIFISSID=What is you Network SSID?
		@echo WIFI_SSID=!WIFISSID!>> 1Bash.ini
		set /p WIFIPASS=What is you Network PASSWORD?
		@echo WIFI_PASS=!WIFIPASS!>> 1Bash.ini
	)
	:WIFIConfirm
	cls
	echo ###############################################
	echo ############## WIFI Confirmation ##############
	echo ###############################################
	echo.
	echo.
	echo.
	echo Using Wifi = %WIFI%
	echo SSID = %WIFISSID%
	echo Password = %WIFIPASS%
	echo.
	set /p WIFIConfirm=Is all the informations OK [y/n]?
	if %WIFIConfirm%==n (
		set result1=true
		cls
		GOTO :eraseWIFI
	)
	if %WIFIConfirm%==y (
		set result1=true
	)
	if NOT "%result1%"=="true" (
		echo Error in your answer, must be [y/n]
		cls
		GOTO :WIFIConfirm
	)
	set result=false
	set result1=false
	set result2=false
	cls
	
::#######################################

::############# WTM SETTINGS ############

:whileWTM
	@echo.>> 1Bash.ini
	@echo [WTM Settings]>> 1Bash.ini
	:whileWTM2
	set /p WTM=Are you going to use WTM Auto-Switcher [y/n]?
	if %WTM%==y (
		set result=true
		@echo WTM=!WTM!>> 1Bash.ini
		:whileWTM3
		set /p WTM_PROFIT=Do you want to use the profit checker [y/n]?
		if !WTM_PROFIT!==y (
			set result1=true
			@echo WTM_PROFIT=!WTM_PROFIT!>> 1Bash.ini
			set /p WTM_PROFIT_TIME=Interval between profit check [in minutes;2]?
			@echo WTM_PROFIT_TIME=!WTM_PROFIT_TIME!>> 1Bash.ini
		)
		if !WTM_PROFIT!==n (
			set result1=true
			@echo WTM_PROFIT=!WTM_PROFIT!>> 1Bash.ini
		)
		if NOT "!result1!"=="true" (
			echo Error in your answer, must be [y/n]
			GOTO :whileWTM3
		)
		set /p WTM_COIN=What are the coins you want to use for WTM Auto-Switcher [Ex: ZEN;ZEC;MONA]?
		@echo WTM_COIN=!WTM_COIN!>> 1Bash.ini
		set /p WTM_SWITCH_TIME=Interval between switch check [in minutes;2]?
		@echo WTM_SWITCH_TIME=!WTM_SWITCH_TIME!>> 1Bash.ini
		set /p WTM_SWITCH_PERCENT=Minimum difference to switch to a new coin [in percentage;20]?
		@echo WTM_SWITCH_PERCENT=!WTM_SWITCH_PERCENT!>> 1Bash.ini
		set /p WTM_CURRENCY=Currency in which you want to use WTM?
		@echo WTM_CURRENCY=!WTM_CURRENCY!>> 1Bash.ini
	)
	if %WTM%==n (
		set result=true
		@echo WTM=%WTM%>> 1Bash.ini
	)
	if NOT "%result%"=="true" (
		echo Error in your answer, must be [y/n]
		GOTO :whileWTM2
	)
	:WTMConfirm
	cls
	echo ###############################################
	echo ############### WTM Confirmation ##############
	echo ###############################################
	echo.
	echo.
	echo.
	echo Using WTM = %WTM%
	echo WTM Profit = %WTM_Profit%
	echo WTM Profit Time = %WTM_PROFIT_TIME%
	echo WTM Coin = %WTM_COIN%
	echo WTM Switch Time = %WTM_SWITCH_TIME%
	echo WTM Switch Percent = %WTM_SWITCH_PERCENT%
	echo WTM Currency = %WTM_CURRENCY%
	echo.
	set /p WTMConfirm=Is all the informations OK [y/n]?
	if %WTMConfirm%==n (
		set result2=true
		cls
		GOTO :eraseWTM
	)
	if %WTMConfirm%==y (
		set result2=true
	)
	if NOT "%result2%"=="true" (
		echo Error in your answer, must be [y/n]
		cls
		GOTO :WTMConfirm
	)
	set result=false
	set result1=false
	set result2=false
	cls

::#######################################
	
::########### 8COINS SETTINGS ###########

:whileCOIN
	@echo.>> 1Bash.ini
	@echo [8COINS Settings]>> 1Bash.ini
	set /p COIN=What is the coin you want to mine?
	:whileCOIN2
	@echo COIN=%COIN%>> 1Bash.ini
	set /p WORKERNAME=Are you going to use a default Worker Name [y/n]?
	if %WORKERNAME%==y (
		set result=true
		set /p COIN_WORKERNAME=What is going to be the default Worker Name?
		@echo COIN_WORKER=%WORKERNAME%>> 1Bash.ini
		@echo COIN_WORKERNAME=%COIN_WORKERNAME%>> 1Bash.ini
	)
	if %WORKERNAME%==n (
		set result=true
		@echo COIN_WORKER=%WORKERNAME%>> 1Bash.ini
	)
	if NOT "%result%"=="true" (
		echo Error in your answer, must be [y/n]
		GOTO :whileCOIN2
	)
	:WTMConfirm
	cls
	echo ###############################################
	echo ############## 8Coins Confirmation ############
	echo ###############################################
	echo.
	echo.
	echo.
	echo Coin = %COIN%
	echo Coin Worker = %WORKERNAME%
	echo Coin Worker Name = %COIN_WORKERNAME%
	echo.
	set /p COINConfirm=Is all the informations OK [y/n]?
	if %COINConfirm%==n (
		set result2=true
		cls
		GOTO :eraseCOIN
	)
	if %COINConfirm%==y (
		set result2=true
	)
	if NOT "%result2%"=="true" (
		echo Error in your answer, must be [y/n]
		cls
		GOTO :COINConfirm
	)
	set result=false
	set result1=false
	set result2=false
	cls
	
::#######################################

::############# 1OC SETTINGS ############	

:whileOC
	@echo.>> 1Bash.ini
	@echo [1OC Settings]>> 1Bash.ini
	:whileOC2
	set /p OC=How to you want your overclocking [manual/auto]?
	if %OC%==manual (
		set result=true
		@echo OC=!OC!>> 1Bash.ini
	)
	if %OC%==auto (
		set result=true
		@echo OC=!OC!>> 1Bash.ini
		set /p AUTO_GPU=How many GPUs in your RIG?
		
	)
	if NOT "%result%"=="true" (
		echo Error in your answer, must be [manual/auto]
		GOTO :whileOC2
	)

::#######################################

::########### ERASE FUNCTIONS ###########

:eraseWIFI
	type 1Bash.ini | findstr /v WIFI > new_1bash.ini
	del 1Bash.ini
	ren new_1bash.ini 1Bash.ini
	GOTO :whileWIFI
	
:eraseWTM
	type 1Bash.ini | findstr /v WTM > new_1bash.ini
	del 1Bash.ini
	ren new_1bash.ini 1Bash.ini
	GOTO :whileWTM
	
:eraseOC	
	type 1Bash.ini | findstr /v OC > new_1bash.ini
	del 1Bash.ini
	ren new_1bash.ini 1Bash.ini
	GOTO :whileOC
	
:eraseCOIN
	type 1Bash.ini | findstr /v COIN > new_1bash.ini
	del 1Bash.ini
	ren new_1bash.ini 1Bash.ini
	GOTO :whileCOIN
