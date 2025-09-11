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
    int tiempoTranscurrido = (millis() - tiempoInicial) / 1000;
    tiempoRest = max(0, tiempo - tiempoTranscurrido);
  }
  
  void dibujar(){
      fill(0);
      textSize(24);
      text("Tiempo: " + tiempoRest + "s", 20, 60);
  }
}
