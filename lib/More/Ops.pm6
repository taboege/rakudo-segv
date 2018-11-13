unit module More::Ops;

use Ops;

role Operator[$sym] does Ops::Formula {
    has $.sym = $sym;
    has @.operands;

    method eval (Assignment \α) { … }
}

class Operator::Not does Operator["¬"] {
    method eval (Assignment \α) { not @!operands[0].eval(α) }
}

class Operator::And does Operator["∧"] {
    method eval (Assignment \α) { [and] @!operands».eval(α) }
}

multi sub prefix:<¬> (Formula \φ)             is export { Operator::Not.new: :operands(φ)    }
multi sub  infix:<∧> (Formula \φ, Formula \ψ) is export { Operator::And.new: :operands(φ, ψ) }
