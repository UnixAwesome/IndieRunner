package IndieRunner::BaseModule;

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

=pod
my $verbose;
my $debug;

my $bin;
my $env;
my $args;

my $cli_file;
my $engine_id_file;

sub init { };

sub configure { };

sub run_cmd ( $, $engine_id_file, $cli_file ) {
	#return ( $BIN, '--quiet', '--main-pack', $run_file );
}
=cut

sub _initialize ( $cli_verbose, $cli_debug ) {
	# XXX: implement
}

sub new ( $class, $cli_verbose = 0, $cli_debug = 0 ) {
	my $self = {};
	bless $self, $class;
	$self->_initialize( $cli_verbose, $cli_debug );
	return $self;
}

sub setup ( $ ) {
	# No setup needed.
}

1;
