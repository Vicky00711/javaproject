PImage scarecrowImg;
class Player {
  float x;
  float y;
  Player(float x, float y) {
    this.x=x;
    this.y=y;
    scarecrowImg=loadImage("scarecrow.png");
    scarecrowImg.resize(40, 40);
  }
  private void display() {
    image(scarecrowImg, x, y);
  }
  private void move() {
    x= mouseX;
    y=mouseY;
  }
}
