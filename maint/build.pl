#!/usr/bin/env perl

use strict;
use warnings;
use FindBin qw( $Bin );

chdir "$Bin/..";

mkdir "share" unless -d "share";
mkdir "build" unless -d "build";
chdir "build";

system 'cmake', '-DCMAKE_INSTALL_PREFIX:PATH=../share', '../t2w';
die if $?;
system 'make';
die if $?;
system 'make', 'install';
die if $?;
