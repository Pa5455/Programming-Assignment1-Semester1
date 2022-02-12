float angle = 0;                         //floats used for loader and bucket arm angles
float angle2 = 0;                        
float angle3 = 0; 
float liftarmSpeed = 0.009;              //lift arm and bucket speed set, incrementing radians
float bucketSpeed = 0.03; 
String good = "Bucket is Level"; 
String bad = "Bucket is not Level, press g on keyboard to level bucket"; // string messages to demonstrate safety messages on console in cab
String near = "Loader near max height"; 
String max = "Loader Max Height"; 
import javax.swing.*;                   // using to bring option to name the tractor, way to use string methods meaningfully
String  tractorName;                    // global variable created from the user (slack discussion ref Peter Wndle thread on JOptionPane)


void setup() {
  size(1100, 815);
  textSize(15);
  frameRate(60);
  noCursor();

  tractorName = JOptionPane.showInputDialog(null, "Tractor Name (less than 18 chars:");
  JOptionPane.showMessageDialog(null, "Your text is: "+tractorName);
}


/* In the draw() I have made many bespoke methods, I could have put teh drawbonnet() and drawCab into one method as they are both rectangles,
 however I chose not to incase I wanted to add a driver or other details into eith the bonnet or cab. Drae setps and draw grill are on their own also
 because i was using for and while loops in there. I also put the 'controils on thier own also becasde of some maths complexity that could go wrong if
 the code is changed in teh future.
 I also aimed to keep the draw function clean and using bespoke methods was agod way of doing this, plus I could move stuff around easier,
 so that I coudl fraw over items easily, such as the bonnet is behine teh text and the wheel appear over the bonnt ect.*/


void draw() {

  background(205);
  limitWarnings(); 
  Float degrees = radToDeg(angle2);
  text("Angle of bucket is "+degrees, 50, 100);
  flasher();                               // flashing beacon light ontop of cab
  drawCab();                               //cab,bonnet,steps are all part of tractor body
  drawBonnet();
  drawtext();
  drawSteps(); 
  drawGrill();
  wheels(310, 660, 300, 0); //back wheel       {weeels drawn as method with parameters, can use this to alter wheel base or size in future}
  wheels(620, 710, 200, 0); // front wheel
  linkageLift();                            //linkageLift method used create the lift arm and set postion and angles contraints 
  linkageBucket();                          //lingafeBUcket method used to create the bucket and constrain the angles
  control();                                //control is used to set the mouse and keyboard controls
}

void flasher() {
  fill(random(150,255),255,0);              //flashing random light, tried to make a flicker bright to dark yellow
  rect(460, 250, -20, 80);
}




void drawtext() {                            // use of 3 string methods

  String x = tractorName.toUpperCase(); 
  String y = trim(x);                        // trim out any space at beginning and end
  if (y.length() > 17) {
    String name = y.substring(0, 17);         //chop off after 18 characters
    fill(190);
    strokeWeight(3);
    rect(500, 530, 225, 20);
    fill(0);
    text(name, 530, 545);
  } else {                                   //use the else statement to avoid error if bname entered is less than 5 chars!)
    fill(190);
    strokeWeight(3);
    rect(500, 530, 225, 20);
    fill(0);
    text(y, 530, 545);
  }
}

float radToDeg(float val) {              //Bespoke method to take in parameter and return the conversion of radians to degrees, display angle of bucket
  fill(0, 0, 200);
  val = val * 57.32;
  return val;
}

void drawCab() {
  fill(255);
  rect(480, 280, -300, 375);
}
void drawSteps() {
  strokeWeight(2);
  line(460, 655, 460, 695);
  line(480, 655, 480, 695);
  int step = 665;
  while (step < 695)  //while loop
  {
    line(460, step, 480, step);
    step += 10;
  }
}
void drawGrill() {
  fill(100);

  for (int i = 680; i < 730; i += 5) {      //for loop with a nested for loop
    for (int j = 550; j < 620; j += 5) {
      fill(0);
      point(i, j);
    }
  }
}
void drawBonnet() {
  fill(255, 0, 0);
  rect(480, 480, 250, 175);
}


void wheels(int x, int y, int dia, int colour) {
  fill(colour);
  ellipse(x, y, dia, dia);
}

void linkageLift() {
  angle = constrain(angle, -1.1, 0.42);
  translate(510, 500);
  rotate(angle*1);
  strokeWeight(50);
  line(0, 0, 350, 0);
}

void linkageBucket() {  
  angle2 = constrain(angle2, -0.7, 1.08); 
  translate(370, 0);
  rotate(angle*-1);                          //self level function, bucket rotates opposite in oposite direction to lift, maintaining level to start position
  rotate(angle2);                            //created rotate angle2 for the dump and curl commands of bucket, able to set speed separate to liftspeed.
  strokeWeight(5);
  fill(150);
  rect(0, -50, 100, 100);
}
void limitWarnings() {                                  //warning functions such as max height when loader reaches max height,buck level ect.
  fill(220);
  rect(20, 30, 450, 80);    
  if (angle2 == 0) {                                     //if statement with branches
    fill(0);
    text(good, 50, 50);                                    //calling string good
  } else {
    fill(255, 0, 0);
    text(bad, 50, 50);                                     // calling string bad
  }
  if ((angle > -1) && (angle < -0.8)) {
    fill(255, 165, 0);
    text(near, 50, 75);                                    // calling string near
  } else if (angle == -1.1) {
    fill(255, 0, 0);
    text(max, 50, 75);                                     // calling string max
  }
}

/*Control fucntion below used mouse left to lift the loader and mouse right to lower the loader, teh speed can be changed in the gloabal variables.
 for bucket dump and curl I used the keypressed command and some keys accordingly to control teh bucket angle. alos included is a return to level fucntion
 by pressing G or g on the keyboard to demonstarte an autolevel feature of teh Tractor, usefull if dumping a bucket of stones into trailor and want to quickly return 
 bucket back to level again*/
void control() {   
  if ((mousePressed) && (mouseButton == LEFT) )
    angle += liftarmSpeed; // lift the loader at speed defined in line 3 (incrementing the angle)  if statements with nested if and also branches
  else if ((mousePressed) && (mouseButton == RIGHT))
    angle -= liftarmSpeed;// lower the loader at speed defined in line 3 (incrementing the angle)
  if (keyPressed) 
    if (key == 'd')
      angle2 += bucketSpeed;
    else if (key =='f')
      angle2 -= bucketSpeed;
    else if ((key == 'g') || (key == 'G'))  //just in case caps lock is on, less things for user to worry about
      angle2 = 0;
}
