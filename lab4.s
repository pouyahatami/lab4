    .globl binary_search
binary_search:
    MOV r4, #0
    SUB r5, r2, #1
    MOV r6, #1
    MOV r7, #-1

loop:    
    CMP r7, #-1
    BNE done
    CMP r4, r5
    BGT done

    ADD r8, r4, r5
    LSR r8, r8, #1
    LDR r9, [r0, r8, LSL #2]

    CMP r9, r1
    BEQ found
    BGT greater

    ADD r4, r8, #1
    B loop

greater: 
    SUB r5, r8, #1
    B loop

found: 
    MOV r7, r8
    B done

done:
    MOV r0, r7
    MOV PC, LR
