/*       TP#4: "El juego"
 Okreniec, Ivan - Legajo:91341/0
 Gaitan, Agustin Lucas - Legajo 91347/8
 Merchena, Nicolás - Legajo:91568/0
 */ 
//   https://youtu.be/Myrs1tTwOJM    //

Circulo circulo;
Vida vida;
int puntos, pantalla;

void setup() {
  size(400, 400);
  circulo=new Circulo(-50, 0, 50);
  vida=new Vida();
}

void draw() {
  nivel();
  circulo.display();
  circulo.teclas();
  circulo.movimiento();
  vida.mostrar();
}

void nivel() {
  background(255);
  line(100, 0, 100, 400);
  line(200, 0, 200, 400);
  line(300, 0, 300, 400);
  text("puntos:", 310, 10); 
  text(puntos, 350, 10);
}
void pantallaperder() {
  background(255, 0, 0);
  fill(255);
  textSize(25);
  text("¡perdiste!", 150, 180);
  text("puntos: ", 140, 210);
  text(puntos, 240, 210);
}
class Circulo {
  float x, y, diametro, generarNumero, velocidad;

  Circulo (float tempX, float tempY, int tempDiametro) {
    x=tempX;
    y=tempY;
    diametro=tempDiametro;
  }

  void movimiento() {
    if (y==-50)generarNumero = random(1, 4.9);
    if (generarNumero<2 && generarNumero>1) {
      x=50;
    } else if (generarNumero<3 && generarNumero>2) {
      x=150;
    } else if (generarNumero<4 && generarNumero>3) {
      x=250;
    } else if (generarNumero<5 && generarNumero>4) {
      x=350;
    }
  }

  void teclas() {
    if (pantalla==0)y += 5+velocidad;
    if (y>=width+5) {
      y=-50;
      vida.perderVida();
    }
    if (x==50 && y<width && pantalla==0 && key == 'q') {
      y=-50;
      velocidad +=  0.25;
      puntos += 1;
    }
    if (x==150 && y<width && pantalla==0 && key == 'w') {
      y=-50;
      velocidad +=  0.25;
      puntos += 1;
    }
    if (x==250 && y<width && pantalla==0 && key == 'e') {
      y=-50;
      velocidad +=  0.25;
      puntos += 1;
    }
    if (x==350 && y<width && pantalla==0 && key == 'r') {
      y=-50;
      velocidad += 0.25;
      puntos += 1;
    }
  }
  void display() {
    fill(0);
    ellipse(x, y, diametro, diametro);
  }
}
class Vida {
  int vidas;
  Vida() {
    vidas=4;
  }
  void mostrar() {
    if (vidas<4) {
      text("vidas:", 25, 10);
      text(vidas, 65, 10);
    }
    if (vidas==0) {
      pantallaperder();
      pantalla=1;
    }
  }

  void perderVida() {
    vidas --;
  }
}
