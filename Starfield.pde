Particle[] aBunch;
void setup()
{
  size(500, 500); //Sets size of screen

  aBunch = new Particle[120]; //initializes variables
  aBunch [0] = new BigballParticle();
  aBunch [1] = new JumboParticle();
  aBunch [2] = new JumboParticle();
  aBunch [3] = new JumboParticle();
  for (int i = 4; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle(); //initializes normalparticle
  }
}
void draw()
{
  background(0); //sets backround color
  for (int i = 0; i < aBunch.length; i++)
  {
    aBunch [i].move(); 
    aBunch [i].show();
  }
}
class NormalParticle implements Particle //sets up the class
{
  double myX, myY, mySpeed, myAngle, myOpac, mySize;
  int myColor;
  NormalParticle()
  {
    mySpeed = (Math.random() ) + 0.5;
    myAngle = (Math.random()*(2 * Math.PI));
    myX = 250; //sets X and Y values
    myY = 250;
    myColor = 255; //sets the color
  }

  public void move()
  {
    myX = (Math.cos(myAngle) * mySpeed) + myX; //creates the speed values for X and Y
    myY = (Math.sin(myAngle) * mySpeed) + myY;
    if (myX > 500 || myX < 0 || myY > 500 || myY < 0)
    {
      myX = myY = 250;
      myOpac = 0;
      mySize = 5;
    }
    myOpac = dist(250, 250, (float)myX, (float)myY);
    mySize = (dist(250, 250, (float)myX, (float)myY)) / 100;
  }
  public void show()
  {
    noStroke();
    fill(myColor, myColor, myColor, (int)myOpac +  5);
    ellipse((float)myX, (float)myY, (float) mySize, (float)mySize);
  }
}


interface Particle
{
  public void show();
  public void move();
}
class BigballParticle implements Particle //sets up the bigball particle class
{
  double myX, myY; //doubles the values of X and Y

  BigballParticle()
  {

    myX = 250; // sets X and Y values
    myY = 250;
  }
  public void show()
  {
    fill(255);
    ellipse((float) myX, (float) myY, 20, 20);
  }
  public void move()
  {
    myX = myX + 3.6;
    myY = myX + 3.6;
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill (myColor, myColor, myColor, ((float)myOpac - 20));
    ellipse((float)myX, (float)myY, ((float) mySize) + 6, ((float)mySize) + 6);
  }
}
