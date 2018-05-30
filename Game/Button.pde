class Button{
  
  String texto;
  int size;
  float ubicacionX;
  float ubicacionY;
  float valorColor;
  
  Button(String a, int s, float c, float bx, float by){
    texto = a;
    size = s;
    valorColor = c;
    ubicacionX = bx;
    ubicacionY = by;
  }
  
  boolean pick(int x, int y) {
    return abs(x-ubicacionX) <= size()/2 && abs(y-ubicacionY) <= size()/2;
  }
  
  void display(){
    fill(valorColor);
    if(pick(mouseX,mouseY)){
      fill(255);
    }
    stroke(0);
    rect(ubicacionX,ubicacionY,size+10,size-60,8);
    noFill();
    
    fill(255);
    if(pick(mouseX,mouseY)){
      fill(0);
    }
    textSize(20);
    text(texto,ubicacionX+20, ubicacionY+20);
    noFill();
  }
  
  void setSize(int s) {
    size = s;
  }
  float size() {
    return size;
  }

}
