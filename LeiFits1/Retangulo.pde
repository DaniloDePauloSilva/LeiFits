class Retangulo{

   private ArrayList<Vertice> vertices;
   Utils util = new Utils();
   
   public Retangulo(int altura, int largura, Vertice pontoInicial)
   {
      vertices = new ArrayList<Vertice>();
      
      vertices.add(new Vertice(pontoInicial.x, pontoInicial.y));
      vertices.add(new Vertice(pontoInicial.x + largura, pontoInicial.y));
      vertices.add(new Vertice(pontoInicial.x + largura, pontoInicial.y + altura));
      vertices.add(new Vertice(pontoInicial.x, pontoInicial.y + altura));
     
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