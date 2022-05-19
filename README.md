# Prism_German_Translation
German Translation of the popular ROM Hack.

## How to
### Übersetzen und Anpassen:

**Vorab wichtig: Innerhalb der Gänsefüßschen darf der Text __NIEMALS länger als 18 Zeichen__ lang sein! Punkte, Kommata und Leerzeichen werden mit gezählt!**

`ctxt "WÄHLE EIN #MON"`

 -> Kommt nur an oberster Zeile und beginnt den Textabschnitt und stellt den zwischen den Gänsefüßschen eingetragenen Text dar.

`line ""`

-> Setzt einen Zeilenumbruch im ersten Textfeld und stellt den zwischen den Gänsefüßchen eingetragenen Text dar.

`cont ""`

 -> Beim Drücken von (A) im Spiel: Scrollt das erste Textfeld eine Zeile runter und stellt den zwischen den Gänsefüßchen eingetragenen Text dar.

`para ""`

 -> Beim Drücken von (A) erscheint ein komplett neues Textfeld und stellt den zwischen den Gänsefüßchen eingetragenen Text dar. Zusätzlich kann man wieder mit line         einen zweizeiligen text schreiben 
 
 ![image](https://user-images.githubusercontent.com/11394683/168790538-a63b0020-6965-4050-9c15-0e161028745e.png)


### Variablen
Es gibt Variablen die Ihr nutzen könnt bzw. sollt und müsst! 😄 
Diese Variablen sind zb:
`<...>`

--> Diese Variable stellt 3 normale Punkte dar, jedoch anstelle von 3 Character(da 3 Punkte) nur als 1 Character! Also Spart euch das ungemein Platz gerade bei der 18     Zeichen Begrenzung pro Zeile in der ja sogar Leerzeichen gezählt werden...

Oder das:
`#`

--> Nur das Hashtag alleine also ohne links und rechts diese Pfeile.
    Dieser Hashtag setzt im spiel statt dem Hashtag die Phrase
    `Poké` dar.

**Vorsicht! Als Code ist # zwar nur ein Zeichen, für die 18 Char begrenzung wird jedoch das was dargestellt wird gezählt!
  Dementsprechend müsst Ihr # als 4 Character zählen!**
  
### Sonstige Begrenzungen
- Pokemon Namen haben max. 10 Zeichen --> bei Variablen wie `<EMON>` und `<BMON>` also immer mit dazurechnen!
- Item Namen haben max. 12 Zeichen --> Bei Variablen also immer mit dazurechnen!
- Attacken-Namen haben ebenfalls max. 12 Zeichen --> Bei Variablen also immer mit dazurechnen!


# Geänderte Ortsnamen
Farbliche Unterlegung:
 - Rot --> Ortsname muss noch geändert werden
 - Orange --> Ortsname sollte noch geändert werden
 - Gelb --> Ortsname könnte eventuell noch geändert werden

![image](https://user-images.githubusercontent.com/11394683/169313304-5e7a622a-5aa0-49ee-a991-78e9ed0c9444.png)



