@echo Checking for damaged files...
@net session >nul 2>nul
@net session >nul 2>nul
@if errorlevel 2 goto:nonadmin
:admin
@sfc /scannow
@Dism /Online /Cleanup-Image /CheckHealth
@Dism /Online /Cleanup-Image /ScanHealth
@Dism /Online /Cleanup-Image /RestoreHealth

@echo Finished! If you were prompted to restart, please do so now. Otherwise press any key to close this window.
@pause >nul
@goto:eof
:nonadmin
@echo Error: You must run this file as Administrator. Press any key to close this window.
@pause >nul
@goto:eof