		area exo5, code, readonly
		export __main
tab1   	dcd 1,2,3,4,5,6,7,8,9,10	
tab2   	dcd 1,2,3,4,5,6,7,8,9,10	
		entry
__main
		ldr r0, = tab1
		ldr r1, = tab2
		ldr r2, = som
		mov r3, #0   	  ; i = 0
tq 		cmp r3, #9
        bgt  fintq
		ldr r4,[r0],#4    ; tab [i]
		rsb r5,r3,#9      ; j =9-i reverse subtract
		ldr r6, [r1,r5,lsl #2]
		add r7, r4,r6     ; som
		str r7, [r2], #4
		add r3,#1
		b tq
fintq  	b fintq		 
		area exo5data, data, readwrite
som 	space 40	
		end		