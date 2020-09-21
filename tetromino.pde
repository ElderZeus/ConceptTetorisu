 // Tetromino rotations
int [] I = {61440, 34952, 61440, 34952};
int [] O = {15, 15, 15, 15};
int [] Z = {408, 180, 408, 180};
int [] S = {240, 306, 240, 306};
int [] T = {58, 154, 184, 178};
int [] L = {480, 294, 120, 201};
int [] J = {456, 75, 312, 420};

// dibujar ventana
void setup() {
  size(650, 1235);
  background(0,0,153);
}

int celdaAncho = 10;
int celdaAlto = 18;

// Tetromino properties
int tRotation = 0;

//tablero matrices
int [][] grid = new int[celdaAlto][celdaAncho];

void draw() {
  background(153);
  drawJ();
 }
// dibujar tetromino bitwise 
void drawI() {
  push();
  strokeWeight(10);
  fill(3, 65, 174);
  for (int i = 0; i <= 15; i++) {
    if ((I[tRotation] & (1 << 15 - i)) != 0) {
      rect((i % 4) * width / celdaAncho, ((i / 4) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawO() {
  push();
  strokeWeight(10);
  fill(114, 203, 59);
  for (int i = 0; i <= 3; i++) {
    if ((O[tRotation] & (1 << 3 - i)) != 0) {
      rect((i % 2) * width / celdaAncho, ((i / 2) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawZ() {
  push();
  strokeWeight(10);
  fill(255, 213, 0);
  for (int i = 0; i <= 8; i++) {
    if ((Z[tRotation] & (1 << 8 - i)) != 0) {
      rect((i % 3) * width / celdaAncho, ((i / 3) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawS() {
  push();
  strokeWeight(10);
  fill(255, 151, 28);
  for (int i = 0; i <= 8; i++) {
    if ((S[tRotation] & (1 << 8 - i)) != 0) {
      rect((i % 3) * width / celdaAncho, ((i / 3) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawT() {
  push();
  strokeWeight(10);
  fill(255, 50, 19);
  for (int i = 0; i <= 8; i++) {
    if ((T[tRotation] & (1 << 8 - i)) != 0) {
      rect((i % 3) * width / celdaAncho, ((i / 3) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawL() {
  push();
  strokeWeight(10);
  fill(255, 49, 151);
  for (int i = 0; i <= 8; i++) {
    if ((L[tRotation] & (1 << 8 - i)) != 0) {
      rect((i % 3) * width / celdaAncho, ((i / 3) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}
void drawJ() {
  push();
  strokeWeight(10);
  fill(172, 193, 0);
  for (int i = 0; i <= 8; i++) {
    if ((J[tRotation] & (1 << 8 - i)) != 0) {
      rect((i % 3) * width / celdaAncho, ((i / 3) | 0) * height / celdaAlto, width / celdaAncho, height / celdaAlto);
    }
  }
  pop();
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      tRotation --;
    } else if (keyCode == DOWN) {
      tRotation ++;
    }
    tRotation = tRotation < 0 ? 3 : tRotation % 4;
  }
}
