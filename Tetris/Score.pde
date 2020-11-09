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
    translate(390, 90);

    //imprimir Puntaje
    fill(textColor);
    text("Puntaje: ", 0, 0);
    fill(#FFFCFC);
    text(points, 0, txtSize);

    translate(15, 100);
    // imprimir siguiente pieza
    fill(textColor);
    text("Siguiente: ", 0, 0);
    //ubicacion del cuadro en ventana
    translate(-60, 10);
    fill(0);
    rect(0, 0, 5*q, 5*q);
    translate(50, 40);
    nextPiece.display(true);
    popMatrix();
  }
}
