# Opdracht: speelgoedauto simulatie

Schrijf een programma in Ruby dat de onderstaande opdracht implementeert.

## Doel

Het doel van deze opdracht is om je programmeerstijl en -expertise in object georienteerd programmeren te illustreren.
De opdracht is _niet_ bedoeld als "test": we gebruiken het als gespreksstof voor het technisch interview.

## Specificaties

Het programma simuleert een speelgoedauto simuleert die over een vloer met obstakels rijdt.
De input van het programma is een reeks komma-gescheiden instructies, uit `STDIN`.
De output van het programma is een reeks omschrijvingen van de positie en richting van de auto na elke instructie, naar `STDOUT`.

### Eigenschappen

- De speelgoedauto beweegt zich over een rechthoekige vloer. De vloer definïeren we als een grid van x breed en y hoog. Het coördinaaat linksonder is (1,1), het coördinaat linksboven is (1,y), en het coördinaat rechtsonder is (x,1).
- De auto kan vier richtingen op rijden: links (`L`), rechts (`R`), boven (`U`) en onder (`D`)

- De auto kan de volgende instructies verwerken:

  - `Fn`: rijd `n` posities naar voren (Forward)
  - `Bn`: rijd `n` posities naar achteren (Backward)
  - `L`: Draai 1 kwartslag naar links
  - `R`: Draai 1 kwartslag naar rechts

- De vloer bevat 'obstakels':
  - Elk coördinaat op het grid kan een obstakel bevatten
  - Een 'muur' is een groep van obstakels: een aaneengesloten rij van obstakels van coördinaat A naar coördinaat B. Bijvoorbeeld van (1,1) naar (10,1).
  - De auto kan zich niet bewegen naar of door een coördinaat op de vloer waar een obstakel staat
  - De auto kan niet van de vloer afrijden

### Configuratie

- Voor deze opdracht mag je de volgende eigenschappen hardcoden:
  - Gridgrootte: 15 (breed) bij 10 (hoog)
  - Startpositie auto: (5,5), gericht naar boven (U)
  - Obstakels op de vloer:
    - Muren: (3,8)-(5,8), (6,8)-(8,8), (4,10)-(2,10)
    - Obstakels: (4,6), (5,12)

### Input

- De input van het programma is een kommagescheiden reeks van bovengenoemde instructies. Bijvoorbeeld: `F2, L, B1, R, F3, R, B2`

### Output

- De output bestaat uit:
  - Een lijst van de _positie en richting_ van de auto na iedere instructie, kommagescheiden. Format: `(x,y,d)` waarbij `d` de richting van de auto is (`L`, `R`, `U`, `D`). Bijvoorbeeld: `(5,5,R), (8,5,R), (8,5,U), (8,6,U)`
  - Indien een botsing is opgetreden wordt de coördinaten gevolgd door een asterisk: `(x,y,d)*`. Bijvoorbeeld: `(5,5,R), (8,5,R)*, (8,5,U)`

### Voorbeeld input en output

- Input: `F3, R, F4, R, F2, F1, L, B1, F2, R, R, R, F1, R, F2, R, F4, F1`
- Output: `(5,7,U)*, (5,7,R), (7,7,R)*, (7,7,D), (7,5,D), (7,4,D), (7,4,R), (7,4,R)*, (9,4,R), (9,4,D), (9,4,L), (9,4,U), (9,5,U), (9,5,R), (11,5,R), (11,5,D), (11,1,D), (11,1,D)*`

## Aanwijzingen

- Schrijf goed leesbare en onderhoudbare code
- Geef een indicatie van hoeveel tijd je ongeveer hebt besteed aan de opdracht.
