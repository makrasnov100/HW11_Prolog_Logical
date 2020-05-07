positions([position(_,_,_,1),position(_,_,_,2),position(_,_,_,3),position(_,_,_,4),position(_,_,_,5)]).

%Position structure: First Name, Last Name, Sponsor, Position

% Take note one position higher means position decreases
isOneHigher(X, Y) :- X =:= Y-1.
isOneLower(X, Y) :- X =:= Y+1.

print_positions([A|B]) :-
    write(A), nl, print_positions(B).
    print_positions([]).

race(Positions) :- positions(Positions),
    member(position(adam, AdamL, AdamS, AdamP), Positions),
    member(position(barry, BarryL, BarryS, BarryP), Positions),
    member(position(howard, _, HowardS, HowardP), Positions),
    member(position(ryan, RyanL, RyanS, _), Positions),
    member(position(sydney, SydneyL, _, SydneyP), Positions),

    member(position(_, _, flashAutomotive, FlashP), Positions),
    member(position(CrankF, _, crankMotorOil, CrankP), Positions),
    member(position(NapaF, _, napaAutoParts, NapaP), Positions),
    member(position(FleetF, FleetL, fleetBodyworks, _), Positions),
    member(position(TredcoF, TredcoL, tredcoTires, TredcoP), Positions),

    member(position(RightF, right, RightS, RightP), Positions),
    member(position(StraightF, straight, StraightS, _), Positions),
    member(position(ChariotF, chariot, _, _), Positions),
    member(position(ElementF, element, _, _), Positions),
    member(position(RafeF, rafe, RafeS, RafeP), Positions),


    FlashP = 3,

    CrankF \= howard, HowardS \= crankMotorOil,
    howardP \= 5,

    RyanL \= right, RightF \= ryan,
    RyanS \= napaAutoParts, NapaF \= ryan,

    BarryL = straight, StraightF = barry,
    BarryS \= fleetBodyworks, FleetF \= barry,
    StraightS \= fleetBodyworks, FleetL \= straight,

    isOneHigher(CrankP,SydneyP),
    SydneyL \= element, ElementF \= sydney,

    ChariotF \= adam, AdamL \= chariot,
    AdamP = 1,

    isOneLower(HowardP,RightP),

    NapaP = 4,
    BarryP \= 4,

    AdamP \= 2,
    AdamS \= tredcoTires, TredcoF \= adam,
    AdamL \= right, RightF \= adam,
    AdamL \= rafe, RafeF \= adam,
    TredcoP \= 2,
    TredcoL \= right, RightS \= tredco,
    TredcoL \= rafe, RafeS \= tredco,
    RightP \= 2,
    RafeP \= 2,
    print_positions(Positions).



