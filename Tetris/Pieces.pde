class Pieces {
  int[][][][] pos = new int [7][4][4][2];
  Pieces() {
    //T, pieza 0
    pos[0][0][0][0] = -1;//piece 0, rotation 0, point nb 0, x
    pos[0][0][0][1] = 0;// piece 0, rotation 0, point nb 0, y
    pos[0][0][1][0] = 0;
    pos[0][0][1][1] = 0;
    pos[0][0][2][0] = 1;
    pos[0][0][2][1] = 0;
    pos[0][0][3][0] = 0;
    pos[0][0][3][1] = 1;

    pos[0][1][0][0] = 0;
    pos[0][1][0][1] = 0;
    pos[0][1][1][0] = 1;
    pos[0][1][1][1] = 0;
    pos[0][1][2][0] = 0;
    pos[0][1][2][1] = -1;
    pos[0][1][3][0] = 0;
    pos[0][1][3][1] = 1;

    pos[0][2][0][0] = -1;
    pos[0][2][0][1] = 0;
    pos[0][2][1][0] = 0;
    pos[0][2][1][1] = 0;
    pos[0][2][2][0] = 1;
    pos[0][2][2][1] = 0;
    pos[0][2][3][0] = 0;
    pos[0][2][3][1] = -1;

    pos[0][3][0][0] = -1;
    pos[0][3][0][1] = 0;
    pos[0][3][1][0] = 0;
    pos[0][3][1][1] = 0;
    pos[0][3][2][0] = 0;
    pos[0][3][2][1] = -1;
    pos[0][3][3][0] = 0;
    pos[0][3][3][1] = 1;

    //Z, pieza 1
    pos[1][0][0][0] = pos[1][2][0][0] = -1;//piece 1, rotation 0, point nb 0, x
    pos[1][0][0][1] = pos[1][2][0][1] = 1;// piece 1, rotation 0, point nb 0, y
    pos[1][0][1][0] = pos[1][2][1][0] = 0;
    pos[1][0][1][1] = pos[1][2][1][1] = 1;
    pos[1][0][2][0] = pos[1][2][2][0] = 0;
    pos[1][0][2][1] = pos[1][2][2][1] = 0;
    pos[1][0][3][0] = pos[1][2][3][0] = 1;
    pos[1][0][3][1] = pos[1][2][3][1] = 0;

    pos[1][1][0][0] = pos[1][3][0][0] = -1;
    pos[1][1][0][1] = pos[1][3][0][1] = 0;
    pos[1][1][1][0] = pos[1][3][1][0] = 0;
    pos[1][1][1][1] = pos[1][3][1][1] = 0;
    pos[1][1][2][0] = pos[1][3][2][0] = -1;
    pos[1][1][2][1] = pos[1][3][2][1] = -1;
    pos[1][1][3][0] = pos[1][3][3][0] = 0;
    pos[1][1][3][1] = pos[1][3][3][1] = 1;

    //S, pieza 2
    pos[2][0][0][0] = pos[2][2][0][0] = 0;//piece 2, rotation 0 and 2, point nb 0, x
    pos[2][0][0][1] = pos[2][2][0][1] = 1;//piece 2, rotation 0 and 2, point nb 0, y
    pos[2][0][1][0] = pos[2][2][1][0] = 1;
    pos[2][0][1][1] = pos[2][2][1][1] = 1;
    pos[2][0][2][0] = pos[2][2][2][0] = -1;
    pos[2][0][2][1] = pos[2][2][2][1] = 0;
    pos[2][0][3][0] = pos[2][2][3][0] = 0;
    pos[2][0][3][1] = pos[2][2][3][1] = 0;

    pos[2][1][0][0] = pos[2][3][0][0] = 0;
    pos[2][1][0][1] = pos[2][3][0][1] = 0;
    pos[2][1][1][0] = pos[2][3][1][0] = 1;
    pos[2][1][1][1] = pos[2][3][1][1] = 0;
    pos[2][1][2][0] = pos[2][3][2][0] = 1;
    pos[2][1][2][1] = pos[2][3][2][1] = -1;
    pos[2][1][3][0] = pos[2][3][3][0] = 0;
    pos[2][1][3][1] = pos[2][3][3][1] = 1;

    //I, pieza 3
    pos[3][0][0][0] = pos[3][2][0][0] = 0;//piece 3, rotation 0 and 2, point nb 0, x
    pos[3][0][0][1] = pos[3][2][0][1] = -1;//piece 3, rotation 0 and 2, point nb 0, y
    pos[3][0][1][0] = pos[3][2][1][0] = 0;
    pos[3][0][1][1] = pos[3][2][1][1] = 0;
    pos[3][0][2][0] = pos[3][2][2][0] = 0;
    pos[3][0][2][1] = pos[3][2][2][1] = 1;
    pos[3][0][3][0] = pos[3][2][3][0] = 0;
    pos[3][0][3][1] = pos[3][2][3][1] = 2;

    pos[3][1][0][0] = pos[3][3][0][0] = -1;
    pos[3][1][0][1] = pos[3][3][0][1] = 0;
    pos[3][1][1][0] = pos[3][3][1][0] = 0;
    pos[3][1][1][1] = pos[3][3][1][1] = 0;
    pos[3][1][2][0] = pos[3][3][2][0] = 1;
    pos[3][1][2][1] = pos[3][3][2][1] = 0;
    pos[3][1][3][0] = pos[3][3][3][0] = 2;
    pos[3][1][3][1] = pos[3][3][3][1] = 0;

    //O, pieza 4
    pos[4][0][0][0] = pos[4][1][0][0] = pos[4][2][0][0] = pos[4][3][0][0] = 0;
    pos[4][0][0][1] = pos[4][1][0][1] = pos[4][2][0][1] = pos[4][3][0][1] = 0;
    pos[4][0][1][0] = pos[4][1][1][0] = pos[4][2][1][0] = pos[4][3][1][0] = 1;
    pos[4][0][1][1] = pos[4][1][1][1] = pos[4][2][1][1] = pos[4][3][1][1] = 0;
    pos[4][0][2][0] = pos[4][1][2][0] = pos[4][2][2][0] = pos[4][3][2][0] = 0;
    pos[4][0][2][1] = pos[4][1][2][1] = pos[4][2][2][1] = pos[4][3][2][1] = 1;
    pos[4][0][3][0] = pos[4][1][3][0] = pos[4][2][3][0] = pos[4][3][3][0] = 1;
    pos[4][0][3][1] = pos[4][1][3][1] = pos[4][2][3][1] = pos[4][3][3][1] = 1;

    //L, pieza 5
    pos[5][0][0][0] = 0;//piece 5, rotation 0, point nb 0, x
    pos[5][0][0][1] = 1;//piece 5, rotation 0, point nb 0, y
    pos[5][0][1][0] = 1;
    pos[5][0][1][1] = 1;
    pos[5][0][2][0] = 0;
    pos[5][0][2][1] = 0;
    pos[5][0][3][0] = 0;
    pos[5][0][3][1] = -1;

    pos[5][1][0][0] = 0;
    pos[5][1][0][1] = 0;
    pos[5][1][1][0] = 1;
    pos[5][1][1][1] = 0;
    pos[5][1][2][0] = 2;
    pos[5][1][2][1] = 0;
    pos[5][1][3][0] = 2;
    pos[5][1][3][1] = -1;

    pos[5][2][0][0] = 0;
    pos[5][2][0][1] = -1;
    pos[5][2][1][0] = 1;
    pos[5][2][1][1] = -1;
    pos[5][2][2][0] = 1;
    pos[5][2][2][1] = 0;
    pos[5][2][3][0] = 1;
    pos[5][2][3][1] = 1;

    pos[5][3][0][0] = 0;
    pos[5][3][0][1] = 0;
    pos[5][3][1][0] = 1;
    pos[5][3][1][1] = 0;
    pos[5][3][2][0] = 2;
    pos[5][3][2][1] = 0;
    pos[5][3][3][0] = 0;
    pos[5][3][3][1] = 1;

    //reverse L, pieza 6
    pos[6][0][0][0] = 0;//piece 6, rotation 0, point nb 0, x
    pos[6][0][0][1] = 1;//piece 6, rotation 0, point nb 0, y
    pos[6][0][1][0] = 1;
    pos[6][0][1][1] = 1;
    pos[6][0][2][0] = 1;
    pos[6][0][2][1] = 0;
    pos[6][0][3][0] = 1;
    pos[6][0][3][1] = -1;

    pos[6][1][0][0] = 0;
    pos[6][1][0][1] = 0;
    pos[6][1][1][0] = 1;
    pos[6][1][1][1] = 0;
    pos[6][1][2][0] = 2;
    pos[6][1][2][1] = 0;
    pos[6][1][3][0] = 2;
    pos[6][1][3][1] = 1;

    pos[6][2][0][0] = 0;
    pos[6][2][0][1] = -1;
    pos[6][2][1][0] = 1;
    pos[6][2][1][1] = -1;
    pos[6][2][2][0] = 0;
    pos[6][2][2][1] = 0;
    pos[6][2][3][0] = 0;
    pos[6][2][3][1] = 1;

    pos[6][3][0][0] = 0;
    pos[6][3][0][1] = 0;
    pos[6][3][1][0] = 1;
    pos[6][3][1][1] = 0;
    pos[6][3][2][0] = 2;
    pos[6][3][2][1] = 0;
    pos[6][3][3][0] = 0;
    pos[6][3][3][1] = -1;
  }
}