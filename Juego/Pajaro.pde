class Pajaro{
  private PVector posicion;
  private PVector velocidad;
  private float gravedad;
  private float fuerzaSalto;
  private float collider;
  private boolean chocado;
  private float ultimoSalto;
  private float cooldownSalto;
  private float tiempo;
  
  Pajaro(PVector posicion, PVector velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.fuerzaSalto= 300;
    this.gravedad = 200;
    this.collider = 25;
    this.chocado = false;
    this.ultimoSalto = 0;
    this.cooldownSalto = 0.1f; // 100ms entre saltos
    this.tiempo = 0;
    
  }
  
  void dibujar(){
    if(!chocado){
    fill(#C9FFD2);
    circle(this.posicion.x, this.posicion.y, this.collider * 2);
    }
  }
  
  void mover(float dt){
    
    if(!chocado){
      //aplicamos gravedad
    this.posicion.y += velocidad.y * dt;
    this.velocidad.y += gravedad * dt;
    
    //lo movemos por el eje x
    this.posicion.x += velocidad.x * dt;
    }

  }
   boolean puedeSaltar() {
    return !chocado && ((tiempo - ultimoSalto >= cooldownSalto));
  }
  //metodo para que salte
  void saltar(float dt){
    this.posicion.y -= fuerzaSalto * dt;
    ultimoSalto = tiempo;
  }
  
  void chocar(){
    this.chocado = true;
    this.velocidad.y = 0;
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
