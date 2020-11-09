class Grid {
  int [][] cells = new int[w][h];
  //llena el arreglo de 0 (vacio)
  Grid() {
    for (int i = 0; i < w; i ++){
      for(int j = 0; j < h; j ++) {
        cells[i][j] = 0; //recorre y llena el arreglo de las celdas con 0
      }
    }
  }
  //funcion para comprobar si celda vacia (0)
  boolean isFree(int x, int y) {//x, y coordenadas de la celda. devuelve true o false, dependiendo de si la celda disponible
    if (x > -1 && x < w && y > -1 && y < h) {//condiciona que sea 0 y que x,y sean menores a las dimensiones de arreglo
      return cells[x][y] == 0;
    } else if (y < 0) {
      return true;
    }
    return false;
  }
  //funcion para verificar si la pieza puede bajar
  boolean pieceFits() {
    int x = piece.x;
    int y = piece.y;
    int[][][] pos = piece.pos;//crea matriz con coord. y rotacion de pieza
    boolean pieceOneStepDownOk = true;
    for (int i = 0; i < 4; i ++) {
      int tmpx = pos[r][i][0]+x;
      int tmpy = pos[r][i][1]+y;
      if (tmpy >= h || !isFree(tmpx, tmpy)) {//si la posicion en y >= alto o comparado con free es diferente, no deja bajar
        pieceOneStepDownOk = false;
        break;
      }
    }
    return pieceOneStepDownOk;
  }
  //dibujar pieza en malla
  void addPieceToGrid() {
    int x = piece.x;
    int y = piece.y;
    int[][][] pos = piece.pos;
    for (int i = 0; i < 4; i ++) {//almacena los datos de la posicion de la pieza en la malla, celdas
      if (pos[r][i][1]+y >= 0) {
        cells[pos[r][i][0]+x][pos[r][i][1]+y] = piece.c;
      } else {//si no se puede almacenar, game over
        gameOn = false;
        gameOver = true;
        return;
      }
    }
    score.addPiecePoints();
    checkFullLines();
    goToNextPiece();
    drawGrid();
  }
  //funcion que revisa si existen filas completas, != 0, y las elimina, agrega puntaje
  void checkFullLines() {
    int nb = 0;
    for (int j = 0; j < h; j ++) {//recorre y confirma si es true o false
      boolean fullLine = true;
      for (int i = 0; i < w; i++) {
        fullLine = cells[i][j] != 0;
        if (!fullLine) {
          break;
        }
      }
      if (fullLine) {//si fila esta completa
        nb++;
        for (int k = j; k > 0; k--) {
          for (int i = 0; i < w; i++) {
            cells[i][k] = cells[i][k-1];
          }
        }
        for (int i = 0; i < w; i++) {
          cells[i][0] = 0;
        }
      }
    }
    deleteLines(nb);
  }
  //suma puntaje, cuando cumple condicion sube nivel
  void deleteLines(int nb) {
    clearLines += nb;
    if (int(clearLines / 10) > level-1) {
      goToNextLevel();
    }
    score.addLinePoints(nb);
  }
  //bajar filas, si fila completa
  void setToBottom() {
    int j = 0;
    for (j = 0; j < h; j ++) {
      if (!pieceFits()) {
        break;
      } else {
        piece.y++;
      }
    }
    piece.y--;
    addPieceToGrid();
  }

  void drawGrid() {
    stroke(140);
    pushMatrix();
    translate(70, 50);
    for (int i = 0; i <= w; i ++) {
      line(i*q, 0, i*q, h*q);
    }
    for (int j = 0; j <= h; j ++) {
      line(0, j*q, w*q, j*q);
    }

    stroke(100);
    for (int i = 0; i < w; i ++) {
      for (int j = 0; j < h; j ++) {
        if (cells[i][j] != 0) {
          fill(cells[i][j]);
          rect(i*q, j*q, q, q);
        }
      }
    }
    popMatrix();
  }
}
