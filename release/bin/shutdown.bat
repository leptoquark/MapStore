@echo off
REM -----------------------------------------------------------------------------
REM Shutdown Script for MapStore
REM -----------------------------------------------------------------------------


cls
echo Shutting down MapStore...
echo.
set error=0

rem JAVA_HOME not defined
if "%JAVA_HOME%" == "" goto noJava

rem JAVA_HOME defined incorrectly
if not exist "%JAVA_HOME%\bin\java.exe" goto badJava

rem No errors
goto shutdown

:noJava
  echo The JAVA_HOME environment variable is not defined.
goto JavaFail

:badJava
  echo The JAVA_HOME environment variable is not defined correctly.
goto JavaFail

:JavaFail
  echo This environment variable is needed to run this program.
  echo.
  echo Set this environment variable via the following command:
  echo    set JAVA_HOME=[path to Java]
  echo Example:
  echo    set JAVA_HOME=C:\Program Files\Java\jdk6
  echo.
  set error=1
goto end

:shutdown
  set RUN_JAVA=%JAVA_HOME%\bin\java
  cd ..
  "%RUN_JAVA%" -DSTOP.PORT=8079 -DSTOP.KEY=mapstore -jar start.jar --stop
  cd bin
goto end

:end
  if %error% == 1 echo Shutting down MapStore was unsuccessful. 
  echo.
  pause
























