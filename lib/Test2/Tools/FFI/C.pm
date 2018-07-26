package Test2::Tools::FFI::C;

use strict;
use warnings;
use 5.008001;

# ABSTRACT: Test C/C++ from Perl
# VERSION

# notes:
# http://www.decompile.com/cpp/faq/file_and_line_error_string.htm

=head1 SYNOPSIS

scoped in .t file:

 use Test2::V0;
 use Alien::libfoo;
 use Test2::Tools::FFI::C;
 
 c_decl('#include <libfoo.h>');
 #include <libfoo.h>
 EOF
 
 c_alien 'Alien::libfoo';
 
 c_subtest 'a subtest written in c' => sub {
   /* c comment */
   ok(1, 'test is good');
   pass('explicit pass');
   fail('explicit fail');
   note('notice');
   diag('diagnostic');
 };

same thing, scoped as object:

 use Test2::V0;
 use Alien::libfoo;
 use Test2::Tools::FFI::C ();
 
 my $c = Test2::Tools::FFI->new;
 
 $c->decl('#include <libfoo.h>');
 $c->alien('Alien::Libfoo');
 $c->subtest('a subtest written in c' => sub {
   ok(1, 'test is good');
   /* ... */
 });

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

=cut

sub new
{
  my($class) = @_;
  my $self = bless {
    decl  => '',
    alien => [],
  }, $class;
}

=head1 METHODS

=head2 decl

=cut

sub decl
{
  my($self, $add) = @_;
  
  if(defined $add)
  {
    $self->{decl} .= $add;
    $self->{decl} =~ s/\n?$/\n/;
  }
  
  $self->{decl} if defined wantarray;
}

=head2 alien

=cut

sub alien
{
  my($self, @aliens) = @_;
  push @{ $self->{alien} }, @aliens;
  @{ $self->{alien} };
}

=head2 subtest

=cut

sub subtest
{
}

1;
