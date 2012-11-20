use Dancer;
use Dancer::Plugin::Attributes;
use Diagnostics;
set logger => 'console';

# get example
sub hello :Get(/hello) {
 return 'Hello World!';
}

# post example
sub wow :Post(/hello/:name) {
  return 'Hello ' . param 'name';
}

sub hehe :Any(/a/b/c) {
  return "any";
}

sub affe :Hook(after) {
  warning "after";
}

sub bef :Hook(before) {
  warning "before";
}

start;
