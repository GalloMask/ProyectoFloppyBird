class MaquinaDeEstado {
  public static final int JUGANDO = 1;
  public static final int GANASTE = 2;
  public static final int PERDISTE =3;
}

private Pajaro ave;
private boolean salta;
private ArrayList<Poste> postes;
private int ultimoPosteX = 0;
public int estado = MaquinaDeEstado.JUGANDO;

void setup(){
  
  size(500, 600);
  ave = new Pajaro(new PVector(18, height/2), new PVector(2.4,0));
  postes = new ArrayList<Poste>();
  generarPostes();
}

void draw(){
  background(#C9F6FF);

   // Dibujar y mover postes
  for(int i = postes.size() - 1; i >= 0; i--){
    Poste p = postes.get(i);
    p.dibujar();
    p.mover();
    
    // Si el poste sale de la pantalla
    if(p.getPosicion().x + 50 < 0){
      postes.remove(i); // Eliminar el poste
      generarPostes(); // Crear uno nuevo
    }
  }
  
  switch(estado){
    case  MaquinaDeEstado.JUGANDO: {
      
      if(!ave.chocaCon()){
          ave.dibujar();
          ave.mover();
          if(salta) ave.saltar();
      }
      
      for (int i = 0; i < postes.size(); i++) {
      Poste p =´postes.get(i);
      if (p.hayColision(circulo)) {
        circulo.explotar();
        break; // Una vez que colisiona, no necesitamos seguir verificando
      }
    } 
  }
}

void keyPressed(){
  if(keyCode == ' ')salta = true;
}

void keyReleased(){
    if(keyCode == ' ')salta = false;
}

void generarPostes(){
    
   // Calcular posición X (después del último poste)
  float x = ultimoPosteX + random(280, 220); // Distancia aleatoria entre postes
  
  // Generar alturas aleatorias
  float alturaSuperior = random(100, 250);
  float espacio = random(120, 180); // Espacio para que pase el pájaro
  float alturaInferior = height - alturaSuperior - espacio;
  
  // Crear poste superior
  postes.add(new Poste(new PVector(x, 0), 2, alturaSuperior, true));
  
  // Crear poste inferior
  postes.add(new Poste(new PVector(x, height - alturaInferior), 2, alturaInferior, false));
  
  ultimoPosteX = (int)x; // Actualizar la posición del último poste
}
