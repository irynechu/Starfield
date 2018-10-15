OddballParticle oddpart = new OddballParticle(300,300,(Math.random()*300),(Math.random()*2+6));
JumboParticle jumpart = new JumboParticle(300,300,0,(Math.random()*2+6));
Particle[] newpart = new Particle[50];

void setup() 
{
  size(500,500);
  frameRate(500);
  for (int i = 0; i < newpart.length; i++) {
    newpart[i] = new NormalParticle(850,850,(Math.random()*360),(Math.random()*2+6));
  }
}

void draw() 
{
  background(22,238,247);
  ellipse(250,250,5,5);
  oddpart.move();
  oddpart.show();
  jumpart.move();
  jumpart.show();
  for (int i = 0; i < newpart.length; i++) 
  {
    newpart[i].show();
    newpart[i].move();
  }
}

class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  float mySize;
  int myColor;
  NormalParticle(double x, double y, double angle, double spd) 
  {
    myX = x;
    myY = y;
    myAngle = angle*PI/180*(-1);
    mySpeed = spd;
  }

  public void move() 
  {
    myX += mySpeed * cos((float)(myAngle));
    myY += mySpeed * sin((float)(myAngle));
    mySize += 0.05;
    if (myX < 0 || myX > 500) 
    {
      myX = (int)(Math.random()*10+25);
      myY = (int)(Math.random()*10+25);
      myAngle = (Math.random()*360);
      mySpeed = (Math.random()*3+5);
      mySize = 10;
    }
  }

  public void show() 
  {
    fill(255,0,0);
    ellipse((float)(myX),(float)(myY),mySize,mySize);
  }
}

interface Particle
{
  public void move();
  public void show();
}

class OddballParticle implements Particle 
{ 
  double myX, myY, myAngle, mySpeed;
  OddballParticle(double x, double y, double angle, double spd) 
  {
    myX = x;
    myY = y;
    myAngle = angle*PI/180*(1); 
    mySpeed = spd;
  }

  public void move() 
  {
    mySpeed = (Math.random()*9+1);
    myX += mySpeed * cos((float)(myAngle));
    myY += mySpeed * sin((float)(myAngle));
    if (myX < 0 || myX > 500) {
      myX = 250;
      myY = 250;
      myAngle = (Math.random()*300);
      mySpeed = (Math.random()*5+5);
    }
  }
  public void show() 
  {
    fill(239,255,21);
    ellipse((float)(myX),(float)(myY),20,20);
  }
}

class JumboParticle extends NormalParticle 
{ 
  JumboParticle(double x, double y, double angle, double spd) 
  {
    super(x,y,angle,spd);
  }

  public void show() 
  {
    fill(255,5,185);
    ellipse((float)(myX),(float)(myY),50,50);
  }
  public void move() 
  {
    myX = 250+200*sin((float)(myAngle));
    myY = 250+200*cos((float)(myAngle));
    myAngle += PI/10;
  }
}
