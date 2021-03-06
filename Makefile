# Makefile for CROSS-CHASE


ifneq ($(COMSPEC),)
DO_WIN:=1
endif
ifneq ($(ComSpec),)
DO_WIN:=1
endif

ifeq ($(DO_WIN),1)
EXEEXT = .exe
endif

SOURCE_PATH := src

CC65_PATH ?= /cygdrive/c/cc65-snapshot-win32/bin/
Z88DK_PATH ?= /cygdrive/c/z88dk/bin/
Z88DK_INCLUDE ?= /cygdrive/c/z88dk/include
BUILD_PATH ?= build
MYCC65 ?= cl65$(EXEEXT)
MYZ88DK ?= zcc$(EXEEXT)
TOOLS_PATH ?= ./tools


# ------------------------------------------------------------------------------------------
#CC65

atari_color:
	$(CC65_PATH)$(MYCC65) -O -t atari  -DREDEFINED_CHARS -DFULL_GAME -DATARI_MODE1 -DSOUNDS --config $(SOURCE_PATH)/../cfg/atari_mode1_redefined_chars.cfg $(SOURCE_PATH)/atari/atari_sounds.c $(SOURCE_PATH)/atari/atari_mode1_redefined_chars_graphics.c  $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_atari_color.xex

atari_no_color:
	$(CC65_PATH)$(MYCC65) -O -t atari -DFULL_GAME -DSOUNDS $(SOURCE_PATH)/atari/atari_sounds.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_atari_no_color.xex

atari_no_color_16k:
	$(CC65_PATH)$(MYCC65) -O -t atari -DSOUNDS $(SOURCE_PATH)/atari/atari_sounds.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/LIGHT_atari_no_color_16k.xex

atari5200:
	$(CC65_PATH)$(MYCC65) -O -t atari5200 $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/LIGHT_atari5200.rom


atmos:
	$(CC65_PATH)$(MYCC65)  -O  -DSOUNDS -DREDEFINED_CHARS -DFULL_GAME -t atmos --config $(SOURCE_PATH)/../cfg/atmos_better_tap.cfg $(SOURCE_PATH)/atmos/atmos_redefined_characters.c $(SOURCE_PATH)/atmos/atmos_input.c  $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_atmos_16k.tap

atmos_16k:
	$(CC65_PATH)$(MYCC65) -O  -DSOUNDS -t atmos --config $(SOURCE_PATH)/../cfg/atmos_better_tap.cfg $(SOURCE_PATH)/atmos/atmos_input.c  $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/LIGHT_atmos_16k.tap


vic20_exp_16k:
	$(CC65_PATH)$(MYCC65) -O -t vic20 -DFULL_GAME -DSOUNDS --config $(SOURCE_PATH)/../cfg/vic20-16k.cfg $(SOURCE_PATH)/vic20/vic20_sounds.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_vic20_exp_16k.prg

vic20_exp_8k:
	$(CC65_PATH)$(MYCC65) -O -t vic20  -DSOUNDS --config $(SOURCE_PATH)/../cfg/vic20-16k.cfg $(SOURCE_PATH)/vic20/vic20_sounds.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/LIGHT_vic20_exp_8k.prg

c64:
	$(CC65_PATH)$(MYCC65) -O -t c64 -DFULL_GAME -DREDEFINED_CHARS -DSOUNDS --config $(SOURCE_PATH)/../cfg/c64_GFXat0xC000.cfg  $(SOURCE_PATH)/graphics/graphics.s $(SOURCE_PATH)/c64/c64_redefined_characters.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_c64.prg
	$(TOOLS_PATH)/exomizer sfx basic $(BUILD_PATH)/FULL_c64.prg -o $(BUILD_PATH)/FULL_c64_exomized.prg
	rm $(BUILD_PATH)/FULL_c64.prg

c128_40col:
	$(CC65_PATH)$(MYCC65) -O -t c128 -DFULL_GAME -DSOUNDS $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_c128_40col.prg

c128_80col:
	$(CC65_PATH)$(MYCC65) -O -D C128_80COL_VIDEO_MODE -DFULL_GAME -DSOUNDS -t c128 $(SOURCE_PATH)/c128/c128_80col_graphics.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_c128_80col.prg


