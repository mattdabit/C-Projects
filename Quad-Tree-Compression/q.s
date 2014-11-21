.data
# Quadtree Node representation
# Recall that quadtree representation uses the following format:
#     struct qNode {
#         int leaf;
#         int size;
#         int x;
#         int y;
#         int gray_value;
#         qNode *child_NW, *child_NE, *child_SE, *child_SW;
#     }
        .word
q00:    0, 8, 0, 0, 256, qx00, qx40, qx44, qx04

qx00:   1, 4, 0, 0,   1, 0, 0, 0, 0
qx40:   0, 4, 4, 0, 256, qxx40, qxx60, qxx62, qxx42
qx44:   0, 4, 4, 0, 256, qxx44, qxx64, qxx66, qxx46
qx04:   1, 4, 0, 4,   2, 0, 0, 0, 0

qxx40:  1, 2, 4, 0,   3, 0, 0, 0, 0
qxx60:  1, 2, 6, 0,   4, 0, 0, 0, 0
qxx62:  0, 2, 6, 2,   256, qxxx62, qxxx72, qxxx73, qxxx63
qxx42:  1, 2, 4, 2,   1, 0, 0, 0, 0
qxx44:  1, 2, 4, 4,   256, qxxx44, qxxx54, qxxx55, qxxx45
qxx64:  1, 2, 6, 4,   256, qxxx64, qxxx74, qxxx75, qxxx65
qxx66:  0, 2, 6, 6,   256, qxxx66, qxxx76, qxxx77, qxxx67
qxx46:  1, 2, 4, 6,   256, qxxx46, qxxx56, qxxx57, qxxx47

qxxx62: 1, 1, 6, 2,   9, 0, 0, 0, 0
qxxx72: 1, 1, 7, 2,  10, 0, 0, 0, 0
qxxx73: 1, 1, 7, 3,  11, 0, 0, 0, 0
qxxx63: 1, 1, 6, 3,  12, 0, 0, 0, 0
qxxx66: 1, 1, 6, 6,  13, 0, 0, 0, 0
qxxx76: 1, 1, 7, 6,  14, 0, 0, 0, 0
qxxx77: 1, 1, 7, 7,  15, 0, 0, 0, 0
qxxx67: 1, 1, 6, 7,  16, 0, 0, 0, 0

qxxx44: 1, 1, 4, 4,   9, 0, 0, 0, 0
qxxx54: 1, 1, 5, 4,  10, 0, 0, 0, 0
qxxx55: 1, 1, 5, 5,  11, 0, 0, 0, 0
qxxx45: 1, 1, 4, 5,  12, 0, 0, 0, 0
qxxx64: 1, 1, 6, 4,  13, 0, 0, 0, 0
qxxx74: 1, 1, 7, 4,  14, 0, 0, 0, 0
qxxx75: 1, 1, 7, 5,  15, 0, 0, 0, 0
qxxx65: 1, 1, 6, 5,  16, 0, 0, 0, 0
qxxx46: 1, 1, 4, 6,   9, 0, 0, 0, 0
qxxx56: 1, 1, 5, 6,  10, 0, 0, 0, 0
qxxx57: 1, 1, 5, 7,  11, 0, 0, 0, 0
qxxx47: 1, 1, 4, 7,  12, 0, 0, 0, 0
