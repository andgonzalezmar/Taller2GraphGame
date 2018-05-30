abstract class Node {
  // 1. Attributes
  public int indice;
  PVector position;
  float size;
  Boolean seleccionado = false;
  ArrayList<Line> lines = new ArrayList<Line>();
  ArrayList<Node> nodosPosi = new ArrayList<Node>();

  // 2. Constructors
  // 2.1. Default
  Node() {
    setPosition(random(50, width-50), random(50, height-50));
    setSize(random(20, 50));
  }

  // 2.2. Other
  Node(PVector p, float s, int indice) {
    this.indice = indice;
    setPosition(p);
    setSize(s);
  }

  // 3. Methods
  
  boolean unirNodos (Node node1){
    return nodosPosi.contains(node1);
  }
  
  Line dibujar (Node a, Node b) {
    Line l;
    for(int i=0;i<lines.size();i++) {
      l = lines.get(i);
      if (l.pintar(a,b)) 
        return l;        
    }
    return null;
  }

  abstract void display();

  abstract boolean pick(int x, int y);

  // 3.2. Setters
  void setPosition(PVector pos) {
    position = pos;
  } 
  
  // method overloading
  void setPosition(float x, float y) {
    // call original version on the correct type
    setPosition(new PVector(x, y));
  }
  void setSize(float s) {
    size = s;
  }

  // 3.3. Getters
  PVector position() {
    return position;
  }
  float size() {
    return size;
  }
}
