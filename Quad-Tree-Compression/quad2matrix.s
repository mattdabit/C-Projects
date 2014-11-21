.text

# Decodes a quadtree to the original matrix
#
# Arguments:
#     quadtree (qNode*) = a0
#     matrix (void*) = a1
#     matrix_width (int)  = a2
#
# Recall that quadtree representation uses the following format:
#     struct qNode {
#         int leaf; 0
#         int size; 4
#         int x; 8
#         int y; 12
#         int gray_value; 16
#         qNode *child_NW, *child_NE, *child_SE, *child_SW; 20 = first child
#     }

quad2matrix:
        # YOUR CODE HERE #
	li $t0 256
	lw $t1 0($a0) # leaf 
	lw $t2 4($a0) # size
	lw $t3 8($a0) # x
	lw $t4 12($a0) # y 
	lw $t5 16($a0) # gray_value
	beq $t5 $t0 recurse #if (gray_value == 256)
	addu $t8 $t2 $t3 # t8 = x + size
	addu $t9 $t2 $t4 # t9 = y + size
ifor:
	beq $t3 $t8 return # if i == x + size + 1 endloop , $t3 = i = x initially
	addiu $t7 $t4 0 # j = y
jfor:
	beq $t7 $t9 endjfor # if j == y + size + 1
	multu $t7 $a2 # getIndex starts here; hilo = j * width
	mflo $t6
	addu $t6 $t6 $t3 # t3 = j * width + i
	addu $t6 $t6 $a1 # t6 = address of [i , j]
	sb $t5 0($t6) # matrix[i, j] = gray_value
	addiu $t7 $t7 1 # j++
	j jfor
endjfor:
	addiu $t3 $t3 1 # i++
	j ifor
recurse:
	addu $sp $sp -8
	sw $a0 0($sp)
	sw $ra 4($sp)
	lw $a0 20($a0)
	jal quad2matrix
	lw $a0 0($sp)
	
	lw $a0 24($a0)
	jal quad2matrix
	lw $a0 0($sp)
	
	lw $a0 28($a0)
	jal quad2matrix
	lw $a0 0($sp)
	
	lw $a0 32($a0)
	jal quad2matrix
	lw $a0 0($sp)
	
	lw $ra 4($sp)
	addiu $sp $sp 8
return:
        jr $ra