c16_16k:
	$(CC65_PATH)$(MYCC65) -O -t c16 -DSOUNDS --config $(SOURCE_PATH)/../cfg/c16-16k.cfg $(SOURCE_PATH)/c264/c264_sounds.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/LIGHT_c16_16k.prg

c16_32k:
	$(CC65_PATH)$(MYCC65) -O -t c16 -DREDEFINED_CHARS -DFULL_GAME -DSOUNDS $(SOURCE_PATH)/c264/c264_graphics.c $(SOURCE_PATH)/c264/c264_sounds.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_c16_32k.prg



pet:
	$(CC65_PATH)$(MYCC65) -O -t pet -DFULL_GAME $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_pet.prg

cbm610:
	$(CC65_PATH)$(MYCC65) -O -t cbm610 -DFULL_GAME $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_cbm610.prg

cbm510:
	$(CC65_PATH)$(MYCC65) -O -t cbm510 -DFULL_GAME -DSOUNDS $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_cbm510.prg


nes:
	$(CC65_PATH)$(MYCC65) -O -t nes -DFULL_GAME $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/FULL_nes.nes

	

apple2:	
	$(CC65_PATH)$(MYCC65) -O -t apple2 -DFULL_GAME $(SOURCE_PATH)/sleep_macros.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/apple2.bin

	cp $(SOURCE_PATH)/../tools/MASTER_BOOT_ASCHASE.DSK $(BUILD_PATH)/FULL_apple2.dsk

	java -jar $(SOURCE_PATH)/../tools/ac.jar -cc65 $(BUILD_PATH)/FULL_apple2.dsk aschase B < $(BUILD_PATH)/apple2.bin

	rm $(BUILD_PATH)/apple2.bin




apple2enh:
	$(CC65_PATH)$(MYCC65) -O -t apple2enh -DFULL_GAME $(SOURCE_PATH)/sleep_macros.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c  -o $(BUILD_PATH)/apple2enh.bin

	cp $(SOURCE_PATH)/../tools/MASTER_BOOT_ASCHASE.DSK $(BUILD_PATH)/FULL_apple2enh.dsk

	java -jar $(SOURCE_PATH)/../tools/ac.jar -cc65 $(BUILD_PATH)/FULL_apple2enh.dsk aschase B < $(BUILD_PATH)/apple2enh.bin

	rm $(BUILD_PATH)/apple2enh.bin


	
# ------------------------------------------------------------------------------------------
#Z88DK

aquarius_exp_16k:
	$(Z88DK_PATH)$(MYZ88DK) +aquarius -clib=ansi -vn -D__AQUARIUS__ -DFULL_GAME -lndos -o FULL_aquarius_exp_16k -create-app  $(SOURCE_PATH)/aquarius/aquarius_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(SOURCE_PATH)/../FULL_aquarius_exp_16k
	mv $(SOURCE_PATH)/../FULL_aquarius_exp_16k.caq $(BUILD_PATH)
	mv $(SOURCE_PATH)/../_FULL_aquarius_exp_16k.caq $(BUILD_PATH)

ace_exp_16k:
	$(Z88DK_PATH)$(MYZ88DK) +ace -O3 -D__ACE__ -DFULL_GAME -clib=ansi -o full -Cz--audio -create-app  $(SOURCE_PATH)/zx81/zx81_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	cp full.wav $(BUILD_PATH)/FULL_ace_exp_16k.wav
	rm full.wav
	rm full.tap
	rm full

zx80_exp_16k:
	$(Z88DK_PATH)$(MYZ88DK) +zx80 -O3 -vn -D__ZX80__ -lndos -create-app -o  $(BUILD_PATH)/LIGHT_zx80_experimental.prg $(SOURCE_PATH)/zx81/zx81_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_zx80_experimental.prg

zx80_exp_32k:
	$(Z88DK_PATH)$(MYZ88DK) +zx80 -O3 -vn -D__ZX80__ -DFULL_GAME -lndos -create-app -o  $(BUILD_PATH)/FULL_zx80_experimental.prg $(SOURCE_PATH)/zx81/zx81_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_zx80_experimental.prg
	
