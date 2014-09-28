.text

# Generates an autostereogram inside of buffer
#
# Arguments:
#     autostereogram (unsigned char*)
#     depth_map (unsigned char*)
#     width
#     height
#     strip_size
calc_autostereogram:

        # Allocate 5 spaces for $s0-$s5
        # (add more if necessary)
        addiu $sp $sp -20
        sw $s0 0($sp)
        sw $s1 4($sp)
        sw $s2 8($sp)
        sw $s3 12($sp)
        sw $s4 16($sp)

        # autostereogram
        lw $s0 20($sp)
        # depth_map
        lw $s1 24($sp)
        # width
        lw $s2 28($sp)
        # height
        lw $s3 32($sp)
        # strip_size
        lw $s4 36($sp)

        # YOUR CODE HERE #
        li $t0 0 # i
        li $t1 0 # j
ifor:	
	beq $t0 $s2 endcalc
jfor:
	beq $t1 $s3 endfor
	
	multu $t1 $s2 # getIndex starts here; hilo = j * width
	mflo $t3
	addu $t3 $t3 $t0 # t3 = j * width + i
	
	slt $t2 $t1 $s4 
	bne $t2 0 else # if i < S
	
	addiu $sp $sp -20 # store temp variables
	sw $ra 0($sp)
	sw $t0 4($sp)
	sw $t1 8($sp)
	sw $t2 12($sp)
	sw $t3 16($sp)
	jal lfsr_random # v0 set to random num
	lw $ra 0($sp)
	lw $t0 4($sp)
	lw $t1 8($sp)
	lw $t2 12($sp)
	lw $t3 16($sp)
	addiu $sp $sp 20
	
	and $v0 $v0 0xFF
	addu $t3 $s0 $t3 # t3 = address of I(i, j)
	sb $v0 0($t3) # autogram[i, j] = v0 (random)
	
else:
	addu $t4 $s1 $t3 # t4 = address of depth(i, j)
	lb $t4 0($t4) # t4 = depth(i, j)
	addu $t4 $t0 $t4 # t4 = i + t4
	subu $t4 $t4 $s4 # t4 = t4 - S
	
	multu $t1 $s2 # getIndex for right hand side
	mflo $t5
	addu $t5 $t5 $t4 # t5 = j * width + new i
	addu $t5 $s0 $t5 # t5 = s0 + 1 byte * t5. t5 is address (i, j) for I(i + depth - S, j)
	
	lb $t5 0($t5) # t5 = I(new i, j)
	
	addu $t3 $s0 $t3 # t3 is address of I(i, j)
	sb $t5 0($t3) # I(i, j) = t5
	
	addiu $t1 $t1 1 # j++
	j jfor
endfor:
	addiu $t0 $t0 1 # i++
	j ifor
	
endcalc:
        lw $s0 0($sp)
        lw $s1 4($sp)
        lw $s2 8($sp)
        lw $s3 12($sp)
        lw $s4 16($sp)
        addiu $sp $sp 20
        jr $ra
