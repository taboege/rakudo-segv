unit module More::Ops;

use Ops;

role Operator does Ops::Formula {
    has @.operands;

    method eval (\α) { … }
}

class Operator::Not does Operator {
    method eval (\α) { not @!operands[0].eval(α) }
}

class Operator::And does Operator {
    method eval (\α) { [and] @!operands».eval(α) }
}

multi sub prefix:<¬> (Formula \φ)             is export { Operator::Not.new: :operands(φ)    }
multi sub  infix:<∧> (Formula \φ, Formula \ψ) is export { Operator::And.new: :operands(φ, ψ) }
