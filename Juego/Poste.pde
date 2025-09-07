class Poste {
  private PVector posicion;
  private int velocidad;
  //private PImage spritePoste;
  
  Poste(PVector posicion, int velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
  }
  
  void dibujar(){
    fill(#E37A50);
    rect(this.posicion.x, this.posicion.y, 50, 30);
  }
  
  void mover(){
    this.posicion.y += -velocidad;
  }
  
  void tamanoAleatorio(){
  }
}
