class Explosion {
  int x;
  int y;
  int imageCounter;
  PImage[] explosion= new PImage[2];
  Explosion(int x, int y) {
    this.x=x;
   this.y=y;
    for (int i=0; i<explosion.length; i++) {
      explosion[i]=loadImage("img"+ (i+1) + ".png");
    }
  }
  private void display(){
  if (imageCounter<20){
  image(explosion[0],mouseX+10, mouseY);
  }
  else if (imageCounter<40){
  image(explosion[1],mouseX,mouseY);
  }
  imageCounter++;
  
  }
}
