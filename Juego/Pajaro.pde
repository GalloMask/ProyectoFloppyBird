class Pajaro{
  private PVector posicion;
  private PVector velocidad;
  private float gravedad;
  private float fuerzaSalto;
  private float collider;
  private boolean chocado;
  private boolean enSuelo;
  private float ultimoSalto;
  private float cooldownSalto;
  private float tiempo;
  
  Pajaro(PVector posicion, PVector velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.fuerzaSalto = 300; 
    this.gravedad = 800;
    this.collider = 25;
    this.chocado = false;
    this.enSuelo = false;
    this.ultimoSalto = 0;
    this.cooldownSalto = 0.1f; // 100ms entre saltos
    this.tiempo = 0;
  }
  
  void actualizar(float dt) {
    tiempo += deltaTime;
    
    if(!chocado){
      // Aplicar gravedad
      velocidad.y += gravedad * deltaTime;
      posicion.y += velocidad.y * deltaTime;
      
      // Mover en eje X
      posicion.x += velocidad.x * deltaTime;
      
      // Verificar si está en "suelo" (techo o piso)
      verificarLimites();
    }
  }
  
  void verificarLimites() {
    // Si esta cerca del techo
    if (posicion.y <= 0 + collider) {
      posicion.y = collider;
      velocidad.y = 0;
      enSuelo = true;
    } 
    // Si esta cerca del piso
    else if (posicion.y >= height - 20 - collider) {
      posicion.y = height - 20 - collider;
      velocidad.y = 0;
      enSuelo = true;
    } else {
      enSuelo = false;
    }
  }
  
  boolean puedeSaltar() {
    return !chocado && (enSuelo || (tiempo - ultimoSalto >= cooldownSalto));
  }
  
  void saltar(float deltaTime){
    if (puedeSaltar()) {
      velocidad.y = -fuerzaSalto;
      enSuelo = false;
      ultimoSalto = tiempo;
    }
  }
  
  void dibujar(){
    if(!chocado){
      fill(#C9FFD2);
      circle(this.posicion.x, this.posicion.y, this.collider * 2);
    }
  }
  
  void chocar(){
    this.chocado = true;
    this.velocidad.y = 0; // Detenerse al chocar
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
  
  public boolean getEnSuelo(){ return enSuelo; }
}
