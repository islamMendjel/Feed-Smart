%********** Faits **********

category(X):-ask(category,'Cow category (milk , meat) : ',X).

weight(X):-ask(weight,'What is the cow weight (Kg) : ',X).

%********** Moteur **********

:- dynamic memory/2.

feedsmart :-
    retractall(memory(_, _)),
    findall(Ration, nom(Ration), Rations),
    nl, write('Ration(s) : '), nl,
    print_recommendations(Rations).

print_recommendations([]).
print_recommendations([H|T]) :-
    recommendation(H, Text),
    write('-> '), write(Text),
    print_recommendations(T).

ask(Pred, _, X) :-
    memory(Pred, X).
ask(Pred, _, _) :-
    memory(Pred, _),
    !,
    fail.
ask(Pred, Question, X) :-
    write(Question),
    read(Y),
    asserta(memory(Pred, Y)),
    X = Y.

%********** Regles **********

% Category (Milk/Weight)
nom_cat(milk_cow) :- category(milk).
nom_cat(meat_cow) :- category(meat).

% Subtype Based On Weight
nom_sub(milk_light) :- nom_cat(milk_cow), weight(W), W < 400.
nom_sub(milk_standard) :- nom_cat(milk_cow), weight(W), W >= 400, W < 600.
nom_sub(milk_intensive) :- nom_cat(milk_cow), weight(W), W >= 600.

nom_sub(meat_light) :- nom_cat(meat_cow), weight(W), W < 350.
nom_sub(meat_standard) :- nom_cat(meat_cow), weight(W), W >= 350, W < 550.
nom_sub(meat_intensive) :- nom_cat(meat_cow), weight(W), W >= 550.

% Milk/Meat Ration
nom(ration_milk_light) :- nom_sub(milk_light).
nom(ration_milk_standard) :- nom_sub(milk_standard).
nom(ration_milk_intensive) :- nom_sub(milk_intensive).

nom(ration_meat_light) :- nom_sub(meat_light).
nom(ration_meat_standard) :- nom_sub(meat_standard).
nom(ration_meat_intensive) :- nom_sub(meat_intensive).

%********** Recommendations (Results) **********

recommendation(ration_milk_light, '5kg of hay + 2kg of concentrate. Light mineral supplement recommended.').

recommendation(ration_milk_standard, '8kg of forage + 4kg of concentrate + balanced mineral supplement.').

recommendation(ration_milk_intensive, '10kg of rich forage + 5kg of concentrate + reinforced minerals.').

recommendation(ration_meat_light, '6kg of hay + 3kg of concentrate. Suited for slow growth.').

recommendation(ration_meat_standard, '8kg of forage + 4kg of concentrate. Good balance for development.').

recommendation(ration_meat_intensive, '10kg of forage + 6kg of concentrate + supplements for rapid weight gain.').