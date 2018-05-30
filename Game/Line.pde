abstract class Line {
  // 1. Attributes
  Node origin, end;
  Boolean elegir = false;

  // 2. Constructors
  // 2.1. Default
  Line(Node node1, Node node2){
    origin = node1;
    end = node2;
  }

  // 3. Methods

  abstract void display(); 
  
  public boolean pintar (Node a, Node b){
    if ((origin==a && end==b) || (origin==b && end==a)){
      return true;
    }
    else{
      return false;
    }
  }

  // 3.3. Getters
  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}
