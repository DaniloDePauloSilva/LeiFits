class Vertice
{
   float x;
   float y;
   
   public Vertice(float x, float y)
   {
     this.x = x;
     this.y = y;
   }
   
   public Vertice()
   {
     this.x = 0;
     this.y = 0;
   }
   
   public String toString()
   {
     return ("X: " + x + " | Y:" + y);
   }
   
}