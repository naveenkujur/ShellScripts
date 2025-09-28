@echo off
REM Useful to developers working on poly-repo project/s
REM Note: The specified folders must be Git working tree folders
REM Hint: Rename the script file as desired, to suit one's specific needs

call :showBranch A:\
call :showBranch N:\
call :showBranch D:\Sandbox\RefPixBook

goto :EOF
:showBranch
pushd %1
for /F "usebackq" %%n in (`git branch --show-current`) do echo Branch [92m%%n[0m ([96m%1[0m)
popd
