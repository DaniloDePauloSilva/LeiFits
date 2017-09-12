class Utils
{
 
  public float distancia(Vertice a, Vertice b)
  {
    return (float)Math.sqrt(Math.pow(b.x - a.x, 2) + Math.pow(b.y - a.y, 2));
  }
  
  public PVector sub(Vertice a, Vertice b)
  {
    return new PVector((float)(b.x - a.x), (float)(b.y - a.y));
  }
  
  boolean dentroPoligono(Vertice p, ArrayList<Vertice> vertices)
  {
    int n = vertices.size();
    int j = n - 1;
    boolean b = false;
    float x = p.x;
    float y = p.y;
    
    for(int i = 0; i < n; i++)
    {
      if(vertices.get(j).y <= y && y < vertices.get(i).y &&
        area2(vertices.get(j), vertices.get(i), p) > 0 ||
        vertices.get(i).y <= y && y < vertices.get(j).y &&
        area2(vertices.get(i), vertices.get(j), p) > 0)
        {
          b = !b;
        }
        
        j = i;
    }
  
    return b;
  }
  
  float area2(Vertice a, Vertice b, Vertice c) 
  {  
    return (a.x - c.x) * (b.y - c.y) - (a.y - c.y) * (b.x - c.x); 
  } 
  
}