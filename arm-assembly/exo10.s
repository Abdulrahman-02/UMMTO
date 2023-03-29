		area exo10,code,readonly
		export __main
		entry
__main
		mov r2,#0  ;;; nbre de 1
		mov r0,#'b'
		mov r3,#8    ;;; pour faire 8 décalages 
		mov r4,#0
tq   	cmp r3, #0
		beq   fintq
		movs r0,r0,lsr #1
		adc  r2,r2,#0
		sub r3,#1
		b tq
  
fintq  	movs r2,r2,lsr #1
		adc r4,r4,#0   ;;; 0 si paire 1 sinon 
  
fin  	b  fin 
  
		end
	
