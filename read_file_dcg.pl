:- use_module(library(pio)).
:- set_prolog_flag(toplevel_print_options,
                   [quoted(true), portray(true)]).

all([])     --> [].
all([L|Ls]) --> [L], all(Ls).

main(Ls):-
	once(phrase_from_file(all(Ls),'/home/uditha/Dev/prolog/Assignment(Syntax_Validator)/input.txt')).

% main(X).