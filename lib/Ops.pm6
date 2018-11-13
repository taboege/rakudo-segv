unit module Ops;

multi sub prefix:<¬> (Bool $p)     is export { not $p        }
multi sub  infix:<∧> (Bool $p, $q) is export {     $p and $q }

constant Assignment is export = Hash[Bool, Any];

role Formula is export {
    method eval (Assignment \α) { … }
}

role Variable does Formula is export {
    method eval (Assignment \α) { α{self} }
}
