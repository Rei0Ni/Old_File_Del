@echo off
forfiles /p "%1" /D -7 /C "cmd /c (if NOT @ext==\"bat\" if NOT @ext==\"ps1\" del /s /q /f @file)"