zx81_exp_16k:
	$(Z88DK_PATH)$(MYZ88DK) +zx81 -O3 -vn -D__ZX81__ -lndos -create-app -o  $(BUILD_PATH)/LIGHT_zx81_experimental.prg $(SOURCE_PATH)/zx81/zx81_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_zx81_experimental.prg

zx81_exp_32k:
	$(Z88DK_PATH)$(MYZ88DK) +zx81 -O3 -vn -D__ZX81__ -DFULL_GAME -lndos -create-app -o  $(BUILD_PATH)/FULL_zx81_experimental.prg $(SOURCE_PATH)/zx81/zx81_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_zx81_experimental.prg
	
cpc_color:
	$(Z88DK_PATH)$(MYZ88DK) +cpc -O3 -DREDEFINED_CHARS -vn -DFULL_GAME -clib=ansi -D__CPC__ -lndos -create-app -o $(BUILD_PATH)/FULL_cpc_color.prg $(SOURCE_PATH)/cpc/cpc_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	$(SOURCE_PATH)/../tools/2cdt/2cdt.exe -n -r cross_chase $(BUILD_PATH)/FULL_cpc_color.cpc  $(BUILD_PATH)/FULL_cpc_color.cdt
	rm $(BUILD_PATH)/FULL_cpc_color.cpc 
	rm $(BUILD_PATH)/FULL_cpc_color.prg

cpc_no_color:
	$(Z88DK_PATH)$(MYZ88DK) +cpc -O3 -DREDEFINED_CHARS -DCPC_NO_COLOR -vn -DFULL_GAME -clib=ansi -D__CPC__ -lndos -create-app -o $(BUILD_PATH)/FULL_cpc_no_color.prg $(SOURCE_PATH)/cpc/cpc_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	$(SOURCE_PATH)/../tools/2cdt/2cdt.exe -n -r cross_chase $(BUILD_PATH)/FULL_cpc_no_color.cpc  $(BUILD_PATH)/FULL_cpc_no_color.cdt
	rm $(BUILD_PATH)/FULL_cpc_no_color.cpc 
	rm $(BUILD_PATH)/FULL_cpc_no_color.prg
	
msx_no_color_16k:
	$(Z88DK_PATH)$(MYZ88DK) +msx -O3 -create-app -vn -D__MSX__ -lndos -create-app -o $(BUILD_PATH)/LIGHT_msx_no_color_16k.prg $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_msx_no_color_16k.prg 

msx_32k:
	$(Z88DK_PATH)$(MYZ88DK) +msx -O3 -DSOUNDS -DREDEFINED_CHARS -create-app -vn -DMSX_MODE1 -DFULL_GAME -D__MSX__ -lndos -create-app -o $(BUILD_PATH)/FULL_msx_color_32k.prg $(SOURCE_PATH)/msx/msx_graphics.c $(SOURCE_PATH)/msx/msx_sounds.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_msx_color_32k.prg 

	
vz200_16k:	
	$(Z88DK_PATH)$(MYZ88DK) +vz -O3 -vn -D__VZ__ -clib=ansi -lndos -create-app -o  $(BUILD_PATH)/LIGHT_vz200_16k.vz $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_vz200_16k.cas
	
vz200_32k:
	$(Z88DK_PATH)$(MYZ88DK) +vz -O3 -vn -D__VZ__ -DFULL_GAME -clib=ansi -lndos -create-app -o  $(BUILD_PATH)/FULL_vz200_32k.vz $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_vz200_32k.cas
	
svi_32k:
	$(Z88DK_PATH)$(MYZ88DK) +svi -O3 -vn -lndos -DFULL_GAME -D__SVI__ -create-app -subtype=wav -o  $(BUILD_PATH)/FULL_svi_32k $(SOURCE_PATH)/svi/svi_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c

svi_16k:
	$(Z88DK_PATH)$(MYZ88DK) +svi -O3 -vn -lndos -D__SVI__ -create-app -subtype=wav -o  $(BUILD_PATH)/LIGHT_svi_16k $(SOURCE_PATH)/svi/svi_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c

