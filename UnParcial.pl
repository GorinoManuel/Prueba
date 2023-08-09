% esPersonaje/1 nos permite saber qué personajes tendrá el juego

esPersonaje(aang).
esPersonaje(katara).
esPersonaje(zoka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).
esPersonaje(iroh).
esPersonaje(messi).

% esElementoBasico/1 nos permite conocer los elementos básicos que pueden controlar algunos personajes

esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).

% elementoAvanzadoDe/2 relaciona un elemento básico con otro avanzado asociado

elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).

% controla/2 relaciona un personaje con un elemento que controla

controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, rayo).
controla(iroh, agua).
controla(messi, fuego).
% visito/2 relaciona un personaje con un lugar que visitó. Los lugares son functores que tienen la siguiente forma:
% reinoTierra(nombreDelLugar, estructura)
% nacionDelFuego(nombreDelLugar, soldadosQueLoDefienden)
% tribuAgua(puntoCardinalDondeSeUbica)
% temploAire(puntoCardinalDondeSeUbica)

visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).


/*
A partir de estos hechos, nos pidieron lo siguiente:

- Saber qué personaje esElAvatar. El avatar es aquel personaje que controla todos los elementos básicos.
- Clasificar a los personajes en 3 grupos:
    - un personaje noEsMaestro si no controla ningún elemento, ni básico ni avanzado;
    - un personaje esMaestroPrincipiante si controla algún elemento básico pero ninguno avanzado;
    - un personaje esMaestroAvanzado si controla algún elemento avanzado. Es importante destacar que el avatar también es un maestro avanzado.
- Saber si un personaje sigueA otro. Diremos que esto sucede si el segundo visitó todos los lugares que visitó el primero. También sabemos que zuko sigue a aang.
- Conocer si un lugar esDignoDeConocer, para lo que sabemos que:
    - Todos los templos aire son dignos de conocer;
    - La tribu agua del norte es digna de conocer;
    - Ningún lugar de la nación del fuego es digno de ser conocido;
    - Un lugar del reino tierra es digno de conocer si no tiene muros en su estructura. 
- Definir si un lugar esPopular, lo cual sucede cuando fue visitado por más de 4 personajes. 
- Por último nos pidieron modelar la siguiente información en nuestra base de conocimientos sobre algunos personajes desbloqueables en el juego:
    - bumi es un personaje que controla el elemento tierra y visitó Ba Sing Se en el reino Tierra;
    - suki es un personaje que no controla ningún elemento y que visitó una prisión de máxima seguridad en la nación del fuego protegida por 200 soldados. 

Recordá que los predicados deben ser totalmente inversibles.
*/

esElAvatar(UnPersonaje):-
    esPersonaje(UnPersonaje),
    esElementoBasico(UnElemento),
    forall(esPersonaje(UnPersonaje), controla(UnPersonaje, UnElemento)).

esElemento(UnElemento):-
    esElementoBasico(UnElemento).

esElemento(UnElemento):-
    elementoAvanzadoDe(ElementoAsociado, UnElemento).

noEsMaestro(UnPersonaje):-
    esPersonaje(UnPersonaje),
    esElemento(UnElemento).

esMaestroPrincipiante(UnPersonaje):-
    esPersonaje(UnPersonaje),
    esElementoBasico(UnElemento),
    controla(UnPersonaje, UnElemento).

esMaestroAvanzado(UnPersonaje):-
    esPersonaje(UnPersonaje),
    controla(UnPersonaje, UnElemento),
    not(esElementoBasico(UnElemento)).

esMaestroAvanzado(UnPersonaje):-
    esElAvatar(UnPersonaje).

sigueA(zuko, aang).

sigueA(UnPersonaje, OtroPersonaje):-
    visito(UnPersonaje, _),
    visito(OtroPersonaje, _),
    UnPersonaje \= OtroPersonaje,
    forall(visito(UnPersonaje, LugaresQueVisito), visito(OtroPersonaje, LugaresQueVisito)).

esDignoDeConocer(temploAire(_)).

esDignoDeConocer(temploAire(Norte)).

esDignoDeConocer(reinoTierra(UnLugar), Estructuras):-
    not(tieneMuros(Estructuras)).

tieneMuros(Estructuras):-
    member(muro, Estructuras).

esPopular(UnLugar):-
    visito(UnPersonaje, UnLugar),
    visito(OtroPersonaje, UnLugar),
    UnPersonaje \= OtroPersonaje,
    append([], [UnPersonaje], PersonasQueVisitaron),
    length(PersonasQueVisitaron, 4).
    
    
    


    
