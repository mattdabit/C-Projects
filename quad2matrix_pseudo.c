quad2matrix(qNode *quadtree, void *matrix, int matrix_width) {
	if (quadtree->gray_value != 256) {
		for i = x; i <= x + size ; i++
			for j = y; j <= y + size; j++
				matrix[j * matrix_width + i] = quadtree->gray_value
	}
	else {
		quad2matrix(NW, matrix, matrix_width)
		quad2matrix(NE, matrix, matrix_width)
		quad2matrix(NW, matrix, matrix_width)
		quad2matrix(NE, matrix, matrix_width)	
		
	}
	if (at the root) {
		if (root is leaf) {
			done
		} else {
			nothing, should have jumped to recurse
		}
	} else (at some child) {
		if counter == 0 {
			done
		}
		else {
			recurse
		}
	}