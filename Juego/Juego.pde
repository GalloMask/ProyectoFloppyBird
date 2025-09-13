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
private Temporizador time;

public int estado = MaquinaDeEstado.JUGANDO;

void setup(){
  
  size(500, 600);
  ave = new Pajaro(new PVector(18, height/2), new PVector(5, 0));
  postes = new ArrayList<Poste>();
  generarPostes();
  
  dt = new DeltaTime();
  time = new Temporizador();
}

void draw(){
  background(#C9F6FF);
  
  dt.actualizar();
  float deltaTime = dt.getDeltaTime();
  
  float velocidadBase = 100 + (time.getTiempoTrans() * 10);
  aplicarVPostes(velocidadBase);

   // Dibujar y mover postes
  for(int i = postes.size() - 1; i >= 0; i--){
    Poste p = postes.get(i);
    p.dibujar();
    p.mover(deltaTime);
    
    // Si el poste sale de la pantalla
    if(p.getPosicion().x + 50 < 0){
      postes.remove(i); // Elimina el poste
      generarPostes(); // Crea uno nuevo
    }
  }
  
  switch(estado){
    case  MaquinaDeEstado.JUGANDO: {
      time.actTiempo();
      time.dibujar();
      
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
    // Verificar si choca con el suelo o lstecho
      if (ave.getPosicion().y >= height - 20 || ave.getPosicion().y <= 0) {
        ave.chocar();
        estado = MaquinaDeEstado.PERDISTE;
      }
   break;
  }
  case MaquinaDeEstado.GANASTE: {
      fill(255, 0, 0);
      textSize(32);
      text("GANASTE", width/2 - 80, height/2);
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

void aplicarVPostes(float nuevaVelocidad) {
  for (Poste p : postes) {
    p.setVelocidad(nuevaVelocidad);
  }
}

void generarPostes(){
    
   // Calcular posición X (después del último poste)
  float x = ultimoPosteX + random(180, 220); // Distancia aleatoria entre postes
  // Generar alturas aleatorias
  float alturaSuperior = random(100, 250);
  float espacio = random(120, 180); // Espacio para que pase el pájaro
  float alturaInferior = height - alturaSuperior - espacio;
  
  float velocidadActual = 100 + (time.getTiempoTrans() * 10);
  // Crea poste superior
  postes.add(new Poste(new PVector(x, 0), velocidadActual, alturaSuperior, true));
  
  // Crea poste inferior
  postes.add(new Poste(new PVector(x, height - alturaInferior), velocidadActual, alturaInferior, false));
  
  ultimoPosteX = (int)x; // Actualizar la posición del último poste
}
