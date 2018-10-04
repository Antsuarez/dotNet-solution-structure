@echo off
cls

set projectName=%1
if "%~1"=="" SET /P projectName=Please enter a proyect name: 

REM echo we read %projectName%
if "%projectName%"=="" set projectName=NewProject
set SolutionPath=%projectName%

:: We exit if solution folder exist.
if  exist %SolutionPath% ( goto :eof)

:: Folder structure based on https://gist.github.com/davidfowl/ed7564297c61fe9ab814#file-dotnetlayout-md
if not exist %SolutionPath%"\artifacts" (mkdir %SolutionPath%"\artifacts")
if not exist %SolutionPath%"\build"     (mkdir %SolutionPath%"\build")
if not exist %SolutionPath%"\docs"      (mkdir %SolutionPath%"\docs")
if not exist %SolutionPath%"\lib"       (mkdir %SolutionPath%"\lib")
if not exist %SolutionPath%"\packages"  (mkdir %SolutionPath%"\packages")
if not exist %SolutionPath%"\samples"   (mkdir %SolutionPath%"\samples")
if not exist %SolutionPath%"\src"       (mkdir %SolutionPath%"\src")
if not exist %SolutionPath%"\src\modules"       (mkdir %SolutionPath%"\src\modules")
if not exist %SolutionPath%"\src\database"       (mkdir %SolutionPath%"\src\database")
if not exist %SolutionPath%"\tests"     (mkdir %SolutionPath%"\tests")
if not exist %SolutionPath%"\.editorconfig"  (echo ' ' >> %SolutionPath%"\.editorconfig"  )
if not exist %SolutionPath%"\.gitattributes" (echo ' ' >> %SolutionPath%"\.gitattributes" )
if not exist %SolutionPath%"\build.cmd"      (echo ' ' >> %SolutionPath%"\build.cmd"      )
if not exist %SolutionPath%"\build.sh"       (echo ' ' >> %SolutionPath%"\build.sh"       )
if not exist %SolutionPath%"\LICENSE"        (echo "Add license here" >> %SolutionPath%"\LICENSE" )
if not exist %SolutionPath%"\NuGet.Config"   (echo "info" >> %SolutionPath%"\NuGet.Config"   )
if not exist %SolutionPath%"\README.md"      (echo %projectName% was created %date% >> %SolutionPath%"\README.md" )

:: Creating a blank solucion inside the proyect foder
dotnet new sln --name %projectName%\%projectName%

REM dir %1

REM echo
REM echo Proyect created on folder  %~dp0%1
REM echo Proyect name %1



:: Running without administrator access all details in https://www.howtogeek.com/204088/how-to-use-a-batch-file-to-make-powershell-scripts-easier-to-run/
:: gitignore file from https://github.com/GtkSharp/GtkSharp/blob/develop/.gitignore
@ECHO OFF
REM PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "curl 'https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore' -OutFile "%1\.gitignore
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "curl 'https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore' -OutFile "%projectName%\.gitignore
REM PAUSE


:eof
:: Finish 
