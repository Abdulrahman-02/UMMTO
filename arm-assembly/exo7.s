		area exo7, code,readonly
		export __main
chainE   dcb   "As$s$Emb**le56ur12",0
		align 4
		entry
__main
		ldr r0,=chainE
		ldr r1,=chaineS
tantque ldrb r2,[r0],#1
		cmp  r2,#0
		beq fintq
		cmp r2,#'A'
		blo  tantque
		cmp r2,#'Z'
		bhi  sinon
		add r2,r2,#0x20
		strb r2,[r1],#1
		b tantque
sinon	cmp r2, #'a'
        blo tantque
		cmp r2,#'z'
		bhi tantque
		strb r2,[r1],#1
		b tantque
fintq  	b fintq		
	   	
		area exo7data,data, readwrite
chaineS space 20

		end