/* --------------------------------------------------------------------------------------- */ 
// 
// CROSS CHASE by Fabrizio Caruso
//
// Fabrizio_Caruso@hotmail.com
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from
// the use of this software.

// Permission is granted to anyone to use this software for non-commercial applications, 
// subject to the following restrictions:

// 1. The origin of this software must not be misrepresented; you must not
// claim that you wrote the original software. If you use this software in
// a product, an acknowledgment in the product documentation would be
// appreciated but is not required.

// 2. Altered source versions must be plainly marked as such, and must not
// be misrepresented as being the original software.

// 3. This notice may not be removed or altered from any source distribution.
/* --------------------------------------------------------------------------------------- */ 
 
//#include <peekpoke.h>
#include "display_macros.h"

#include <stdio.h>


extern unsigned char XSize;


void INIT_GRAPHICS(void)
{
	#if defined(__ZX80__)
		gen_tv_field_init(0);
	#endif
}

void INIT_IMAGES(void)
{		

	PLAYER_IMAGE._color = COLOR_WHITE;
	INVINCIBLE_GHOST_IMAGE._color = COLOR_WHITE;
	POWERUP_IMAGE._color = COLOR_WHITE;
	GUN_IMAGE._color = COLOR_WHITE;
	BOMB_IMAGE._color = COLOR_RED;
	DEAD_GHOST_IMAGE._color = COLOR_RED;
		
		
	GHOST_IMAGE._imageData = 'o';
	INVINCIBLE_GHOST_IMAGE._imageData = '+';
	BOMB_IMAGE._imageData = 'X';
	PLAYER_IMAGE._imageData = '*';
	POWERUP_IMAGE._imageData = 'S';
	GUN_IMAGE._imageData = '!';
	MISSILE_IMAGE._imageData = '.';
	DEAD_GHOST_IMAGE._imageData = 'O';

	GHOST_IMAGE._color = COLOR_WHITE;
	MISSILE_IMAGE._color = COLOR_WHITE;

	#if defined(FULL_GAME)
		LEFT_ENEMY_MISSILE_IMAGE._imageData = '>';
		LEFT_ENEMY_MISSILE_IMAGE._color = COLOR_WHITE;
		RIGHT_ENEMY_MISSILE_IMAGE._imageData = '<';
		RIGHT_ENEMY_MISSILE_IMAGE._color = COLOR_WHITE;	
		
		BUBBLE_IMAGE._imageData = 'I';
		BUBBLE_IMAGE._color = COLOR_WHITE;
		
		EXTRA_POINTS_IMAGE._imageData = '$';
		
		EXTRA_LIFE_IMAGE._imageData = PLAYER_IMAGE._imageData;
		INVINCIBILITY_IMAGE._imageData = 'V';
		
		EXTRA_POINTS_IMAGE._color = COLOR_WHITE;
		EXTRA_LIFE_IMAGE._color = COLOR_WHITE;
		INVINCIBILITY_IMAGE._color = COLOR_WHITE;	
	#endif
}

#if defined(__ZX81__)	|| defined(__ZX80__)
	#define zxgotoxy(x,y) zx_setcursorpos(y,x)
#endif
	
#if defined(FULL_GAME)
	void DRAW_BROKEN_WALL(unsigned char x, unsigned char y)
	{
		zxgotoxy((x+X_OFFSET),(y+X_OFFSET)); 
		cputc('X');
	}
#endif
	
void _draw(unsigned char x, unsigned char y, Image * image) 
{
	zxgotoxy((x+X_OFFSET),(y+Y_OFFSET)); 
	cputc(image->_imageData);
}

void _delete(unsigned char x, unsigned char y)
{
	zxgotoxy((x+X_OFFSET),(y+Y_OFFSET)); 
	cputc(' ');
}

void _blink_draw(unsigned char x, unsigned char y, Image * image, unsigned char *blinkCounter) 
{
	if(*blinkCounter) 
	{
		_draw(x,y,image);
		*blinkCounter=0;
	} 
	else 
	{
		_delete(x,y);
		*blinkCounter=1;
	}	
}

#if defined(__ACE__)
#else
	void DRAW_VERTICAL_LINE(unsigned char x,unsigned char y, unsigned char length)
	{ 
		unsigned char i;
		for(i=0;i<length;++i)
		{
			zxgotoxy((x+X_OFFSET),(y+i+Y_OFFSET));  
			cputc('i');		
		}
	}

	void DRAW_HORIZONTAL_LINE(unsigned char x,unsigned char y, unsigned char length)
	{
		unsigned char i;
		zxgotoxy(X_OFFSET+x,Y_OFFSET+y); 
		for(i=0;i<length;++i)
		{
			cputc('-');
		}
	}
#endif
		


