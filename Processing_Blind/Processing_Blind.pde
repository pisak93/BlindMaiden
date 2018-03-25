import processing.sound.*;
import processing.serial.*;


float delayScreamer;


PImage fondo, fondoHombre, img1, img2, img3, img4, img5,img6, img7, img8, img9, img10, end;
PImage img[];
Serial port;
float imgX[];
float imgY[];
PFont blind;
float e =0;
float delay=0;

float delayPiso=0;

float delayPasos=0;
float delayPuerta=0;
float delayRespiracion=0;
float delayCantando=0;
float delayHablando=0;
float delayGemido=0;
float delayFantasma=0;
float delayCancion=0;



boolean playingPasos = false;
boolean playingPuerta = false;
boolean playingRespiracion = false;
boolean playingCantando = false;
boolean playingHablando = false;
boolean playingGemido = false;
boolean playingFantasma = false;
boolean playingCancion = false;

boolean gritoBool = false;


boolean playingPiso = false;
boolean scrolling=false;
SoundFile pasos, puerta, respiracion, cantando, hablando, gemido, fantasma, cancion, piso, grito;
int posY=300;
int translateY=0;

float proximidad = 0;





void setup(){
  String portName = Serial.list()[3];
  port= new Serial(this, portName, 9600);
  fullScreen();
  
    img = new PImage[10]; 
    imgX = new float[10];
    imgY = new float[10]; 
    
    for(int i=0; i<10;i++){
    int f=i+1;
    String imag="img-"+f+".jpg";
    println(imag);
    img[i] = loadImage(imag);
    imgX[i] = random(10,800);
    imgY[i] = random(200,3200);
  }
  end= loadImage("end.png");
    pasos= new SoundFile(this,"FootSteps.mp3");
    puerta= new SoundFile(this,"Puerta.mp3");
    respiracion= new SoundFile(this,"Respiracion_Palpitos.mp3");
    cantando= new SoundFile(this,"CreepyGirlSing.mp3");
    hablando= new SoundFile(this,"LittleGirl.mp3");
    gemido= new SoundFile(this,"Gemido.mp3");
    fantasma= new SoundFile(this,"Voces_Fantasma.mp3");
    cancion= new SoundFile(this,"Cancion.mp3");
    piso= new SoundFile(this,"Paso.mp3");
    grito= new SoundFile(this,"Grito.mp3");
    
  
  fondo = loadImage("Fondo-blind.png");
  
  fondoHombre = loadImage("fondo-hombre.jpg");
  blind = loadFont("BurnTheWitch-100.vlw");

}
void serialEvent(Serial port){
  int inByte = port.read();
  proximidad=inByte;
  println(proximidad);
}

void mouseWheel(MouseEvent event) {
  scrolling = true;
  e = event.getCount();
  println(e);
}

void draw(){
  
  if(delayScreamer<1500){
  background(fondoHombre);
  if(!scrolling){
    e=0;
  }
  translateY-=(e*3.5);
  if(translateY>=0){
    translateY=0;
  }
  
  pushMatrix();
translate(0, translateY);
noStroke();
  fill(255,0,0);
  textFont(blind);
  textSize(150);
  text("BlindMaiden.com",70,posY);
  image(img[0],imgX[0],imgY[0]);
  image(img[1],imgX[1],imgY[1]);
  image(img[2],imgX[2],imgY[2]);
  image(img[3],imgX[3],imgY[3]);
  image(img[4],imgX[4],imgY[4]);
  image(img[5],imgX[5],imgY[5]);
  image(img[6],imgX[6],imgY[6]);
  image(img[7],imgX[7],imgY[7]);
  image(img[8],imgX[8],imgY[8]);
  image(img[9],imgX[9],imgY[9]);
 
   int i = int(random(0,8));
  if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingPasos){
      pasos.play();
    playingPasos=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingPuerta){
      puerta.play();
    playingPuerta=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingCantando){
      cantando.play();
    playingCantando=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingHablando){
      hablando.play();
    playingHablando=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingRespiracion){
      respiracion.play();
    playingRespiracion=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingGemido){
      gemido.play();
    playingGemido=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingFantasma){
      fantasma.play();
    playingFantasma=true;
    i = int(random(0,8));
    }
    else if(mouseX>imgX[i] && mouseX<imgX[i]+img[i].width && mouseY>imgY[i] && mouseY<imgY[i]+img[i].height && !playingCancion){
      cancion.play();
    playingCancion=true;
    i = int(random(0,8));
    }
    
  
  if(delayPasos>=30000){
    pasos.stop();
     playingPasos = false;

    delayPasos=0;
  }
  if(playingPasos){
 delayPasos++;
  }
  
  if(delayPuerta>=30000){
    puerta.stop();
  
playingPuerta = false;

    delayPuerta=0;
  }
  if(playingPuerta){
 delayPuerta++;
  }
  
  if(delayRespiracion>=30000){
    respiracion.stop();
  
playingRespiracion = false;

    delayRespiracion=0;
  }
  if(playingRespiracion){
 delayRespiracion++;
  }
  
  if(delayCantando>=30000){
    cantando.stop();
     
playingCantando = false;

    delayCantando=0;
  }
  if(playingCantando){
 delayCantando++;
  }
  
  if(delayHablando>=30000){
    hablando.stop();
playingHablando = false;

    delayHablando=0;
  }
  if(playingHablando){
 delayHablando++;
  }
  
  if(delayGemido>=30000){
    gemido.stop();
 
playingGemido = false;

    delayGemido=0;
  }
  if(playingGemido){
 delayGemido++;
  }
  
  if(delayFantasma>=30000){
    fantasma.stop();
     
playingFantasma = false;

    delayFantasma=0;
  }
  if(playingFantasma){
 delayFantasma++;
  }
  
  if(delayCancion>=30000){
    cancion.stop();
     
playingCancion = false;
    delayCancion=0;
  }
  if(playingCancion){
 delayCancion++;
  }
 
  
popMatrix();
  
  scrolling = false;
  image(fondo,0,0);
  
  if(proximidad <= 30 && !playingPiso){
    piso.play();
    playingPiso=true;
    }
   
  else if(delayPiso>=20000){
    piso.stop();
    playingPiso = false;
    delayPiso=0;
  }  
  if(playingPiso){
    delayPiso++;
  }
  
  delayScreamer++;
  println(delayScreamer);
  }
  
  
  else if(delayScreamer>=1500){
    background(0);
    image(end,300,200);
    grito.play();
    delayScreamer++;
    
  }
 
  else if(delayScreamer>=1700){
  background(0);
  grito.stop();
  }
  
}