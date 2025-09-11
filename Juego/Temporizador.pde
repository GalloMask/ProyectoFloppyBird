class Temporizador{
  private int tiempo = 30;
  private int tiempoRest;
  private int tiempoInicial;
  private boolean completado = false;
  
  Temporizador(){
    tiempoInicial = millis();
    tiempoRest = tiempo;
    completado = false;
  }
  
  void actTiempo(){
  }
  
  void dibujar(){
  }
}
