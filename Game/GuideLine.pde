class GuideLine  extends Line {
  @Override
   void display() {
    pushStyle();
    strokeWeight(10);
    stroke(111);
    if (this.elegir){
      stroke(0);
    }  
    line(origin().position().x, origin().position().y, end().position().x, end().position().y);
    popStyle();
    }
    public GuideLine(Node node1, Node node2){
      super(node1,node2);
     }
   }
   
  
