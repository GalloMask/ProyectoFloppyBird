class Pajaro{
  private PVector posicion;
  private PVector velocidad;
  private float gravedad;
  private float fuerzaSalto;
  //private PImage spriteAve;
  
  Pajaro(PVector posicion, PVector velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.fuerzaSalto= 8;
    this.gravedad = 0.1;
    
  }
  
  void dibujar(){
    fill(#C9FFD2);
    circle(this.posicion.x, this.posicion.y, 40);
  }
  
  void mover(){
    
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
  //metodo para que salte
  void saltar(){
    this.posicion.y -= fuerzaSalto;s
  }
  
  //boolean chocaCon(){
  //}
}
