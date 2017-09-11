import java.awt.Robot;
import java.awt.Component;

int tempo = 0;
Retangulo retangulo = new Retangulo(30, 70, new Vertice(0,0));

int distanciaInicial;
Robot robot;

Utils util = new Utils();

void atribuirNovasPosicoesMouse()
{
  int x = (int) (Math.random() * 800 + 1);
  int y = (int) (Math.random() * 600 + 1);
  
  robot.mouseMove(x, y);
  
}

boolean procurando = false;

void setup(){
  
  try
  {
    robot = new Robot();
  }
  catch(Exception ex)
  {
    ex.printStackTrace();
  }
  
  size(800, 600);
  background(255);
  timer.start();
  
}

void draw(){

  
}

public void limpar()
{
  background(255);
  
}


javax.swing.Timer timer = new javax.swing.Timer(10 ,new java.awt.event.ActionListener(){
        
        public void actionPerformed(java.awt.event.ActionEvent e)
        {
           tempo += 10;
           
           if(retangulo.pontoDentro(new Vertice(mouseX, mouseY)) && tempo != 0)
           {
             println("tempo de chegada ao objeto(ms): " + tempo);
             atribuirNovasPosicoesRetangulo();
             atribuirNovasPosicoesMouse();
             distanciaInicial = (int) util.distancia(new Vertice(mouseX, mouseY), retangulo.getPivot());
             println("Distância: " + distanciaInicial);
             tempo = 0;
          
           }
        }
        
    }); 

void atribuirNovasPosicoesRetangulo()
{
  retangulo.limpar();
  
  retangulo = new Retangulo(30, 70, new Vertice((float) Math.random() * width - 70, (float) Math.random() * height - 30));
  
  retangulo.desenhar();
}


 void linha(int xi,int yi, int xf, int yf, boolean limpar)
 {
   
    int x = xi;
    int y = yi;
    int incX = 1;
    int incY = 1;
    float deltaX = xf - xi;
    float deltaY = yf - yi;
    float coefA = (deltaY / deltaX);
    float coefB = yi  - (coefA * xi);
   
    if(xi > xf)
    {
      incX = -1;
    }
    
    if(yi > yf)
    {
      incY = -1;
    }
    
    if(deltaX < 0)
    {
      deltaX = -deltaX;
    }
    
    if(deltaY < 0)
    {
      deltaY = -deltaY;
    }
    
    if(deltaX >= deltaY)
    {
      
      while(x != xf)
      {
     
         set(x,y, (limpar) ? color(255) : color(0));
        
        x+= incX;
        
        float dy = (coefA * x) + coefB;
       
         dy = Math.abs(dy - y);
     
        if(dy >= 0.5)
        {
          y += incY;
        }
      }
    }
    else
    {
      while(y != yf)
      {
   
        set(x,y, (limpar) ? color(255) : color(0));
       
        y += incY;
        
        float dx = (y - coefB)/ coefA;
        
        dx = Math.abs(dx - x);
        
        if(dx >= 0.5)
        {
          x+= incX;
        }
        
      }
    }
 }