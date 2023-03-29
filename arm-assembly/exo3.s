		area exo3,code,readonly
		export __main

p equ 1
q equ 4
		entry
__main
		mov r0,#p
		mov r1,#q
		mov r2,#0
		
tq		cmp r0,r1
		bgt fintq
		add r2,r2,r0
		add r0,r0,#1
		b tq
fintq   b fintq
		end