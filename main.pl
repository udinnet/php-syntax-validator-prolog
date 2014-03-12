:- op(1120, xfx, ::=).
:- op(11, fx, <), op(13, xf, >).

<statement> ::= <simple-statement> .
<statement> ::= <structured-statement> .

<simple-statement>  ::= <echo-statement> .
<simple-statement>  ::= <expression-statement> .
<simple-statement>  ::= <jump-statement> .

<structured-statement> ::= <class-declaration> .
<structured-statement> ::= <function-statement> .
<structured-statement> ::= <selection-statement> .
<structured-statement> ::= <declare-statement> .
<structured-statement> ::= <compound-statement> .
<structured-statement> ::= <iteration-statement> .

<jump-statement> ::= <continue-statement> . 
<jump-statement> ::= <break-statement> .
<jump-statement> ::= <return-statement> .

<iteration-statement> ::= <while-statement> .
<iteration-statement> ::= <for-statement> .
<iteration-statement> ::= <do-statement> .
<iteration-statement> ::= <foreach-statement> .

<selection-statement> ::= <switch-statement> .
<selection-statement> ::= <if-else-statement> .
<selection-statement> ::= <if-elseif-statement> .
<selection-statement> ::= <if-statement> .

<break-statement> ::= 'break',';' .
<break-statement> ::= 'break',<expression>,';' .

<compound-statement> ::= '{',<statement-list>,'}' .

<continue-statement> ::= 'continue',';' .
<continue-statement> ::= 'continue',<expression>,';' .

<do-statement> ::= 'do',<statement>,'while','(',<expression>,')',';' .

<for-statement> ::= 'for','(',<init-expression>,';',<control-expression>,';',<iteration-expression>,')',<body-statement> .

<if-statement> ::= 'if','(',<expression>,')',<statement> .

<if-else-statement> ::= 'if','(',<expression>,')',<statement>,'else',<statement> .

<if-elseif-statement> ::= 'if','(',<expression>,')',<statement>,<elseif-cl-list> .
<if-elseif-statement> ::= 'if','(',<expression> ')',<statement>, <elseif-cl-list>, <else-cl> .

<return-statement> ::= 'return',<variable-name>,';' ; 'return',<expression>,';' ; 'return',';' .

<switch-statement> ::= 'switch','(',<expression>,')','{',<case-cl-list>,'}' .

<while-statement> ::= 'while','(',<control-expression>,')',<body-statement> .

<echo-statement> ::= 'echo',<expression>,';'.


parse(Rule)    --> { Rule ::= Body }, parse(Body).
parse(Atom)    --> { atomic(Atom), atom_codes(Atom, Codes) }, Codes.

parse((X , Y)) --> parse(X), parse(Y).

parse((X ; _)) --> parse(X).
parse((_;Y;Z)) --> parse(Y ; Z).
parse((_ ; Z)) --> { Z \= (_ ; _) }, parse(Z).

parse([X])     --> parse(X).
parse([_])     --> {}.

parse({X})     --> parse(X), parse({X}).
parse({_})     --> [].

