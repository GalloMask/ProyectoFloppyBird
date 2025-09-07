class Pajaro{
  private PVector posicion;
  private float velocidad;
  private float fuerzaSalto;
  //private PImage spriteAve;
  
  Pajaro(PVector posicion, float velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.fuerzaSalto= 5;
    
  }
  
  void dibujar(){
    fill(#C9FFD2);
    circle(this.posicion.x, this.posicion.y, 40);
  }
  
  void aplicarGravedad(float gravedad){
    this.velocidad += gravedad;
  }
  
  void mover(){
    this.posicion.x+= velocidad;
    
  }
  
  void saltar(){
    this.velocidad = -fuerzaSalto;
  }
  
  //boolean chocaCon(){
  //}
}
