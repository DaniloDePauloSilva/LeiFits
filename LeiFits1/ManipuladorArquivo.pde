class ManipuladorArquivo
{
  public void gravarArquivoTexto(ArrayList<Registro> listaRegistros)
  {
    StringBuilder strArq = new StringBuilder();
    
    for(int i = 0; i < listaRegistros.size(); i++)
    {
      strArq.append("*****************************\n");
      strArq.append("Registro " + i);
      strArq.append(":\n  Tempo de chegada (ms): ");
      strArq.append(listaRegistros.get(i).tempo);
      strArq.append("\n  Distância (px): ");
      strArq.append(listaRegistros.get(i).distancia);
      strArq.append("\n");
    }

    try
    {
      java.io.FileWriter writer = new java.io.FileWriter(new java.io.File("arquivoRegistro.txt"));
      writer.write(strArq.toString());
      writer.flush();
      writer.close();
      writer = null;
    }
    catch(Exception ex)
    {
      println("Erro:\n\n " + ex);
    }
  }
}