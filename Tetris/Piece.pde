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
      translate(70, 50);//pos inicial pieza, mismo que grid
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
