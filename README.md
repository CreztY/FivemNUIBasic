![](https://cdn.discordapp.com/icons/732572247826366494/bd25ff81268477c153bae74875c929ee.webp?size=96)


#Uso basico de NUI para FiveM
todo lo necesario para comenzar un nuevo proyecto para FiveM usando HTML.

este proyecto es para ayudar sobre todo a los que recien empiezen a programar en javascript para fivem.

lo unico que tendras que cambiar es el nombre del "resource" en el archivo: script.js
####En el archivo de Javascript　
buscar en la linea nº 14 esto:
```javascript
$(document).on('keydown', function(event) {
    switch(event.keyCode) {
        case 27: // ESC
            $.post('https://LVMRP_nuevo/Close');
            break;
    }
});
```
y cambiarlo por el nombre que le diste a la carpeta raiz, por ejemplo, usaré "esx_yourproyectname":
```javascript
$(document).on('keydown', function(event) {
    switch(event.keyCode) {
        case 27: // ESC
            $.post('https://esx_yourproyectname/Close');
            break;
    }
});
```


###Imagen

en esta imagen se muestra como abre el html dentro del juego:

![](https://i.ibb.co/d4jBPx2/imagen-2022-03-24-005441.png)
