#ifndef _C264_GRAPHICS
#define _C264_GRAPHICS

	#include <peekpoke.h>

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <unistd.h>

	#define GRAPHICS_MODE 0
	
	//#define SCRMEM *(unsigned int*) 88
	
	 Image PLAYER_IMAGE;
	 Image GHOST_IMAGE;
	 Image DEAD_GHOST_IMAGE;
	 Image INVINCIBLE_GHOST_IMAGE;
	 Image BOMB_IMAGE;
	 Image POWERUP_IMAGE;
	 Image MISSILE_IMAGE;
	 Image GUN_IMAGE;

	 Image LEFT_ENEMY_MISSILE_IMAGE;
	 Image RIGHT_ENEMY_MISSILE_IMAGE;
	 
	 extern char YSize; 
	 
	void INIT_GRAPHICS(void)
	{
		unsigned short i;
		static char player[8] = {24,36,24,102,153,24,36,102};
		
		POKE(1177,62); // disable switch to RAM in PEEK
		for(i=0;i<1023;++i)
		{
			POKE(24576+2048+i,PEEK((unsigned long) (54272ul+(unsigned long) i)));
		}
		POKE(1177,63); // re-enable switch to RAM in PEEK
		POKE(65299ul,(PEEK(65299ul)&3)|((16+8+2)*4)); // change character base address to 8192
		POKE(65298ul,PEEK(65298ul)&251); // make graphics chip get characters from RAM
		
		for(i=0;i<8;++i)
		{
			POKE(24576+2048+320+i,player[i]);
		}
		
		// for(i=0;i<8;++i)
		// {
			// POKE(24576+320+8+i,player[i]);
		// }
		
		// for(i=0;i<8;++i)
		// {
			// POKE(24576+320+8*2+i,player[i]);
		// }

		// for(i=0;i<8;++i)
		// {
			// POKE(24576+320+8*2+i,player[i]);
		// }

		// for(i=0;i<8;++i)
		// {
			// POKE(24576+320+8*3+i,player[i]);
		// }		
	}
	 
	 
	// TODO: Sprite initialization (to be performed only once) should be separated from level generation
	void INIT_IMAGES(void)
	{		
		PLAYER_IMAGE._color = COLOR_CYAN;
		INVINCIBLE_GHOST_IMAGE._color = COLOR_YELLOW;
		POWERUP_IMAGE._color = COLOR_BLUE;
		GUN_IMAGE._color = COLOR_BLUE;
		BOMB_IMAGE._color = COLOR_RED;
		DEAD_GHOST_IMAGE._color = COLOR_RED;

		GHOST_IMAGE._imageData = 'o';
		INVINCIBLE_GHOST_IMAGE._imageData = '+';
		BOMB_IMAGE._imageData = 'X';
		PLAYER_IMAGE._imageData = '(';
		POWERUP_IMAGE._imageData = 'S';
		GUN_IMAGE._imageData = '!';
		MISSILE_IMAGE._imageData = '.';
		DEAD_GHOST_IMAGE._imageData = BOMB_IMAGE._imageData;

		GHOST_IMAGE._color = COLOR_WHITE;
		MISSILE_IMAGE._color = COLOR_WHITE;

		LEFT_ENEMY_MISSILE_IMAGE._imageData = '>';
		LEFT_ENEMY_MISSILE_IMAGE._color = COLOR_WHITE;
		RIGHT_ENEMY_MISSILE_IMAGE._imageData = '<';
		RIGHT_ENEMY_MISSILE_IMAGE._color = COLOR_WHITE;		
	}


#endif // _C264_GRAPHICS