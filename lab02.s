
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------

add s0, zero, zero #Set s0 to zero (it stays 0 if not found )

search_loop:
    beq a1, zero, done    #if the array gets to zero go to done
    lw t1, 0(a0)          #load the word at the first position of the a0
    bne t1, a2, continue  #t1 not equal a2. if this is true go to continue
    add s0, a0, zero      #if bne didnt go to continue then store the address of the value to s0
    
continue:
    addi a0, a0, 4        #Go to next Word of the array
    addi a1, a1, -1       #make the length of the array smaller for the loop
    j search_loop        #go back to the loop 

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
