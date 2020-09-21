class Grid {
  int w = 10;
  int h = 19;
  int s;
  int x, y;
  boolean[][] b = new boolean[h][w]; 
  Grid() {
    s = min( width/(2+w), height/(2+h) );
    //randomize();
  }
  void randomize() {
    for ( int j = 0; j < h; j++ ) {
      for ( int i = 0; i < w; i++ ) {
        b[j][i] = random(1) < 0.5;
      }
    }
  }
  void block_at(int ix, int iy) {
    x = ix;
    y = iy;
  }
  void draw() {
    pushMatrix();
    translate((width-(w*s))/2, (height-(h*s))/2);
    background(0);
    stroke(128);
    for ( int j = 0; j < h; j++ ) {
      for ( int i = 0; i < w; i++ ) {
        fill(0);
        if ( b[j][i] ) {
          fill(255);
        }
        if ( j==y && i==x ) {
          fill(255, 0, 0);
        }
        rect(s*i, s*j, s, s);
      }
    }
    popMatrix();
  }
}
 
// =====
 
class Block {
  int x = 10/2;
  int y = 0;
  int t;
  Block() {
    t = millis() + 1000;
  }
  void draw() {
    if ( millis() > t ) {
      t = millis() + 1000;
      y++;
    }
    grid.block_at(x, y);
  }
  void up() {
    // TODO: Instant drop.
  }
  void down() {
    t = millis() + 1000;
    y++;
  }
  void right() {
    t = millis() + 750;
    x++;
  }
  void left() {
    t = millis() + 750;
    x--;
  }
}
 
// =====
 
Grid grid;
Block block;
 
void setup() {
  size(380, 500);
  grid = new Grid();
  block = new Block();
}
 
void draw() {
  background(0);
  block.draw();
  grid.draw();
}
 
void keyPressed() {
  if ( keyCode == UP || key == 'w' || key == 'W') { 
    block.up();
  }
  if ( keyCode == DOWN || key == 's' || key == 'S' ) { 
    block.down();
  }
  if ( keyCode == LEFT || key == 'a' || key == 'A' ) { 
    block.left();
  }
  if ( keyCode == RIGHT || key == 'd' || key == 'D' ) { 
    block.right();
  }
}
