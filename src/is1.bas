
1 'Main'
10 screen 5,2:color 1,15,15: open "grp:" as #1
1 'escribimos los sprites'
20 gosub 15000
1 'Inicializamos variables sprite'
30 gosub 10000



1 'Main loop
    1 'Sistema de física / input'
    100 gosub 5000
    1 'Sistema de render'
    110 put sprite pp,(px,py),pc,ps
    1 'Pintamos el marcador'
    120 gosub 9000
130 goto 100




1 ' ----------------------'
1 '   INPuT/PHYSIC SYSTEM
1 ' ----------------------'
    5000 on stick(0) gosub 5200,5400,5600,5800,6000,6200,6400,6600
    1 'Rutina de salto (2 parte)'
    1 'En cada ciclo si el salto está activo le restamos la velocidad del eje y'
    5100 if pa=1 then py=py-pl
    1 ' Si la posición y es menor que la posición antigua del je y menos 20 invertimos la velocidad vertical (en lugar de + ahora es -)'
    5120 if py<po-20 then pl=-pl
    1 ' Si el salto es mayor que la posición antgua hemos terminado y restablecemos los valores'
    5130 if py>po then py=po:pl=-pl:pa=0
5190 return
1 '1 Arriba'
    1 'Rutina de salto (1 parte), antes hemos inicilizado los valores del player en 10000'
    1 'Si el salto no está activo conservamos en po el valor del eje y y activamos el salto'
    5200 if pa<>1 then po=py:pa=1
5290 return
1 'Rutina mover 2-arriba-derecha'
    5400 if pa<>1 then pa=1
    5410 px=px+pv
5490 return
1 'Rutina mover 3 derecha'
    5600 px=px+pv
5690 return
1 'Rutina mover 4-abajo derecha'
    5800 'nada'
5890 return
1 'Rutina mover 5 abajo'
    6000 'nada'
6090 return
1 'Rutina mover 6-abajo-izquierda'
    6200 'nada'
6290 return
1 'Rutina mover 7 izquierda'
    6400 px=px-pv:'gosub 9000
6490 return
1 'Rutina mover 8 arriba izquierda'
    6600 if pa<>1 then pa=1
    6610 px=px-pv:'gosub 9000
6690 return



1 ' ----------------------'
1 '     HUD'
1 ' ----------------------'
    9000 line (0,180)-(256,212),15,bf 
    9050 preset (0,180):print #1,"pa: "pa"  py: "py" po: "po" pl: "pl
9090 return


1 ' ----------------------'
1 '      PLAYER
1 ' ----------------------'
1 ' Inicialización variables'
    1 ' Componente físicia'
    1 'px=posicion x,pw= ancho player,ph=alto player, pv=velocidad eje x, pl=velocidad eje y, po=posición y vieja, pa=salto activado player'
    10000 px=15*8:py=15*8:pw=16:ph=16:pv=8:pl=8:po=py:pa=0
    1 ' Componente render'
    10030 pc=6:pp=0:ps=0
10090 return

1 ' ----------------------'
1 '     SPRITES
1 ' ----------------------'
1 'Rutina cargar sprites con datas basic'
    15000 for j=1 to 32:read a$
        15020 sp$=sp$+chr$(val(a$))
    15030 next j
    15040 sprite$(0)=sp$
15060 return 
1 'Area datas'
15120 DATA 255,255,255,255,255,255,255,255
15130 DATA 255,255,255,255,255,255,255,255
15140 DATA 255,255,255,255,255,255,255,255
15150 DATA 255,255,255,255,255,255,255,255