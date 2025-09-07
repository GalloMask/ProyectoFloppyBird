class MaquinaDeEstado {
  public static final int GANASTE = 1;
  public static final int PERDISTE = 2;
}

private Pajaro ave;
private boolean salta;
//private ArrayList<Poste> poste;
//private PImage fondo;

void setup(){
  size(700, 500);
  ave = new Pajaro(new PVector(10, height/2),5);
  //poste = new ArrayList<Poste>();
}

void draw(){
  background(#C9F6FF);
  ave.dibujar();
  ave.mover();
  if(salta) ave.saltar();
}

void keyPressed(){
  if(keyCode == ' ')salta = true;
}

void keyReleased(){
    if(keyCode == ' ')salta = false;
}
