set cc65path="C:\Retro\DEV\cc65-snapshot-win32"
set mypath="C:\Users\Brizio\Documents\GitHub\PortableChase"

cd %cc65path%\bin\

cl65.exe -O -t c64 %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\display.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c  -o %mypath%\c64.prg

cl65.exe -O -t c128 %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\display.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c  -o %mypath%\c128.prg

cl65.exe -O -t pet %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\display.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c  -o %mypath%\cpet.prg

cl65.exe -O -t plus4 %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\display.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c  -o %mypath%\cplus4.prg

cl65.exe -O -t vic20 --config %cc65path%\cfg\vic20-32k.cfg %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\display.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c  -o %mypath%\cvic20-24k.prg