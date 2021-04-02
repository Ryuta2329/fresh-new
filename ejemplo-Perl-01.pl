#! C:\Perl\bin\perl -w
#msys32\usr\bin\perl -w

# HelloCMD.pl - Programa que demuestra la facilidad de ejecutar comandos de consola desde Perl, y recibir datos desde la misma para 
#		imprimirlos. 

use strict;

#eval{
#	my ($path_cpp, $path_I, $path_o, $path_L) = @ARGV;
#	if( length(@ARGV) ){ die "Cantidad de argumentos pasados erroenea: deben ser 4." }
#}
#if($@)
#{
#	
#}
my $command1 = system("g++ -Wall -IC:/msys32/mingw32/include/c++/7.3.0 -c ./testPal.cpp");
my $command2 = system("g++ -LC:/msys32/mingw32/bin -o  ./Hello.exe ./Hello.o");

my ($hello, $hello2) = qx/\.\/Hello\.exe/;
chomp $hello2;
print "C++ dice $hello$hello2 Desde Perl\n";

