import time


def Display(matrix):
    for r in matrix:
        print "[",
        for col in r:
            print col,
        print "]\n"


inp = 325489

matrix = []
size = 11
matrix = [[0] * size for i in range(size)]

col = size // 2
row = size // 2

matrix[col][row] = 1
Display(matrix)

movements = 1
direction = ("e", "n", "w", "s")
curdirection = 0  # e, n, s, w
curmovements = movements

while matrix[row][col] < inp:

    if curmovements == 0:
        if curdirection != 3:
            curdirection += 1
        else:
            curdirection = 0
        if curdirection % 2 == 0:
            movements += 1
        curmovements = movements

    if curdirection == 0:
        col += 1
    elif curdirection == 1:
        row -= 1
    elif curdirection == 2:
        col -= 1
    else:
        row += 1

    print row, col
    matrix[row][col] = (
        matrix[row - 1][col - 1]
        + matrix[row - 1][col]
        + matrix[row - 1][col + 1]
        + matrix[row][col - 1]
        + matrix[row][col + 1]
        + matrix[row + 1][col - 1]
        + matrix[row + 1][col]
        + matrix[row + 1][col + 1]
    )
    print matrix[row][col]

    Display(matrix)
    time.sleep(1)
    curmovements -= 1
    print "\n\n\n\n"
