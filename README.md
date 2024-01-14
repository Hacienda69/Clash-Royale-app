# WatchWeb - Movilización Movilizante Móvil
### (Dani Mañas, Marc Escandell)

## Pantalles fetes per cadascú:
### Marc: Main Menu + Search Screen
- Main Menu: pots canviar de pantalla per anar al cercador (icona de la cantonada superior esquerra) i per accedir a la teva llista de preferits (inicialment buida). A la pantalla es mostren fileres de pel·lícules amb les que es pot lliscar horitzontalment, estan endreçades utilitzant certs filtres que podrien sortir a la pàgina d'inici d'una app similar. Una mica més abaix, fent scroll vertical, també es troba l'apartat de sèries.
- Search Screen: cercador funcional on buscar pel·lícules i sèries pel seu nom, a part de també poder millorar la búsqueda fent ús de filtres discriminant per genères, any, rating i rank (al top 100 de millors pel·lícules i sèries de ImDb). També hi ha un filtre per canviar entre series i pel·lícules i un botó per 'ressetejar' els filtres.

### Dani: Description Screen + My List
- Description Screen: Un cop clicada una sèrie o pel·lícula ja sigui desde el main menu o desde MyList, l'aplicació transporta l'usuari a una pantalla que dona dades sobre l'obra en qüestió, ja sigui el nom, una petita descripció, el rating, els gèneres i el link a la pàgina real de ImDb, tot això acompanyat d'una imatge en gran del film. Al costat del títol, però, es troba una icona de 'bookmark' interactiva que al ser premuda guarda la pel·lícula o sèrie a la meva llista de preferits, a la qual es pot accedir com ja ha estat esmentat abans clicant la icona de add (+).
- My List: pàgina amb dues llistes, una de pel·lícules i una de sèries on van a parar totes aquelles obres que han estat preses d'haver estat seleccionades mitjançant el botó del 'bookmark'. Es pot accedir a elles fàcilment i també es pot fer scroll. Finalment, per un desempellegar-se dels seus preferits tan sols ha de tornar a donar al mateix botó dins l'obra que ja no vol tenir a la seva llista.

##Descripció del projecte
Per la realització del projecte de mòbils, nosaltres, el grup Movilización Movilizante Móvil, format per Marc Escandell i Daniel Mañas, hem decidit fer ús d’una API que conté informació sobre la classificació de les millors 100 sèries i pel·lícules en un rànking, trobada a la web de RapidApi, que s’anomena IMDb Top 100 Movies  (https://rapidapi.com/rapihub-rapihub-default/api/imdb-top-100-movies/), creada per RapiHub (https://rapidapi.com/organization/rapihub).  

Hem escollit aquesta API perquè al meu company Marc i a servidor ens agraden molt les sèries i jo personalment tinc afició per informar-me sobre pel·lícules de renom, puntuar-les, donar la meva opinió al respecte, etc. Ens va cridar l’atenció perquè és una API relativament simplista que va al gra, amb la informació justa i necessària que necessitem per la nostra futura app. Dit això, cal mencionar que hem decidit donar un gir a la idea original de la API per convertir tota la informació que n’extraiem en una aplicació d’streaming selecta: es dirà WatchWeb (WW) i tindrà com a icona i senya d’identitat una aranya groga teixint una teranyina (una web, en anglès), que contindrà les inicials WW gravades.

## Requisits mínims del projecte:
- Utilitzem l’API de IMDb Top 100 Movies, de la web RapidApi
- Tenint en compte que som dos integrants en el nostre equip, l’app havia de  requerir mínim de 4 pantalles, aquestes son les que hem pensat:

1. Main Page
La pantalla que hem decidit desenvolupar per l’entrega parcial. Similar a la de Netflix, presenta una topbar amb el logo de l’aplicació i les icones de Search i MyList. En el cos de la pantalla, trobaríem diferents categories de pel·lícules i sèries (top 100 series, crime movies, etc.) i es podria fer un scroll lateral com passa a la majoria de plataformes d’streaming com Netflix, HBO Max, Disney +, per esmentar algunes.

2. Search
Tornant-nos a basar en Netflix, al presionar la icona de Search apareixeria una pantalla similar a aquesta que deixem a mà dreta, amb quadre on introduir text i sota el qual sortirien endreçades en format de llista vertical els resultats més coincidents amb la búsqueda.

3. Descripció pel·lícula/sèrie
Cada cop que l’usuari entrés dins una sèrie o pel·lícula per veure-la, abans hauria de passar per aquesta pantalla on es mostraria una imatge, una descripció i una mica més d’informació general sobre el producte. Semblant al disseny de HBO Max.

4. My List
Semblant a la pàgina principal amb la diferència de que només hi hauria una sola llista, el lloc on anirien a parar totes aquelles sèries o pel·lícules que l’usuari s’hagi volgut guardar.

- Hem creat un repositori a GitHub (https://github.com/Hacienda69/WatchWeb), però  cal esmentar un parell de errors que hem comès: el primer és que, tot i mantenir la norma de menys de 100 línies afegides per commit es manté a la majoría d’aquests, no ho fa en els quatre primers (l’initial commit, l’agregament del projecte de Flutter al repositori i diferents intents  d’implementar un parell d’APIs que no ens van acabar funcionant i que vam canviar per la que tenim ara). No hem fet servir Chat GPT, però sí que la longitud del tercer i quart commit es deuen a la meva incapacitat d’implementar les dues primeres APIs per les que ens havíem decantat, al principi ho vaig intentar amb el codi que es va fer a classe i després vaig seguir videos a YouTube sobre RapidApi.

  ![watchweblogo](https://github.com/Hacienda69/WatchWeb/assets/99950443/22ad2cc2-4e6e-48ea-acb5-69bf57b4c470)

