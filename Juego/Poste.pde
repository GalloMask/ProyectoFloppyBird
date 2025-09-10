class Poste {
  private PVector posicion;
  private int velocidad;
  private float tamanio;
  //private PImage spritePoste;
  
  Poste(PVector posicion, int velocidad, float tamanio){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.tamanio = tamanio;
  }
  
  void dibujar(){
    fill(#E37A50);
    rect(this.posicion.x, this.posicion.y, 30, this.tamanio);
  }
  
  void mover(){
    this.posicion.y += -velocidad;
  }
  
  void tamanoAleatorio(){
  }
  
  public PVector getPosicion(){ return posicion; }
  void setPosicion(PVector posicion){ this.posicion= posicion; }
  
  public int getVelocidad(){ return velocidad; }
  void setVelocidad(int velocidad){ this.velocidad= velocidad; }
  
   public float getTamanio(){ return tamanio; }
  void setTamanio(float tamanio){ this.tamanio= tamanio; }
}
