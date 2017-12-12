import processing.sound.*; 
SoundFile file; 
Amplitude amp;
AudioIn in;
PImage elka;
PImage god;


class Snowflake { //класс снежинок 
float x, y; 
int z; 
Snowflake() { 
z = (int)random(0,8); 
x = random(0,width); 
y = random(-height,0)*z*0.25; 
} 

void fall() { //снежинки 
noStroke(); 
fill(253,255,250,z*20); 
ellipse(x, y, 5,5); 
y += z*0.15 ; 
x += random(-1,1)*(z*0.03); 
} 
} 
Snowflake[] flakes; 

void setup() { 
size(1200,650); 
elka= loadImage ("C:/Users/DNS/Desktop/demoscena/elka.jpg"); //загрузка картинки елки
god= loadImage ("C:/Users/DNS/Desktop/demoscena/2018.png"); // загрузка картинки 2018 
file = new SoundFile (this, "C:/Users/DNS/Desktop/demoscena/mix.mp3"); //добавляем песню в программу
file.play();//воспроизведение музыки 
smooth(); //сглаживание

flakes = new Snowflake[250]; //массив снежинок
for(int i = 0; i < 250; i++) flakes[i] = new Snowflake(); 

amp = new Amplitude(this); //амлитуды
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  
} 
void draw() { 

background(8,37,103);//цвет фона 
fill(255,250,250); //заливка цветом снега на земле
rect(0,550,1200,650); //снег

image (elka, 0, 220, 300, 400);//картинка елки
image (god, 400, 100,500,250);//картинка надписи 2018
for(int i = 0; i < 250; i++) { //для движения снежинок 
flakes[i].fall(); 
if(flakes[i].y > height + 20) flakes[i] = new Snowflake(); 

println(amp.analyze());

  }
} 