% Hechos: relaciones básicas
padre(juan, pedro).
padre(juan, maria).
padre(pedro, ana).
padre(pedro, luis).
padre(carlos, sofia).

madre(marta, pedro).
madre(marta, maria).
madre(laura, ana).
madre(laura, luis).
madre(sofia, clara).

% Reglas derivadas

% 1. hijo(X, Y): X es hijo de Y.
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

% 2. abuelo(X, Y): X es abuelo de Y.
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
abuelo(X, Y) :- padre(X, Z), madre(Z, Y).

% 3. nieto(X, Y): X es nieto de Y.
nieto(X, Y) :- abuelo(Y, X).

% 4. tio(X, Y): X es tío de Y.
tio(X, Y) :- hermano(X, Z), padre(Z, Y).
tio(X, Y) :- hermano(X, Z), madre(Z, Y).

% 5. sobrino(X, Y): X es sobrino de Y.
sobrino(X, Y) :- tio(Y, X).

% 6. primo(X, Y): X y Y son primos (hijos de hermanos).
primo(X, Y) :-
    padre(P1, X), padre(P2, Y), hermano(P1, P2).
primo(X, Y) :-
    madre(M1, X), madre(M2, Y), hermana(M1, M2).

% 7. hermano(X, Y): X y Y son hermanos.
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.
hermano(X, Y) :- madre(M, X), madre(M, Y), X \= Y.

% 8. familiar(X, Y): Une todas las relaciones familiares.
familiar(X, Y) :- 
    padre(X, Y);
    hijo(X, Y);
    abuelo(X, Y);
    nieto(X, Y);
    tio(X, Y);
    sobrino(X, Y);
    primo(X, Y).

% 9. familiares(X, Lista): Genera una lista de los familiares de X.
familiares(X, Lista) :-
    findall(Y, familiar(X, Y), Lista).

% 10. casado(X, Y): X y Y están casados si tienen hijos en común.
casado(X, Y) :- 
    padre(X, Z), madre(Y, Z);
    madre(X, Z), padre(Y, Z).

% 11. suegro(X, Y): X es suegro de Y.
suegro(X, Y) :- 
    padre(X, Z), casado(Z, Y).