class Pajaro{
  private PVector posicion;
  private PVector velocidad;
  private float gravedad;
  private float fuerzaSalto;
  private float collider;
  private boolean chocado;
  
  Pajaro(PVector posicion, PVector velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.fuerzaSalto= 8;
    this.gravedad = 0.1;
    this.collider = 25;
    this.chocado = false;
    
  }
  
  void dibujar(){
    if(!chocado){
    fill(#C9FFD2);
    circle(this.posicion.x, this.posicion.y, this.collider * 2);
    }
  }
  
  void mover(){
    
    if(!chocado){
      //aplicamos gravedad
    this.posicion.y += velocidad.y;
    this.velocidad.y += gravedad;
    
    //lo movemos por el eje x
    this.posicion.x += velocidad.x;
    
    
    //para evitar que se salga por abajo
    if(this.posicion.y > height -20){
      this.posicion.y = height -20;
     }
    }

  }
  //metodo para que salte
  void saltar(){
    this.posicion.y -= fuerzaSalto;
  }
  
  void chocar(){
    this.chocado = true;
  }
  
  boolean chocaCon(){
    return chocado;
  }
  
  public PVector getPosicion(){ return posicion; }
  void setPosicion(PVector posicion){ this.posicion= posicion; }
  
  public PVector getVelocidad(){ return velocidad; }
  void setVelocidad(PVector velocidad){ this.velocidad= velocidad; }
  
   public float getGravedad(){ return gravedad; }
  void setGravedad(float gravedad){ this.gravedad= gravedad; }
  
   public float getCollider(){ return collider; }
  void setCollider(float collider){ this.collider= collider; }
  
}
