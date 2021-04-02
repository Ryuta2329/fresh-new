#! /usr/bin/perl -w

# Programa countAA.pl - Este programa se encarga de calcular el numero de aminoacidos especificados en 
# 		una o mas secuencias (sin formato. Se trata de una sola linea de texto que representa la secuencia). 

# molinatti.marc.029@gmail.com
# Jun. 8, 2018.

use strict;

my %AMINOACIDS = (A => 'Ala', R => 'Arg', N => 'Asn', D => 'Asp', C => 'Cys', E => 'Glu', Q => 'Gln', G => 'Gly', H => 'His',
	I => 'Ile', L => 'Leu', K => 'Lys', M => 'Met', F => 'Phe', P => 'Pro', S => 'Ser', T => 'Thr', W => 'Trp', Y => 'Tyr', V => 'Val' );

# Codigo principal
{
	# Se leen las secuencias desde STDIN (sin formato. Se trata de una sola linea de texto que representa la secuencia)
	unless( $#ARGV != 1 ){ die "No sequences supplied!\n"; }
	my @error = undef;
	my @sequences = ();

	my ($day, $month, $year) = (localtime)[3,4,5];
	
	open NEW_FILE, ">MV-Obj2-Counts-$day-$month-$year.txt"
		or die "No pudo crearse el archivo MV-Obj2-Counts-$day-$month-$year.txt\n";
	select NEW_FILE;
	foreach my $letter (sort keys %AMINOACIDS){ print "\t$letter"; }
	print "\n";
	foreach my $letter (sort keys %AMINOACIDS){ print "\t$AMINOACIDS{$letter}"; }
	print "\n";

	foreach my $seq (@ARGV)
	{
		unless( -e $seq && -f $seq && -r $seq )
		{ 
			push @error, "$seq cannot be read by countAA.";
			next;
		}
		open NEW_SEQ, "<$seq"
			or die "No se pudo abrir el archivo. Abortando.\n";
		push @sequences, <NEW_SEQ>;
		close NEW_SEQ;

	} continue 
	{
		my %aminoacids = countAA($sequences[ $#sequences ]);
		foreach my $letter (sort keys %AMINOACIDS)
		{ 
			print "\t$aminoacids{$letter}" if defined $aminoacids{$letter};
			print "\t0" if not defined $aminoacids{$letter};
		}
		print "\n";
	}

	select STDOUT;
	close NEW_FILE;
	
	if ( defined $error[0] ) {
		foreach my $message (@error){ print "$message\n"; }
	}

	my @aminoacid = qw(W Y);
	my %myCounts = countAA ( $sequences[2], @aminoacid );
	foreach my $letter (@aminoacid){ print "El total de $letter es de: $myCounts{$letter}\n"; }
}

sub countAA
{
	my $seq = shift;	
	die "No sequence defined for call to countAA" if not defined $seq;

	if ( defined $_ ) {
		my %counts = ();
		my @all_aa = ();
		foreach my $letter (@_) 
		{ 
			@all_aa = $seq =~ m/$letter/g;
			$counts{$letter} = $#all_aa; 
		}

		return %counts;
	} else {
		my %uniq = ();	
		while($seq 	=~ /(.)/g ){ $uniq{$1}++; }

		return %uniq;
	}
}