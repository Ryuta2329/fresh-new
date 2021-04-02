#include "World.h"
#include "Person.h"

int main()
{
	World Planet_Three = new World("Earth");

	enum Love { NONE, ALWAYS };

	Person Marcelo = new Person();
	Person Diana = new Person();

	if ( Marcelo.Sees( Diana ) )
		Marcelo.set_Fallin_inLove( true );

	if ( Marcelo.Meets( Diana ) )
		Marcelo.Hearts( GROWS_UP );

	while( Marcelo.is_Alive() )
	{
		do {
			Marcelo.Hearts( GROWS_UP );
			Marcelo.Love( Diana );

			if( Diana.Love_Back(Marcelo) )
				Marcelo.setLoving(Love.ALWAYS);

		} while( Diana.Exists() );

		Marcelo.Hearts( BROKE_UP );
		Marcelo.Missing("Diana", until = Love.ALWAYS);
	}

	return 0;

}