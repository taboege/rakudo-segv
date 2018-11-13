#!/usr/bin/env perl6

use Ops;
use More::Ops;

multi prefix:<`> (Pair $_ is copy) {
    state %VARS;
    %VARS{.key} //= ($_ but Variable) but role :: { method Str { self.key } }
}

my \φ = (`:a ∧ ¬(¬`:b ∧ `:z) ∧ `:b);
