#ifndef _APPLE2_INPUT
#define _APPLE2_INPUT

#include <peekpoke.h>

unsigned char GET_CHAR()
{
	unsigned char polledValue = PEEK(0xC000);

	switch(polledValue)
	{
		case 193:
			POKE(0xC010,0);
			POKE(0xC000,0);
			return 'A';
		break;
		case 215:
			POKE(0xC010,0);
			POKE(0xC000,0);
			return 'W';
		break;
		case 211:
			POKE(0xC010,0);
			POKE(0xC000,0);
			return 'S';
		break;
		case 196:
			POKE(0xC010,0);
			POKE(0xC000,0);
			return 'D';
		break;
		case 160:
			POKE(0xC010,0);
			POKE(0xC000,0);
			return ' ';
		break;
	}
	return '\0';
}

#endif // _APPLE2_INPUT