.data

lfsr:
        .align 4
        .half
        0x1

.text

# Implements a 16-bit lfsr
#
# Arguments: None
lfsr_random:

        la $t0 lfsr 
        lhu $v0 0($t0) #$v0 is 0x1

        addiu $t1 $0 16 # this is 16
	addiu $t2 $0 0 # i =0 
	addiu $t3 $v0 0 # $t3 = 0x1 = reg
for:
	beq $t2 $t1 end #i == 16 return reg 
	srl $t4 $t3 2  #$t4 = reg >> 2 $t4 is highest
	xor $t4 $t3 $t4 # t4 = (reg>>0) ^ (reg>>2)
	srl $t5 $t3 3 #t5 = (reg >> 3)
	xor $t4 $t4 $t5 # t4 = (reg>>0) ^ (reg>>2) xor (reg >> 3)
	srl $t5 $t3 5 # t5 = reg >> 5
	xor $t4 $t4 $t5 # t4 = (reg>>0) ^ (reg>>2) xor (reg >> 3) xor (reg >> 5 )
	srl $t3 $t3 1 # t3 = reg >> 1
	sll $t4 $t4 15 # t4 = highest << 15
	andi $t4 $t4 0xFFFF # mask t4
	or $t3 $t3 $t4 # t3 = reg >> 1 | highest << 15
	addiu $t2 $t2 1 # i++
	andi $t3 $t3 0xFFFF #mask t5
	j for	# redo for loop
end:	
	addu $v0 $0 $t3 
        la $t0 lfsr
        sh $v0 0($t0)
        jr $ra
