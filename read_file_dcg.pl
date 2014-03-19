:- use_module(library(pio)).

all([])     --> [].
all([L|Ls]) --> [L], all(Ls).

% once(phrase_from_file(all(Ls), '/home/uditha/Dev/prolog/Assignment(Syntax_Validator)/input.txt')).