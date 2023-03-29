			area exo1,code,readonly
			export __main
				
a equ 4
bb equ 1
c equ 3
			entry

__main
			mov r1,#a
			mov r2,#bb
			mov r3,#c
			
			mul r4,r2,r2		;b*b
			mul r6,r1,r3		;a*c
			mov r6,r6, lsl#2	;4*a*c
			;mul r6,r6,#4
			sub r4,r4,r6		;b*b-4*a*c
			cmp r4,#0			;compare delta to 0
			blt nsol			;less then 0: no solution
			beq osol			;equal to 0: one solution 
			mov r5,#2			;else register r5 = 2 solutions
			b fin
nsol 		mov r5,#0
			b fin
osol		mov r5,#1
fin			b fin
			end

			
				