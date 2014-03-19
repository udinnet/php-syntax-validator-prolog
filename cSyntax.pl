:- op(1120, xfx, ::=).
:- op(11, fx, <), op(13, xf, >).

<statement> ::= <labeled-statement> ; <compunt-statement> ; <expression-statement> ; <selection-statement> ; <iteration-statement> ; <jump-statement> .

<labeled-statement> ::= <identifier>,":",<statement>;"case",<constant-expression>,":",<statement>;"default",":",<statement> .

<compound-statement> ::= <block>;"{",<statement>,"}".

<expression-statement> ::= <expression>,";".

<selection-statement> ::= <if-statement>;"switch","(",<expression>,")",<statement> .

<iteration-statement> ::= "while","(",<expression>,")",<statement>;"do",<statement>,"while","("<expression>,")",";";<for-statement> .

<jump-statement> ::= "goto",<identifier>,";";"continue",";";"break",";";"return";<expression>,";".

<identifier> ::= <nondigit>,"(",<nondigit>;<digit>,")".

<nondigit> ::= "_";"a";"b";"c";"d";"e";"f";"g";"h";"i";"j";"k";"l";"m";"n";"o";"p";"q";"r";"s";"t";"u";"v";"w";"x";"y";"z".

<digit> ::= "0";"1";"2";"3";"4";"5";"6";"7";"8";"9".

<expression> ::= <list>,(<assignment-expression>).

parse(Rule)    --> { Rule ::= Body }, parse(Body).
parse(Atom)    --> { atomic(Atom), atom_codes(Atom, Codes) }, Codes.


parse([X])     --> parse(X).
parse([_])     --> {}.

parse({X})     --> parse(X), parse({X}).
parse({_})     --> [].

