Button[] boton;
Button reset;
Button menu;
Graph[] levels;
int total, current = 0;
int pantalla = 0;
boolean cambio = false;

void setup() {
  size(600, 650);
  total = 5;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++){
    levels[0] = new Graph ("Nivel1.csv","ConexionesNivel1.csv");
    levels[1] = new Graph ("Nivel2.csv","ConexionesNivel2.csv");
    levels[2] = new Graph ("Nivel3.csv","ConexionesNivel3.csv");  
    levels[3] = new Graph ("Nivel4.csv","ConexionesNivel4.csv"); 
    levels[4] = new Graph ("Nivel5.csv","ConexionesNivel5.csv");
  }
  boton = new Button[total];
  for (int i = 0; i < boton.length; i++){
    boton[0] = new Button("Nivel 1",90,10,150,200);
    boton[1] = new Button("Nivel 2",90,10,370,200);
    boton[2] = new Button("Nivel 3",90,10,150,300);
    boton[3] = new Button("Nivel 4",90,10,370,300);
    boton[4] = new Button("Nivel 5",90,10,260,400);
  }
  reset = new Button("Reinicio", 90, 10, 150, 600);
  menu = new Button("Menu", 90, 10, 450, 600);
}

void draw() {
  background(255);
  switch(pantalla){
    case 0:
    fill(0); 
    textSize(32);
    text("Para empezar, elige un nivel:",70,100);
    for(int i = 0; i < boton.length; i++){
      boton[i].display();
    }
    if(boton[0].pick(mouseX,mouseY) && cambio){
      pantalla++;
      print(pantalla);
    }
    if(boton[1].pick(mouseX,mouseY) && cambio){
      pantalla+=2;
      print(pantalla);
    }
    if(boton[2].pick(mouseX,mouseY) && cambio){
      pantalla+=3;
      print(pantalla);
    }
    if(boton[3].pick(mouseX,mouseY) && cambio){
      pantalla+=4;
      print(pantalla);
    }
    if(boton[4].pick(mouseX,mouseY) && cambio){
      pantalla+=5;
    }
  
      noFill();
     break;
    case 1:  
      current = 0;
      levels[current].display();
      if (levels[current].terminar){
      if(levels[current].ganar){    
        fill(255);
        rect(0,0,600,600);
        noFill();
        fill(0); 
        textSize(32);
        text("Ganaste",height/2,width/2);
        }
      }
      reset.display();
      if(reset.pick(mouseX,mouseY) && mousePressed == true){
        levels[current] = new Graph ("Nivel"+(current+1)+".csv","ConexionesNivel"+(current+1)+".csv");
      }
      menu.display();
      if(menu.pick(mouseX,mouseY) && mousePressed){
        pantalla = 0;
        cambio = false;
      }
     break;
    case 2:
    strokeWeight(2);
    stroke(0, 0, 0);
    fill(41, 74, 255);
    ellipse(710, 40, 35, 35);
    stroke(255, 255, 255);
    fill(255, 255, 255);
    triangle(699, 41, 702, 44, 705, 41);
    noFill(); 
    strokeWeight(3);
    arc(710, 40, 15, 15, -PI, PI/2);
      current = 1;
      levels[current].display();
      if(levels[current].terminar){
        if(levels[current].ganar){
             
        fill(255);
        rect(0,0,600,600);
        noFill();
        fill(0); 
        textSize(32);
        text("Ganaste",height/2,width/2);
        }
      }
      reset.display();
      if(reset.pick(mouseX,mouseY) && mousePressed == true){
        levels[current] = new Graph ("Nivel"+(current+1)+".csv","ConexionesNivel"+(current+1)+".csv");
      }
      menu.display();
       if(menu.pick(mouseX,mouseY) && mousePressed){
        pantalla = 0;
        cambio = false;
      }
     break;
    case 3: 
    current = 2;
      levels[current].display();
      if (levels[current].terminar){
      if(levels[current].ganar){   
           
        fill(255);
        rect(0,0,600,600);
        noFill();
        fill(0); 
        textSize(32);
        text("Ganaste",height/2,width/2);
      }
    }
      reset.display();
      if(reset.pick(mouseX,mouseY) && mousePressed == true){
        levels[current] = new Graph ("Nivel"+(current+1)+".csv","ConexionesNivel"+(current+1)+".csv");
      }
      menu.display();
       if(menu.pick(mouseX,mouseY) && mousePressed){
        pantalla = 0;
        cambio = false;
      }
      break;
    case 4: 
      current = 3;
      levels[current].display();
      if (levels[current].terminar){
      if(levels[current].ganar){  
           
        fill(255);
        rect(0,0,600,600);
        noFill();
        fill(0); 
        textSize(32);
        text("Ganaste",height/2,width/2);
        }
      }
      reset.display();
      if(reset.pick(mouseX,mouseY) && mousePressed == true){
        levels[current] = new Graph ("Nivel"+(current+1)+".csv","ConexionesNivel"+(current+1)+".csv");
      }
      menu.display();
       if(menu.pick(mouseX,mouseY) && mousePressed){
        pantalla = 0;
        cambio = false;
      }
     break;
    case 5:
    current = 4;
      levels[current].display();
      if (levels[current].terminar){
      if(levels[current].ganar){       
      }
      }
      reset.display();if(reset.pick(mouseX,mouseY) && mousePressed == true){
        levels[current] = new Graph ("Nivel"+(current+1)+".csv","ConexionesNivel"+(current+1)+".csv");
      }
      menu.display();
       if(menu.pick(mouseX,mouseY) && mousePressed){
        pantalla = 0;
        cambio = false;
      }
     break;
  }
}

void mouseClicked() {
  levels[current].jugar();
}

void mousePressed(){
   cambio = true;
}
