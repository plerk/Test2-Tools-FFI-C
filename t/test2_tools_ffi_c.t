use Test2::V0 -no_srand => 1;
use Test2::Tools::FFI::C;
use Test::Alien;

subtest 'basic' => sub {

  my $c = Test2::Tools::FFI::C->new;
  isa_ok $c, 'Test2::Tools::FFI::C';

  is($c->decl, '', 'decl starts out empty');
  
  $c->decl('#include <foo.h>');
  
  is($c->decl, "#include <foo.h>\n", 'decl append adds \n if not already there');
  
  $c->decl("#include <bar.h>\n#include <baz.h>\n");
  
  is($c->decl, "#include <foo.h>\n#include <bar.h>\n#include <baz.h>\n", 'decl append does not add \f if already there');

  is([$c->alien], [], 'alien empty at first');
  
  $c->alien('Alien::libfoo');
  
  is([$c->alien], ['Alien::libfoo'], 'with one alien');

  my $alien = synthetic {
    cflags => '-I/foo/include',
    libs   => '-L/foo/lib -llibfoo',
  };
  
  $c->alien($alien);
  
  is([$c->alien], ['Alien::libfoo', exact_ref($alien)], 'with an alien instance');

};

done_testing
