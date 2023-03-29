		area exo9,code,readonly
		export __main
chaine 	dcb "ziza",0
		align 4
		entry
__main
		ldr r0,=chaine
		ldr r1,=miroir
		mov r2,#0
		mov r3,#0 ;r3 nbr de car 
tantque ldrb r4,[r0,r2]
		cmp r4,#0
		beq fintq
		add r3,r3,#1
		add r2,r2,#1
		b tantque
fintq 	sub r3,r3,#1     ;; pour avoir l'indice du dernier car
boucle 	cmp r3,#0
		blt faire
		ldrb r4,[r0,r3]
		strb r4,[r1],#1
		sub r3,r3,#1
		b boucle
faire 	b faire
		area exo,data,readwrite
miroir 	space 15
		end
