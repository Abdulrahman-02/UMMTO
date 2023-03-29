		area exo6,code,readonly
		export __main
tab     dcd 0,1,1,2,3,3,3,3,3,4,5,5,5
N      	equ 13
        entry
__main

		ldr r0,=tab
		mov r1, #0     ;;i
		mov r2, #1     ;; compteur d'éléments consécutifs
		mov r3, #1     ;; compteur maximal d'éléments consécutifs
		ldr r4, [r0]   ;; élément actuel
tantque cmp r1, #N
        beq  fintq
        ldr r5, [r0,r1,lsl #2]    ;; tab[i]
        cmp r4, r5
        bne finsi
        add r2, #1
        b continue
finsi   mov r4, r5
        cmp r2, r3
        blo continue
        mov r3, r2
        mov r2, #1
continue    add r1, #1
        b tantque
fintq   b   fintq
		end
