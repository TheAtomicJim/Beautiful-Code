import processing.sound.*;
SoundFile song;

void setup()
{
  size(500, 500);
  
  for (int i = 0; i < numLeaves; i ++)
  {
    lx[i] = random(0, width);
    ly[i] = random(0, height);
    lspeed[i] = random(1, 3);
    lSize[i] = random(5, 8);
    
    song = new SoundFile(this, "bg music relaxing.mp3");
  }
}

int numLeaves = 200;
float[] lx = new float[numLeaves];
float[] ly = new float[numLeaves];
float[] lspeed = new float[numLeaves];
float[] lSize = new float[numLeaves];

void draw()
{
  noStroke();
  //sky background
  background(249, 226, 162);
  fill(255, 214, 153);
  rect(0, 100, 500, 500);
  fill(255, 205, 144);
  rect(0, 230, 500, 500);

  //land
  fill(255, 255, 153);
  ellipse(400, 50, 60, 60);
  line(82,400,418,400);
  fill(46, 75, 15);
  triangle(0, 375, 250, 450, 0, 500);
  triangle(500, 375, 250, 450, 500, 500);
  fill(43, 68, 13);
  triangle(0, 395, 225, 450, 0, 490);
  triangle(500, 395, 275, 450, 500, 490);
  fill(38, 55, 10);
  triangle(0, 410, 160, 450, 0, 475);
  triangle(500, 410, 340, 450, 500, 475);

  //sea
  fill(115, 216, 233);
  triangle(0, 500, 500, 500, 250, 450);
  fill(108, 201, 235);
  triangle(50, 500, 450, 500, 250, 456);
  fill(131, 222, 245);
  triangle(82, 400, 418, 400, 250, 450);
  fill(153, 255, 255);
  quad(263,400, 255,400, 228,442, 246,449);
  fill(80);
  //arc(260,420,269,420,degrees(180),degrees(180));
  
  //person
  fill(50,40,8);
  ellipse(430,378,6,7);
  triangle(430,379,423,402,437,402);
  triangle(431,378,428,390,423,386);
  triangle(430,379,433,390,438,385);
  triangle(430,379,437,376,423,376);
  
  //grave
  fill(142,103,51);
  quad(450,401, 442,400, 452,392, 459,392);
  fill(80,30,30);
  rect(450,386,10,5);
  rect(452,377,6,9);
  
  //Leaves Falling
  fill(255,210,235);
  for (int i = 0; i < numLeaves; i ++)
  {
    ellipse(lx[i], ly[i], lSize[i], lSize[i]);
    ly[i] += lspeed[i];
    if (ly[i] > height)
    {
      lx[i] = random(0, width);
      ly[i] = 0;
      lspeed[i] = random(1, 3);
      lSize[i] = random(5, 18);
    }
  }
  
  //Text
  fill(23,58,154);
  text("Press Any Key to restart music",83,495);
  text("",360,495);
  
  //cursor
  stroke(215,251,253);
  noFill();
  circle(mouseX,mouseY,20);
}

void mousePressed()
{
   //cursor
  stroke(215,251,253);
  noFill();
  circle(mouseX,mouseY,20);
}

void keyPressed()
{
  song.loop();
}
