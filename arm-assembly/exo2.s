		area exo2,code,readonly
		export __main

x equ 2
y equ 3
	
		entry
__main	
		mov r0,#x
		mov r1,#y
		mov r2,#1
		mov r3,#0
		
tq		cmp r3,r1 ; compare between i and Y
		bge fintq ; if i > Y 
		mul r2,r2,r0 ; r = r * x
		add r3,r3,#1 ; increment i
		b tq
fintq   b fintq
		end
			
		