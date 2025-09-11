class MaquinaDeEstado {
  public static final int JUGANDO = 1;
  public static final int GANASTE = 2;
  public static final int PERDISTE =3;
}

private Pajaro ave;
private boolean salta;
private ArrayList<Poste> postes;
private int ultimoPosteX = 0;
private DeltaTime dt;
public int estado = MaquinaDeEstado.JUGANDO;

void setup(){
  
  size(500, 600);
  ave = new Pajaro(new PVector(18, height/2), new PVector(5, 0));
  postes = new ArrayList<Poste>();
  generarPostes();
  
  dt = new DeltaTime();
}

void draw(){
  background(#C9F6FF);
  dt.actualizar();
  float deltaTime = dt.getDeltaTime();

   // Dibujar y mover postes
  for(int i = postes.size() - 1; i >= 0; i--){
    Poste p = postes.get(i);
    p.dibujar();
    p.mover(deltaTime);
    
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
          ave.mover(deltaTime);
          if(salta) ave.saltar(deltaTime);
      }
      
      for (int i = 0; i < postes.size(); i++) {
      Poste p =postes.get(i);
      if (p.siColisiona(ave)) {
        ave.chocar();
        estado = MaquinaDeEstado.PERDISTE;
        break; // Una vez que colisiona, no necesitamos seguir verificando
      }
    }
    // Verificar si choca con el suelo o techo
      if (ave.getPosicion().y >= height - 20 || ave.getPosicion().y <= 0) {
        ave.chocar();
        estado = MaquinaDeEstado.PERDISTE;
      }
   break;
  }
  case MaquinaDeEstado.GANASTE: {
    break;
  }
  case MaquinaDeEstado.PERDISTE: {
     fill(255, 0, 0);
      textSize(32);
      text("PERDISTE", width/2 - 80, height/2);
    break;
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
  float x = ultimoPosteX + random(180, 220); // Distancia aleatoria entre postes
  
  // Generar alturas aleatorias
  float alturaSuperior = random(100, 250);
  float espacio = random(120, 180); // Espacio para que pase el pájaro
  float alturaInferior = height - alturaSuperior - espacio;
  
  // Crear poste superior
  postes.add(new Poste(new PVector(x, 0), 100, alturaSuperior, true));
  
  // Crear poste inferior
  postes.add(new Poste(new PVector(x, height - alturaInferior), 100, alturaInferior, false));
  
  ultimoPosteX = (int)x; // Actualizar la posición del último poste
}
