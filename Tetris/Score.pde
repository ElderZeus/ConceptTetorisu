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
