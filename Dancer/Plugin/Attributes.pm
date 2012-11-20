package Dancer::Plugin::Attributes;

=head1 NAME

Dancer::Plugin::Attributes - Easy attributes for dancer framework

=cut

use Dancer ':syntax';
use Dancer::Plugin;
use Attribute::Handlers;

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS
    use Dancer;
    use Dancer::Plugin::Attributes;
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

=cut

sub UNIVERSAL::Get :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];

    Dancer::get $data => $referent;
}

sub UNIVERSAL::Post :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];

    Dancer::post $data => $referent;
}

sub UNIVERSAL::Put :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];
                
    Dancer::put $data => $referent;
}

sub UNIVERSAL::Del :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];
                
    Dancer::del $data => $referent;
}

sub UNIVERSAL::Patch :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];
                
    Dancer::patch $data => $referent;
}

sub UNIVERSAL::Any :ATTR(CODE) {
    my ($referent, $data) = @_[2,4];
                
    Dancer::any $data => $referent;
}

sub UNIVERSAL::Hook :ATTR(CODE){
    my ($referent, $data) = @_[2,4];
                
    Dancer::hook $data => $referent;    
}

register_plugin;

42;