# Optimize with [VERY SLOW]: -SO3 --max-allocs-per-node200000
spectrum_48k:
	$(Z88DK_PATH)$(MYZ88DK) +zx -startup=1  -clib=sdcc_iy -vn -DFULL_GAME -DREDEFINED_CHARS -DSOUNDS -DSPECTRUM_32COL -D__SPECTRUM__ -create-app -o $(BUILD_PATH)/FULL_spectrum_48k.prg $(SOURCE_PATH)/spectrum/spectrum_graphics.c $(SOURCE_PATH)/sleep_macros.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_spectrum_48k_CODE.bin 
	rm $(BUILD_PATH)/FULL_spectrum_48k_BANK_07.bin

# Optimize with [VERY SLOW]: -SO3 --max-allocs-per-node200000
spectrum_16k:
	$(Z88DK_PATH)$(MYZ88DK) +zx -startup=1  -clib=sdcc_iy -vn -DSPECTRUM_32COL -D__SPECTRUM__ -create-app -o $(BUILD_PATH)/LIGHT_spectrum_16k.prg $(SOURCE_PATH)/sleep_macros.c $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_spectrum_16k_CODE.bin 
	rm $(BUILD_PATH)/LIGHT_spectrum_16k_BANK_07.bin

vg5k_exp_16k:
	$(Z88DK_PATH)$(MYZ88DK) +vg5k -O3 -vn -DFULL_GAME -D__VG5K__ -lndos -create-app -o $(BUILD_PATH)/FULL_vg5k_exp_16k.prg $(SOURCE_PATH)/vg5k/vg5k_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/FULL_vg5k_exp_16k.prg

vg5k:
	$(Z88DK_PATH)$(MYZ88DK) +vg5k -O3 -vn -D__VG5K__ -lndos -create-app -o $(BUILD_PATH)/LIGHT_vg5k.prg $(SOURCE_PATH)/vg5k/vg5k_graphics.c $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
	rm $(BUILD_PATH)/LIGHT_vg5k.prg


# DEBUG
# zcc +zx -D -vn -DFULL_GAME -DREDEFINED_CHARS -DSOUNDS -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_32COL -D__SPECTRUM__ -lndos -create-app -o $(BUILD_PATH)/FULL_zx_spectrum_redefined_characters_classic.prg $(SOURCE_PATH)/display_macros.c $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
# rm $(BUILD_PATH)/FULL_zx_spectrum_redefined_characters_classic.prg
# rm $(BUILD_PATH)/FULL_zx_spectrum_redefined_characters_classic_BANK_07.bin

# zcc +zx -SO3 -vn -DFULL_GAME -DSOUNDS -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_32COL -D__SPECTRUM__  -lndos -create-app -o $(BUILD_PATH)/ZXSpectrum_classic.prg $(SOURCE_PATH)/display_macros.c  $(SOURCE_PATH)/enemy.c $(SOURCE_PATH)/invincible_enemy.c $(SOURCE_PATH)/level.c $(SOURCE_PATH)/character.c $(SOURCE_PATH)/text.c $(SOURCE_PATH)/missile.c $(SOURCE_PATH)/strategy.c $(SOURCE_PATH)/input_macros.c $(SOURCE_PATH)/main.c
# rm $(BUILD_PATH)/FULL_zx_spectrum_classic.prg
# rm $(BUILD_PATH)/FULL_zx_spectrum_classic_BANK_07.bin

.PHONY: vic20exp_8k vic20exp_16k  atari_color atari_no_color atari_no_color_16k atari5200 atmos atmos_16k c128_40col c128_80col c16_16k c16_32k c64 pet cbm510 cbm610 nes apple2 apple2enh

cc65_targets: vic20exp_8k vic20exp_16k atari_color atari_no_color atari_no_color_16k atari5200 atmos atmos_16k c128_40col c128_80col c16_16k c16_32k c64 pet cbm510 cbm610 nes apple2 apple2enh

z88dk_targets: aquarius_exp_16k ace_exp_16k zx80_exp_16k zx80_exp_32k zx81_exp_16k zx81_exp_32k cpc_no_color cpc_color msx_no_color_16k msx_color_32k

all: cc65_targets z88dk_targets

clean:
	rm -rf $(BUILD_PATH)/*
	rm -rf $(SOURCE_PATH)/*.o

help:
	cat BUILD.txt

targets:
	cat TARGETS.txt
	
