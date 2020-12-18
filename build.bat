@echo off
echo Making s2built.prev.bin...
IF EXIST s2built.bin move /Y s2built.bin s2built.prev.bin >NUL
echo Building the ROM....
cd mappings
cd 128x128
kc-compress "GHZ (Uncompressed).bin" GHZ.bin
cd..
cd..
asm68k /k /m /c /q /p /o ae- s2.asm, s2built.bin , , s2.lst >s2.log
cls
IF NOT EXIST s2built.bin goto LABLERR
echo Build successful!
goto LABLDONE
:LABLERR
echo Build failed.
type s2.log
:LABLDONE
pause