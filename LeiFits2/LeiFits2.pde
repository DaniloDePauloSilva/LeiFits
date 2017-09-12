import java.awt.Robot;
import java.awt.Component;

Retangulo retangulo;
Robot robot;

int tempo = 0;

javax.swing.Timer timer = new javax.swing.Timer(250, new java.awt.event.ActionListener() {

  public void actionPerformed(java.awt.event.ActionEvent e)
  {
    tempo += 250;

    if (retangulo.pontoDentro(new Vertice(mouseX, mouseY)) && tempo != 0)
    {
      println("tempo de chegada ao objeto(ms): " + tempo);
      atribuirNovasPosicoesMouse();
      atribuirTamanhoRetangulo();
    }
  }
}
);


void atribuirNovasPosicoesMouse()
{
  int x = (int) (Math.random() * 800 + 1);
  int y = (int) (Math.random() * 600 + 1);
  
  robot.mouseMove(x, y);
  
}

public void atribuirTamanhoRetangulo()
{
  if (retangulo != null)
  {
    retangulo.limpar();
  }

  int largura = 10 + ((int)(Math.random() * 150));
  println("Largura: " + largura);
  double altura = largura * 0.4;
  Vertice posicao = new Vertice((float) Math.random() * width - largura, (float)(Math.random() * height - altura));
  retangulo = new Retangulo((int)altura, largura, posicao);

  retangulo.desenhar();
}

void setup()
{
  try
  {
    robot = new Robot();
  }
  catch(Exception ex)
  {
    ex.printStackTrace();
  }
  
  size(800, 600);
  //fullScreen();
  background(255);
  timer.start();
  atribuirTamanhoRetangulo();
  
}

void draw()
{
}

void linha(int xi, int yi, int xf, int yf, boolean limpar)
{

  int x = xi;
  int y = yi;
  int incX = 1;
  int incY = 1;
  float deltaX = xf - xi;
  float deltaY = yf - yi;
  float coefA = (deltaY / deltaX);
  float coefB = yi  - (coefA * xi);

  if (xi > xf)
  {
    incX = -1;
  }

  if (yi > yf)
  {
    incY = -1;
  }

  if (deltaX < 0)
  {
    deltaX = -deltaX;
  }

  if (deltaY < 0)
  {
    deltaY = -deltaY;
  }

  if (deltaX >= deltaY)
  {

    while (x != xf)
    {

      set(x, y, (limpar) ? color(255) : color(0));

      x+= incX;

      float dy = (coefA * x) + coefB;

      dy = Math.abs(dy - y);

      if (dy >= 0.5)
      {
        y += incY;
      }
    }
  } else
  {
    while (y != yf)
    {

      set(x, y, (limpar) ? color(255) : color(0));

      y += incY;

      float dx = (y - coefB)/ coefA;

      dx = Math.abs(dx - x);

      if (dx >= 0.5)
      {
        x+= incX;
      }
    }
  }
}