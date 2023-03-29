  area exo4, code, readonly
  export __main
  entry
__main
  mov r0, #20 ;;a
  mov r1, #15 ;;b
  ldr r2,=pgcd ;; zone memoire
tque cmp r0, r1
  beq fintq
  ble sinon
  sub r0,r0,r1
  b tque
sinon 
  sub r1,r1,r0
  b tque
fintq  str r1,[r2]
fin b fin
  
  area resul, data, readwrite
pgcd space 4
  end