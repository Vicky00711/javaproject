// Creating a string array to store my high score
import javax.swing.*;
String[] highScore;
PImage backgroundImage;

String name;
// Creating array list of enemies which includes both of my bats and white birds
ArrayList<Enemies>enemy=new ArrayList<>();

//Creating array list of explsoions
ArrayList<Explosion>bang=new ArrayList<>();

// final variables are basically known as constants
// declaring final variables for my game mode
final int START=0;
final int RUNNING=1;
final int GAMEOVER=2;
final int RESTART=3;
int gameMode;
Pumpkin halloweenPumpkin;
Player defender;

//intializing my score variable
int score=0;
//intializing my score variable
int lives=3;

public void setup() {
  size(500, 500);

  //Reading the data from the file
  highScore=loadStrings("data/highscores.txt");
  backgroundImage= loadImage("farm.jpeg");
  backgroundImage.resize(width, height);
  imageMode(CENTER);


  startMethod();

  halloweenPumpkin = new Pumpkin(200, 360);
  defender= new Player(mouseX, mouseY);
}
public void draw() {
  switch(gameMode) {

  case START:
    gameStart();
    break;


  case RUNNING:
    gameRunning();
    break;

  case RESTART:
    if (keyPressed==true && key=='r') {

      gameMode=START;
      startMethod();

      break;
    }
  }
}
public void mouseClicked() {
  for (int i=0; i<enemy.size(); i++) {
    Enemies attacker= enemy.get(i);
    attacker.display();
    attacker.move(random(0, 0.2), random(0, 0.3));
    attacker.killingEnemies();
  }
}

public void keyPressed() {
  if (keyPressed==true && key==' ') {
    gameMode=RUNNING;
  }
}





public void doGameover() {
  background(0);
  gameMode=RESTART;

  //clearing the enemy array list when the game is over
  enemy.clear();
  scoring();
}
public void startMethod() {


  for (int i=0; i<5; i++) {
    enemy.add(new Bats((int)random(0, 400), 0));
  }
  for (int i=0; i<3; i++) {

    enemy.add(new Birds(0, random(0, 200)));
  }
  score=0;
  lives=3;
  scoring();
}
public void scoring() {

  //parse int basically converts the first argument to a string, parsing that string and then returning an integer
  if (parseInt(highScore[highScore.length-1])<=score) {
    highScore[highScore.length-1]=str(score);
    name = JOptionPane.showInputDialog(null, "Please enter your name:", "Congratulations High Score", JOptionPane.PLAIN_MESSAGE);
    text("Gameover", 220, 100);

    text(name+" New High Score:", 150, 150);
    text(score, 360, 150);
    saveStrings("data/highscores.txt", highScore);// saving the new high score into the text file
    text("To Restart Press R", 190, 200);
  } else {
    text("Gameover", 220, 100);
    text("Score:", 220, 150);
    text(score, 300, 150);
    text("High Score:", 200, 200);
    text(highScore[highScore.length-1], 300, 200);
    text("To Restart Press R", 190, 250);
  }
}
public void gameRunning() {
  image(backgroundImage, 250, 250);


  for (int i=0; i<enemy.size(); i++) {
    Enemies enemy1= enemy.get(i);
    enemy1.display();
    enemy1.move(random(0, 2), random(0, 1));
    enemy1.collision();
  }

  halloweenPumpkin.display();
  defender.display();
  defender.move();

  // for each loop to iterate through all the elements
  for (Explosion boom : bang) {
    boom.display();
  }

  text("Score: "+ score, 400, 30);
  textSize(20);
  text("Lives:" + lives, 30, 30);
  textSize(20);
}
public void gameStart() {
  background(0);
  text("Click on the mouse to kill the bats", 100, 100);
  text("Protect the pumpkin from the bats", 100, 150);
  text("If bats reach the pumpkin you loose 1 life", 100, 200);
  text("Avoid clicking the mouse to kill the white birds otherwise ", 20, 250);
  text("you directly loose the game!! ", 140, 300);
  text("CLICK SPACEBAR TO START THE GAME!!", 90, 350);
  textSize(20);
  keyPressed();
}
