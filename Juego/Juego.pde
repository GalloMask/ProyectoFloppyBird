class MaquinaDeEstado {
  public static final int GANASTE = 1;
  public static final int PERDISTE = 2;
}

private Pajaro ave;
private boolean salta;
private ArrayList<Poste> postes;
private int ultimoPosteX = 0;

void setup(){
  
  size(500, 600);
  ave = new Pajaro(new PVector(18, height/2), new PVector(5,0));
  postes = new ArrayList<Poste>();
  generarPostes();
}

void draw(){
  background(#C9F6FF);
  ave.dibujar();
  ave.mover();
  if(salta) ave.saltar();
  
  for(Poste p: postes){
    p.dibujar();
    p.mover();
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
  postes.add(new Poste(new PVector(x, 0), 5, alturaSuperior, true));
  
  // Crear poste inferior
  postes.add(new Poste(new PVector(x, height - alturaInferior), 5, alturaInferior, false));
  
  ultimoPosteX = (int)x; // Actualizar la posición del último poste
}
