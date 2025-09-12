class Temporizador{
  private int tiempo = 30;
  private int tiempoRest;
  private int tiempoInicial;
  private boolean juegoTerminado = false;
  
  Temporizador(){
    tiempoInicial = millis();
    tiempoRest = tiempo;
  }
  
  void actTiempo(){
    
    if(estado !=  MaquinaDeEstado.JUGANDO) return ;
    
    int tiempoTranscurrido = (millis() - tiempoInicial) / 1000;
    tiempoRest = max(0, tiempo - tiempoTranscurrido);
    
    if( tiempoRest == 0 && estado == MaquinaDeEstado.JUGANDO){
      estado = MaquinaDeEstado.GANASTE;
      juegoTerminado = true;
    }  
    
  }
  
  void dibujar(){
      fill(0);
      textSize(24);
      text("Tiempo: " + tiempoRest + "s", 20, 60);
  }
  
  int getTiempoTrans(){ return tiempo - tiempoRest; }
}
