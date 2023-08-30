package IndieRunner::Cmdline;

# Copyright (c) 2022 Thomas Frohwein
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use strict;
use warnings;
use v5.36;
use version 0.77; our $VERSION = version->declare('v0.0.1');

use base qw( Exporter );
our @EXPORT_OK = qw( cli_dllmap_file cli_dryrun cli_file cli_gameargs
                     cli_mode cli_verbose init_cli );

use Getopt::Long;
use Pod::Usage;

my $dir = '.';
my $dllmap;
my $dryrun;
my $engine;
my $file;
my $game;
my $mode;
my $script;
my $verbosity = 0;

sub init_cli () {
	Getopt::Long::Configure ("bundling");
	GetOptions (    'help|h'	=> sub { pod2usage(-exitval => 0, -verbose => 1); },
	                'directory|d=s'	=> \$dir,
	                'dllmap|D=s'	=> \$dllmap,
			'dryrun|n'	=> \$dryrun,
			'engine|e=s'	=> \$engine,
			'file|f=s'	=> \$file,
			'game|g=s'	=> \$game,
			'man|m'		=> sub { pod2usage(-exitval => 0,
			                                     -verbose => 2, ); },
			'script|s'	=> \$script,
			'usage'		=> sub { pod2usage(-exitval => 0,
			                                   -verbose => 0, ); },
			'verbose|v'	=> sub{ $verbosity++; },
			'version|V'	=> sub { say $VERSION; exit; },	# XXX: $VERSION from which module or script?
		   )
	or pod2usage(2);

	# keep this in sync with %INIT_ATTRIBUTES_DEFAULTS in IndieRunner.pm
	return {
		dir		=> $dir,
		dllmap		=> $dllmap,
		dryrun		=> $dryrun,
		engine		=> $engine,
		file		=> $file,
		game		=> $game,
		game_args	=> \@ARGV,
		script		=> $script,
		verbosity	=> $verbosity,
	};
}

# XXX: legacy subroutines; remove when not needed anymore
sub cli_dllmap_file ()	{ return $dllmap; }
sub cli_dryrun ()	{ return $dryrun; }
sub cli_file ()		{ return $file; }
sub cli_gameargs ()	{	# XXX: useless, remove it
	return '';
}
sub cli_mode ()			{ say "XXX: obsolete to be removed"; exit 1; }
sub cli_verbose ()		{ return $verbosity; }

1;
