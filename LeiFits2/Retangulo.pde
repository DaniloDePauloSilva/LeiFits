class Retangulo{

   private ArrayList<Vertice> vertices;
   private Vertice pivot;
   Utils util = new Utils();
   
   public Retangulo(int altura, int largura, Vertice pontoInicial)
   {
      vertices = new ArrayList<Vertice>();
      
      vertices.add(new Vertice(pontoInicial.x, pontoInicial.y));
      vertices.add(new Vertice(pontoInicial.x + largura, pontoInicial.y));
      vertices.add(new Vertice(pontoInicial.x + largura, pontoInicial.y + altura));
      vertices.add(new Vertice(pontoInicial.x, pontoInicial.y + altura));
      
      calcularPivot();
     
   }
   
   public Vertice getPivot()
   {
     return this.pivot;
   }
   
   public void calcularPivot()
   {
     int mediaX = 0;
     int mediaY = 0;
     
     for(int i = 0; i < vertices.size(); i++)
     {
       mediaX += vertices.get(i).x;
       mediaY += vertices.get(i).y;
     }
     
     mediaX = mediaX/vertices.size();
     mediaY = mediaY/vertices.size();
     
     this.pivot = new Vertice(mediaX, mediaY);
   }
   
   public void limpar()
   {
     for(int i = 0; i < vertices.size(); i++)
     {
       if(i != vertices.size() - 1)
       {
         linha((int)vertices.get(i).x, (int)vertices.get(i).y, (int)vertices.get(i + 1).x, (int)vertices.get(i + 1).y, true);
       }
       else
       {
         linha((int) vertices.get(i).x, (int) vertices.get(i).y, (int)vertices.get(0).x, (int)vertices.get(0).y, true );
       }
     }
   }

   public void desenhar()
   {
     
     for(int i = 0; i < vertices.size(); i++)
     {
       if(i != vertices.size() - 1)
       {
         linha((int)vertices.get(i).x, (int)vertices.get(i).y, (int)vertices.get(i + 1).x, (int)vertices.get(i + 1).y, false);
       }
       else
       {
         linha((int) vertices.get(i).x, (int) vertices.get(i).y, (int)vertices.get(0).x, (int)vertices.get(0).y, false);
       }
     }
   }
   
   public boolean pontoDentro(Vertice ponto)
   {
     return util.dentroPoligono(ponto , vertices); 
   }

}