   area exo6,code, readonly
		export __main
tab     dcd 12,-10,7,0,14,25,-19,11,-12,10
N      equ 10	
        entry
__main

    ldr r0,=tab
	ldr r2,[r0]  ;; Max initialisé au premier elt du tableau
	mov r1, #1     ;;i
tantque cmp r1, #N
        beq  fintq
		ldr r3, [r0,r1,lsl #2]    ;; tab[i]
		cmp r3,r2
		ble finsi
		mov r2,r3
		mov r4,r1                ; indice du Max
finsi   add r1,#1
        b tantque
		
fintq   b   fintq		
	end