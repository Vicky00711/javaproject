
class Birds extends Enemies {
  int imageCounter;
 PImage[] birdsImages= new PImage[3];
  float speedX;
  float speedY;

  Birds(float x, float y) {
    super(x, y);
    
    for (int i=0; i<3; i++) {
      birdsImages[i]=loadImage("birdsimg" + i+ ".png" );
      birdsImages[i].resize(30,30);
    }
  }
  void display() {
    if (imageCounter<20) {
      image(birdsImages[0], x, y);
    } else if (imageCounter<40) {
      image(birdsImages[1], x, y);
    } else if (imageCounter<60) {
      image(birdsImages[2], x, y);
    } else {
      image(birdsImages[0], x, y);
      imageCounter=0;
    }
    imageCounter++;
  }
  
  void collision(){
  
      
      if (abs(x-halloweenPumpkin.x)<40 && abs(y-halloweenPumpkin.y)<40) {
        x=0;
       y=random(0,250);
      }
    }
  
  
  
  void killingEnemies() {


      if (abs(defender.x-x)<30 && abs(defender.y-y)<30) {
        x= 0;
        y= (int)random(0,200);
        lives=lives-3;
        bang.add(new Explosion(mouseX-10, mouseY-10));
        if (lives==0){
        gameMode=GAMEOVER;
        doGameover();
        }
    }
  }
}
