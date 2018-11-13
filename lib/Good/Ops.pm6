unit module Ops;

#multi sub prefix:<¬> (Bool $p)     is export { not $p        }
#multi sub  infix:<∧> (Bool $p, $q) is export {     $p and $q }

role Formula is export {
    method eval (\α) { … }
}
