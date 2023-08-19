@echo off
cls

set projectName=%1
if "%~1"=="" SET /P projectName=Please enter a solution name: 

REM echo we read %projectName%
if "%projectName%"=="" set projectName=NewProject
set SolutionPath=%projectName%

:: We exit if solution folder exist.
if  exist %SolutionPath% ( goto :eof)

:: Folder structure based on https://gist.github.com/davidfowl/ed7564297c61fe9ab814#file-dotnetlayout-md
REM if not exist %SolutionPath%"\artifacts" (mkdir %SolutionPath%"\artifacts")
REM if not exist %SolutionPath%"\build"     (mkdir %SolutionPath%"\build")
if not exist %SolutionPath%"\docs"      (mkdir %SolutionPath%"\docs")
REM if not exist %SolutionPath%"\lib"       (mkdir %SolutionPath%"\lib")
if not exist %SolutionPath%"\packages"  (mkdir %SolutionPath%"\packages")
if not exist %SolutionPath%"\samples"   (mkdir %SolutionPath%"\samples")
if not exist %SolutionPath%"\src"       (mkdir %SolutionPath%"\src")
if not exist %SolutionPath%"\src\Application"       (mkdir %SolutionPath%"\src\Application")
if not exist %SolutionPath%"\src\Domain"       (mkdir %SolutionPath%"\src\Domain")
if not exist %SolutionPath%"\src\Infrastructure"       (mkdir %SolutionPath%"\src\Infrastructure")
if not exist %SolutionPath%"\src\Web"       (mkdir %SolutionPath%"\src\Web")
if not exist %SolutionPath%"\tests"     (mkdir %SolutionPath%"\tests")
if not exist %SolutionPath%"\.editorconfig"  (echo "" >> %SolutionPath%"\.editorconfig"  )
if not exist %SolutionPath%"\.gitattributes" (echo "" >> %SolutionPath%"\.gitattributes" )
if not exist %SolutionPath%"\build.cmd"      (echo "" >> %SolutionPath%"\build.cmd"      )
if not exist %SolutionPath%"\build.sh"       (echo "" >> %SolutionPath%"\build.sh"       )
if not exist %SolutionPath%"\LICENSE"        (echo "" >> %SolutionPath%"\LICENSE" )
REM if not exist %SolutionPath%"\NuGet.Config"   (echo "" >> %SolutionPath%"\NuGet.Config"   )
if not exist %SolutionPath%"\README.md"      (echo %projectName% was created %date% >> %SolutionPath%"\README.md" )




:: Creating a blank solucion inside the proyect foder
dotnet new sln --output %projectName%


dotnet new mvc --output %SolutionPath%"\src\Web" --name "%projectName%.Web"
dotnet new classlib --output %SolutionPath%"\src\Application" --name "%projectName%.Application"
dotnet new classlib --output %SolutionPath%"\src\Domain" --name "%projectName%.Domain"
dotnet new classlib --output %SolutionPath%"\src\Infrastructure" --name "%projectName%.Infrastructure"

cd %projectName%

dotnet sln ".\%projectName%.sln" add ".\src\Web\%projectName%".Web.csproj"
dotnet sln ".\%projectName%.sln" add ".\src\Application\%projectName%".Application.csproj"
dotnet sln ".\%projectName%.sln" add ".\src\Domain\%projectName%".Domain.csproj"
dotnet sln ".\%projectName%.sln" add ".\src\Infrastructure\%projectName%".Infrastructure.csproj"

REM dotnet sln ".\%projectName%.sln" add "(ls -r **/*.csproj)"

cd ..

REM dir %1

:: Running without administrator access all details in https://www.howtogeek.com/204088/how-to-use-a-batch-file-to-make-powershell-scripts-easier-to-run/
:: gitignore file from https://github.com/github/gitignore/blob/master/VisualStudio.gitignore
@ECHO OFF
if not exist %SolutionPath%"\NuGet.Config" (
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "curl 'https://raw.githubusercontent.com/Antsuarez/dotNet-solution-structure/master/test/NewProject/NuGet.Config' -OutFile "%projectName%\NuGet.Config
)
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "curl 'https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore' -OutFile "%projectName%\.gitignore
REM PAUSE


:eof
:: Finish
