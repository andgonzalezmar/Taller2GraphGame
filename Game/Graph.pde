class Graph {
  // 1. Attributes
  Node[] nodes;
  Line[] lines;
  Node nodo;
  Node nodo1;
  
  Table tablaPunto;
  Table tablaConexiones;

  boolean terminar = false;
  boolean ganar = false;
    
  int numLineas;
  int numNodos;


  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  Graph() {

    nodes = new Node[int(random(5, 15))];
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<5 ? new Circle() : new Rectangle();
      
    // conecta todos los nodos en bucle
    lines = new Line[nodes.length];
    for (int i = 0; i < lines.length; i++)
        lines[i] = new GuideLine(nodes[i], nodes[i+1]);
  }

  // 2.2. Main constructor
  
  Graph(String file, String file2) {

    tablaPunto = loadTable(file);
    numNodos = tablaPunto.getRowCount();
    nodes=new Node[numNodos-1];  
   
    for (int i = 0; i < numNodos-1; i++) {
      float posx = tablaPunto.getFloat(i+1, 0);
      float posy = tablaPunto.getFloat(i+1, 1);
      PVector position = new PVector(posx,posy);
      if (i < 5)
        nodo = new Circle(position, (float)35,i);
      else 
        nodo = new Rectangle(position,(float)35,i);        
      nodes[i]= nodo;
      
    }
    
    tablaConexiones = loadTable(file2);
    int contador = 0;
    for (int i=0; i<tablaConexiones.getRowCount(); i++) {  
      for (int j=0; j<tablaConexiones.getRowCount(); j++) {
        float a= tablaConexiones.getFloat(i, j);
        if (a==1) {
          contador++;
        }
      }
    }

    lines = new Line[contador];
    int p=-1;
    for(int i=0;i<tablaConexiones.getRowCount();i++)
    {
      for(int j=0;j< tablaConexiones.getRowCount();j++)
      {
        if(tablaConexiones.getFloat(i, j)==1){
          p++;
          Line linea;
          linea = new GuideLine(nodes[i], nodes[j]);
          
          nodes[i].nodosPosi.add(nodes[j]);
          nodes[j].nodosPosi.add(nodes[i]);
          nodes[i].lines.add(linea);          
          nodes[j].lines.add(linea);
          
          lines[p] = linea;
        }
      }
    }
  }
  
  void jugar(){
    boolean lineaHecha = false;
    numLineas = 0;
    for (int i=0; i<numNodos-1; i++){
      boolean nodoSeleccionado = nodes[i].pick(mouseX,mouseY);
      if (nodoSeleccionado) {
        Line linea;
        Node nodoAnterior = nodo1;
        nodo1 = nodes[i];        
        if (nodoAnterior == null){ 
          nodo1.seleccionado = true;
          return;
        }
        else{
        lineaHecha = nodoAnterior.unirNodos(nodo1);
        }                    
        if(lineaHecha){ 
          nodoAnterior.seleccionado = false;
          nodo1.seleccionado = true;
          linea = nodo1.dibujar(nodo1,nodoAnterior);
          linea.elegir = true;
          nodo1.nodosPosi.remove(nodoAnterior);
          nodoAnterior.nodosPosi.remove(nodo1);
        } 
        else { 
          nodo1 = nodoAnterior;
        }
        if (nodo1.nodosPosi.size() == 0) {
          terminar = true;
        }
      }
      numLineas += nodes[i].nodosPosi.size();
    }
    if (numLineas<=1)
      ganar = true;      
  }

  void display() {
    for (int i = 0; i < lines.length; i++){
      lines[i].display();
    }
    for (int i = 0; i < nodes.length; i++){
      nodes[i].display();
    }
  }
}
