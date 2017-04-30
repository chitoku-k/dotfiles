@echo off
powershell.exe -Command "Start-Process php %~dp0%install" -Verb Runas
