@ECHO OFF
CLS
ECHO                VivoToolKit(only MTK for now)
ECHO 1. Unlock Bootloader (MTK or MediaTek)
ECHO 2. Flash TWRP (only if ported twrp is avaliable for your device PLEASE READ MANUAL) 
ECHO 3. Flash GSI (PLEASE READ MANUAL)
ECHO 4. Combine system.new.dat.1+.2+ ...
ECHO 5. Kernel Sources (only few devices)
ECHO 6. Reboot to Fastboot
ECHO 7. Unlock Bootloader (Snapdragon)
ECHO.

CHOICE /C 1234567 /M "Enter your choice:"

IF ERRORLEVEL 7 GOTO SNPDRGNBL
IF ERRORLEVEL 6 GOTO RTFASTBOOT
IF ERRORLEVEL 5 GOTO KSRCE
IF ERRORLEVEL 4 GOTO syscombne
IF ERRORLEVEL 3 GOTO GSI
IF ERRORLEVEL 2 GOTO TWRP
IF ERRORLEVEL 1 GOTO Bootloader

:Bootloader
ECHO Unlock Bootloader ( cd mtkclient-master && pip-install -r requirements.txt && py mtk da seccfg unlock )

:TWRP
ECHO Flash TWRP ( cd Your TWRP here && adb reboot bootloader && fastboot flash recovery twrp.img )

:GSI 
ECHO Flash GSI ( fastboot -w && fastboot reboot fastboot && fastboot flash system Your GSI here/system.img && fastboot reboot )

:syscombne
ECHO System.new.dat.1... combine ( cd Your system new dats here && copy /b system.new.dat+system.new.dat.1+system.new.dat.2+system.new.dat.3+system.new.dat.4+system.new.dat.5+system.new.dat.6+system.new.dat.7+system.new.dat.8+system.new.dat.9+system.new.dat.10+system.new.dat.11+system.new.dat.12+system.new.dat.13+system.new.dat.14+system.new.dat.15 system.dat )
GOTO End

:KSRCE
ECHO https://opensource.vivo.com/

:RTFASTBOOT 
ECHO ( adb reboot flashboot )

:SNPDRGNBL
ECHO ( adb reboot bootloader && fastboot oem unlock && fastboot flashing unlock || fastboot bbk unlock_vivo || fastboot vivo_bsp unlock_vivo || ECHO These methods seem to be not working please use the second method. )

:End
cmd /k

