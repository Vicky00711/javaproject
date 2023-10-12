PImage pumpkinImage;
class Pumpkin {
  float x;
  float y;

  Pumpkin(float x, float y) {
    this.x= x;
    this.y= y;
    pumpkinImage=loadImage("pumpkin.png");
    pumpkinImage.resize(80, 80);
  }
  private void display() {
    image(pumpkinImage, x+30, y);
  }
}
