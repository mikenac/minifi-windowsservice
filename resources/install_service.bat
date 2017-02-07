@echo off

set MINIFI_VERSION=0.1.0

call minifi-env.bat
set LIB_DIR=%MINIFI_ROOT%\lib\bootstrap
set CONF_DIR=%MINIFI_ROOT%\conf

set BOOTSTRAP_CONF_FILE=%CONF_DIR%\bootstrap.conf
set SRV_BIN=%cd%\minifi-service.exe
set SVC_NAME=minifi-service
set SVC_DISPLAY="Apache MiNiFi"
set SVC_DESCRIPTION="Apache MiNiFi Data Integration Engine"
set JVM=auto
set PR_JVMMS=128
set PR_JVMMX=512
set PR_JVMSS=4000
set START_MODE=jvm
set STOP_MODE=jvm
set STOP_TIMEOUT=10
set STARTUP=auto
set JAVA_ARGS=-Dorg.apache.nifi.minifi.bootstrap.config.log.dir="%MINIFI_LOG_DIR%";-Dorg.apache.nifi.minifi.bootstrap.config.pid.dir="%MINIFI_PID_DIR%";-Dorg.apache.nifi.minifi.bootstrap.config.file="%BOOTSTRAP_CONF_FILE%"
set START_CLASS=org.apache.nifi.minifi.bootstrap.WindowsService
set START_METHOD=start
set STOP_CLASS=org.apache.nifi.minifi.bootstrap.WindowsService
set STOP_METHOD=stop
REM START_PARAMS=-verbose
set START_PARAMS=
REM STOP_PARAMS=-verbose
set STOP_PARAMS=
set CLASS_PATH=lib\bootstrap\minifi-windowsservice-%MINIFI_VERSION%.jar;%CONF_DIR%;%LIB_DIR%\*;
set LOG_PATH="%MINIFI_ROOT%\logs"
set LOG_PREFIX=minifi-service.log

"%SRV_BIN%" //IS//%SVC_NAME% ^
--DisplayName=%SVC_DISPLAY% ^
--Description=%SVC_DESCRIPTION% ^
--Install="%SRV_BIN%" ^
--Jvm="%JVM%" ^
--JvmMs="%PR_JVMMS%" ^
--JvmMx="%PR_JVMMX%" ^
--JvmSs="%PR_JVMSS%" ^
--StartMode="%START_MODE%" ^
--StopMode="%STOP_MODE%" ^
--Startup="%STARTUP%" ^
--StartClass="%START_CLASS%" ^
--StopClass="%STOP_CLASS%" ^
--StartParams="%START_PARAMS%" ^
--StopParams="%STOP_PARAMS%" ^
--StartMethod="%START_METHOD%" ^
--StopMethod="%STOP_METHOD%" ^
--StopTimeout="%STOP_TIMEOUT%" ^
--Classpath="%CLASS_PATH%" ^
--JvmOptions="%JAVA_ARGS%" ^
--LogLevel=ERROR ^
--LogPath="%LOG_PATH%" ^
--LogPrefix="%LOG_PREFIX%" ^
--StdOutput=auto ^
--StdError=auto

REM Start the service after installation
"%SRV_BIN%" //ES//%SVC_NAME%