//valores default del juego
int w = 10; //celdas de ancho
int h = 20; // celdas de alto
int q = 20; //tamaño de bloque alto*ancho
int delayTime;//tiempo retraso entre movimientos
int currentTime; //tiempo actual
int r = 0;//rotacion de la pieza
int level = 1;//nivel del juego
int clearLines = 0;//puntaje
int ancho = 550;
int alto = 450;
//propiedades del texto a mostrar para usuario
int txtSize = 20;
int textColor = color(250, 255, 3);
//estado del juego, game over o gome on
boolean gameOver = false;
boolean gameOn = false;
//inicializa todos los objetos
Grid grid;
Piece piece;
Piece nextPiece;
Pieces pieces;
Score score;

void setup()
{
  size(550, 450);
  textSize(28);
}

void initialize() {
  level = 1;
  clearLines = 0;
  delayTime = 999;
  currentTime = millis();
  score = new Score();
  grid = new Grid();
  pieces = new Pieces();
  piece = new Piece(-1);
  nextPiece = new Piece(-1);
}

void draw()
{
  background(0);
  if (grid != null) {//mientras que grid no sea nulo
    grid.drawGrid();
    int now = millis();
    //si gameOn pasa a ser true, establece el tiempo de ejecucion a n, empezar de nuevo
    if (gameOn) {
      if (now - currentTime > delayTime) {
        currentTime = now;
        piece.oneStepDown();
      }
    }
    piece.display(false);
    score.display();
  }
  //dibuja el cuadro de dialogo cuando pierde
  if (gameOver) {
    text("Game Over!", 120, 220);
  }
  //cuadro de dialogo para empezar el juego
  if (!gameOn) {
    text("Press Any Key to Start", 120, 280);
  }
}
//se encarga de mostrar la siguiente pieza en UI
void goToNextPiece() {
  piece = new Piece(nextPiece.type);
  nextPiece = new Piece(-1);
  r = 0;
}
//permite aumentar la dificultad = mas rapido
void goToNextLevel() {
  score.addLevelPoints();
  level = 1 + int(clearLines / 10);
  delayTime *= .5;//disminuye el tiempo para mover pieza, 50%
}
//funcion que detecta la tecla oprimida
void keyPressed() {
  if (key == CODED && gameOn) {
    switch(keyCode) {
    case LEFT:
    case RIGHT:
    case DOWN:
    case UP:
    case SHIFT:
      piece.inputKey(keyCode);
      break;
    }
  } else if (keyPressed) {
    if (!gameOn) {
      initialize();
      gameOver = false;
      gameOn = true;
    }
  } 
}
//tetrominos
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
//creacion y forma de tetrominos
class Piece {
  final color[] colors = {//codigo de colores para las piezas, permite que cada tipo tenga su propio color
    color(#FA3232), 
    color(#3237FA),
    color(#74FA32), 
    color(#F6FA32), 
    color(#FA32E6), 
    color(#68BDF5), 
    color(#AE6BFC) 
  };
  //datos de ubicacion de la pieza, rotacion, posicion en x,y
  final int[][][] pos;
  int x = int(w/2);//coordenadas para empezar a dejar caer las piezas
  int y = 0;
  int type;//tipo de pieza
  int c;//color
  //randomiza la siguiente pieza
  Piece(int k) {
    type = k < 0 ? int(random(0, 7)) : k;
    c = colors[type];//asigna el color propio del tipo de pieza
    r = 0;//empieza con la posicion de rotacion 0, default
    pos = pieces.pos[type];
  }
  //dibujo por cuadros tetromino
  void display(boolean still) {
    stroke(250);
    fill(c);
    pushMatrix();
    if (!still) {
      translate(160, 40);//pos inicial pieza, mismo que grid
      translate(x*q, y*q);//desplazamiento de la pieza segun q, tamaño bloques
    }
    int rot = still ? 0 : r;//quien es mayor 0 o r
    for (int i = 0; i < 4; i++) {
      rect(pos[rot][i][0] * q, pos[rot][i][1] * q, q, q);//cubos del tetromino
    }
    popMatrix();
  }
  //verifica si la pieza puede seguir bajando, bloqueo de fin de tablero
  void oneStepDown() {
    y += 1;
    if (!grid.pieceFits()) {
      piece.y -= 1;
      grid.addPieceToGrid();
    }
  }
  //verifica si pieza puede ir a la izquierda
  void oneStepLeft() {
    x -= 1;
    if (!grid.pieceFits()) {
      x+=1;
    }
  }
  //verifica si pieza puede ir a la derecha
  void oneStepRight() {
    x += 1;
    if (!grid.pieceFits()) {
      x -= 1;
    }
  }

  void goToBottom() {
    grid.setToBottom();
  }
  //almacena el valor de la tecla en k
  void inputKey(int k) {
    switch(k) {
    case LEFT:
      x --;
      if (grid.pieceFits()) {
      } else {
        x++;
      }
      break;
    case RIGHT:
      x ++;
      if (grid.pieceFits()) {
      } else {
        x--;
      }
      break;
    case DOWN:
      oneStepDown();
      break;
    case UP://da la rotacion a la pieza dentro de 4 opciones
      r = (r+1)%4;
      if (!grid.pieceFits()) {
        r = r-1 < 0 ? 3 : r-1;
      } else {
      }
      break;
    case SHIFT:
      goToBottom();
      break;
    }
  }
}
//clase donde se almacenan las funciones referentes al Grid
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
    translate(160, 40);
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

//funciones del puntaje
class Score {
  int points = 0;
  //añade linea a conteo
  void addLinePoints(int nb) {
    if (nb == 4) {
      points += level * 10 * 20;
    } else {
      points += level * nb * 20;
    }
  }
  //añade puntaje pieza, cada pieza vale 5
  void addPiecePoints() {
    points += level * 5;
  }
  //nivel
  void addLevelPoints() {
    points += level * 100;
  }
  void display() {
    pushMatrix();
    translate(40, 60);

    //imprimir Puntaje
    fill(textColor);
    text("Score: ", 0, 0);
    fill(#FFFCFC);
    text(points, 0, txtSize*1.5);

    translate(400, 0);
    // imprimir siguiente pieza
    fill(textColor);
    text("Next: ", 0, 0);
    //ubicacion del cuadro en ventana
    translate(1.2*q, 1.5*q);
    nextPiece.display(true);
    popMatrix();
  }
}
