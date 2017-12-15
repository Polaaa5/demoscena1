import processing.sound.*;
import gifAnimation.*;
SoundFile file;
Amplitude amp;
AudioIn in ;
PImage elka;
PImage god;
PImage dedmoroz;


class Snowflake { //класс снежинок 
    float x, y;
    int z;
    Snowflake() {
        z = (int) random(0, 8);
        x = random(0, width);
        y = random(-height, 0) * z * 0.25;
    }

    void fall() { //снежинки 
        noStroke();
        fill(253, 255, 250, z * 20);
        ellipse(x, y, 5, 5);
        y += z * 0.15;
        x += random(-1, 1) * (z * 0.03);
    }
}
Snowflake[] flakes;

NewBall[] k_array;

void setup() {
    size(1200, 650);
    elka = loadImage("C:/processing projects/demoscena1/demoscena1/elka.png"); //загрузка картинки елки 
    god = loadImage("C:/processing projects/demoscena1/demoscena1/2018.png"); // загрузка картинки 2018 
    dedmoroz = loadImage("C:/processing projects/demoscena1/demoscena1/dedmoroz.png"); //картинка дед мороза 

    file = new SoundFile(this, "C:/processing projects/demoscena1/demoscena1/mix.mp3"); //добавляем песню в программу 
    file.play(); //воспроизведение музыки 
    smooth(); //сглаживание 

    flakes = new Snowflake[250]; //массив снежинок 
    for (int i = 0; i < 250; i++) flakes[i] = new Snowflake();

    amp = new Amplitude(this); //амлитуды 
    in = new AudioIn(this, 0); in .start();
    amp.input( in );

    k_array = new NewBall[10];
    for (int i = 0; i < 10; i++) {
        k_array[i] = new NewBall(random(width), random(height), 100.0, color(random(255), random(255), random(255)));
    }

    frameRate(24);


}
void draw() {

    background(8, 37, 103); //цвет фона 
    fill(255, 250, 250); //заливка цветом снега на земле 
    rect(0, 550, 1200, 650); //снег 

    image(elka, 0, 140, 350, 500); //картинка елки 
    image(god, 330, 80, 500, 250); //картинка надписи 2018 
    image(dedmoroz, 900, 220, 250, 350);



    fill(255, 255, 25);
    pushMatrix();
    translate(width * 0.9, height * 0.15);
    rotate(frameCount / -50.0);
    star(10, 0, (30 + amp.analyze() * 180), 70, 5);
    popMatrix();
    for (int i = 0; i < 250; i++) { //для движения снежинок 
        flakes[i].fall();
        if (flakes[i].y > height + 30) flakes[i] = new Snowflake();

        fill(0, 191, 255);
        ellipse(380, 130, amp.analyze() * 400, amp.analyze() * 400);

        fill(255, 255, 0);
        ellipse(400, 200, amp.analyze() * 400, amp.analyze() * 400);

        fill(255);
        ellipse(550, 190, amp.analyze() * 400, amp.analyze() * 400);

        fill(245, 245, 245);
        ellipse(400, 265, amp.analyze() * 400, amp.analyze() * 400);

        fill(230, 230, 250);
        ellipse(500, 250, amp.analyze() * 400, amp.analyze() * 400);

        fill(255, 105, 180);
        ellipse(510, 150, amp.analyze() * 400, amp.analyze() * 400);

        fill(0, 255, 255);
        ellipse(610, 150, amp.analyze() * 400, amp.analyze() * 400);

        fill(0, 255, 0);
        ellipse(655, 180, amp.analyze() * 400, amp.analyze() * 400);

        fill(255, 69, 0);
        ellipse(630, 250, amp.analyze() * 400, amp.analyze() * 400);

        fill(32, 178, 170);
        ellipse(730, 150, amp.analyze() * 400, amp.analyze() * 400);

        fill(32, 178, 170);
        ellipse(730, 150, amp.analyze() * 400, amp.analyze() * 400);

        fill(250, 235, 215);
        ellipse(750, 200, amp.analyze() * 400, amp.analyze() * 400);

        fill(250, 235, 215);
        ellipse(750, 200, amp.analyze() * 400, amp.analyze() * 400);

        fill(255, 20, 147);
        ellipse(760, 290, amp.analyze() * 400, amp.analyze() * 400);



    }
}
void star(float x, float y, float radius1, float radius2, int npoints) { //задаем движение звезде 
    float angle = TWO_PI / npoints;
    float halfAngle = angle / 2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
        float sx = x + cos(a) * radius2;
        float sy = y + sin(a) * radius2;
        vertex(sx, sy);
        sx = x + cos(a + halfAngle) * radius1;
        sy = y + sin(a + halfAngle) * radius1;
        vertex(sx, sy);
    }
    endShape(CLOSE);
}

class Ball {
    float x, y, s;
    Ball(float _x, float _y, float _s) {
        this.x = _x;
        this.y = _y;
        this.s = _s;
    }
    void right(float _s) {
        this.x += _s;
    }
}

class NewBall extends Ball {
    color c;
    NewBall(float _x, float _y, float _s, color _c) {
        super(_x,
            _y, _s);
        this.c = _c;
    }
    void draw() {
        rect(this.x, this.y, this.s,
            this.s);
        fill(this.c);
    }
}