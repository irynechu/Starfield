NormalParticle[] particles;
void setup()
{
  particles = new NormalParticle[300];
  for(int nI = 0; nI < particles.length; nI++)
  {
    particles[nI] = new NormalParticle();
  }
  particles[0]= new OddballParticle();
}
void draw()
{
  size(600,600);
  
}
class NormalParticle
{
  int myX,myY;
  double dSpeed, dDirection;
  NormalParticle(int x, int y)
  {
    myX = x;
    myY = y;
    dSpeed = Math.random()*10;
    dDirection = Math.PI*2*Math.random();
  }
}
interface Particle
{
  //your code here
}
class OddballParticle //uses an interface
{
  //your code here
}
class JumboParticle //uses inheritance
{
  //your code here
}

