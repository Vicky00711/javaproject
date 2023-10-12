
class Bats extends Enemies {
  
  
  int imageCounter; // declared a counter variable to determine which image to reneder 
  
  //creating an array of PImages that will store my 3 PImage objects
  PImage[] batsImages= new PImage[3];
  
  //creating a constructor
  Bats(float x, float y) {
    super(x, y);
    for (int i=0; i<3; i++) {
      batsImages[i]=loadImage("bat" + i+ ".png" );
    }
  }
  
  @Override
  void display() {
    // if statement to determine which image to render according to the imageCounter
    if (imageCounter<20) {
      image(batsImages[0], x, y);
    } else if (imageCounter<40) {
      image(batsImages[1], x, y);
    } else if (imageCounter<60) {
      image(batsImages[2], x, y);
    } else {
      image(batsImages[0], x, y);
      imageCounter=0;
    }
    imageCounter++; //incrementing imageCounter by 1
  }
  
  @Override
  void collision() {
    
      if (abs(x-halloweenPumpkin.x)<40 && abs(y-halloweenPumpkin.y)<40) {
       x= random(0, 400);
        y= 0;
        lives=lives-1;
        if (lives==0){
        gameMode=GAMEOVER;
        doGameover();
        
        }
        
      }
    }
  
    @Override
    void killingEnemies() {
      
      if (abs(defender.x-x)<40 && abs(defender.y-y)<40) {

        x= random(0, 400);
        y= 0;
        score= score+1;

        bang.add(new Explosion(mouseX-10, mouseY-10));
      
    }
  }
}
