public class DeltaTime{
  private float lastTime;
  private float currentTime;
  private float delta;
  private float timeScale = 1.0f;
  
  DeltaTime(){
    lastTime = millis() / 1000.0f;
  }
  
  void actualizar(){
    currentTime = millis() / 1000.0f;
    delta = currentTime - lastTime;
    lastTime = currentTime;
    
    delta = min(delta, 0.1f) * timeScale;
  }
  
  float getDeltaTime(){ return delta; }
  
  float getUnScaleDeltaTime(){ return delta / timeScale; }
  
  float getTimeScale(){ return timeScale; }
   void setTimeScale(float scale){ this.timeScale = max(scale, 0.1f); }
   
   float getTotal(){ return currentTime;}
}
