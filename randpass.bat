@echo off
powershell -Command "Add-Type -Assembly System.Web; [Web.Security.Membership]::GeneratePassword(16,4);"