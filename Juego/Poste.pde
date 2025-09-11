class Poste {
  private PVector posicion;
  private int velocidad;
  private float alto;
  private boolean esArriba;
  
  Poste(PVector posicion, int velocidad, float alto, boolean esArriba){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.alto = alto;
    this.esArriba = esArriba;
  }
  
  void dibujar(){
    fill(#E37A50);
    rect(this.posicion.x, this.posicion.y, 50, this.alto);
  }
  
  void mover(){
    this.posicion.x += -velocidad;
  }
  
  boolean siColisiona(Pajaro ave){
    float closestX = constrain(ave.getPosicion().x,
      this.posicion.x, this.posicion.x + 50);

    float closestY = constrain(ave.getPosicion().y,
      this.posicion.y, this.posicion.y + this.alto);

    float distX = ave.getPosicion().x - closestX;
    float distY = ave.getPosicion().y - closestY;

    float distance = sqrt(distX * distX + distY * distY);

    if (distance < ave.getCollider()) {
      return true;
    }
    return false;
  }
  
  public PVector getPosicion(){ return posicion; }
  void setPosicion(PVector posicion){ this.posicion= posicion; }
  
  public int getVelocidad(){ return velocidad; }
  void setVelocidad(int velocidad){ this.velocidad= velocidad; }
  
   public float getAlto(){ return alto; }
  void setAlto(float alto){ this.alto= alto; }
}
