class MaquinaDeEstado {
  public static final int GANASTE = 1;
  public static final int PERDISTE = 2;
}

private Pajaro ave;
private boolean salta;
private ArrayList<Poste> poste;
//private PImage fondo;

void setup(){
  
  size(700, 500);
  ave = new Pajaro(new PVector(18, height/2), new PVector(5,0));
  poste = new ArrayList<Poste>();
  generarPostes(13);
}

void draw(){
  background(#C9F6FF);
  ave.dibujar();
  ave.mover();
  if(salta) ave.saltar();
  
  for(Poste p: poste){
    p.dibujar();
  }
}

void keyPressed(){
  if(keyCode == ' ')salta = true;
}

void keyReleased(){
    if(keyCode == ' ')salta = false;
}

void generarPostes(int cantidad){
  for(int i = 1; i < cantidad; i++){
    float x = random(10, 700);
    float y = random(50, height - 100);
    float tamanio = random(48);
    boolean posicionValida = true;
    
     for (Poste p : poste) {
        if (abs(p.getPosicion().x - x) < 100 && abs(p.getPosicion().y - y) < 50) {
          posicionValida = false;
          break;
        }
      }

      if (posicionValida) {
        poste.add(new Poste(new PVector(x, y),5, tamanio));
      } else {
        i--; 
      }
    }
    
    poste.add(new Poste(new PVector(2/width, 400),5, 40));
}
