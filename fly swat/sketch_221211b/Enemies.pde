abstract class Enemies {
  float x;
  float y;
  float speedX;
  float speedY;
  Enemies(float x, float y) {
    this.x=x;
    this.y=y;
  }

  abstract void display();
  
  private void move(float speedX, float speedY) {
    this.speedX=speedX;
    this.speedY=speedY;

      float targetX= halloweenPumpkin.x+30;
      float targetY= halloweenPumpkin.y+30;

      float distanceX=targetX-x;
      float distanceY=targetY-y;

      float powerX= (float)Math.pow(distanceX, 2);
      float powerY= (float)Math.pow(distanceY, 2);
      float distance= sqrt(powerX+ powerY);

      float changeSpeedX= (speedX/distance)*distanceX;
      float changeSpeedY= (speedY/distance)*distanceY;

      y=y+round(changeSpeedY);
      x=x+round(changeSpeedX);
    }

    abstract void collision();
    abstract void killingEnemies();
  
}
