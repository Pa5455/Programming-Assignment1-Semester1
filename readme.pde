/*

Name : Patrick Curran

Student Number: 05517834

<<<Summary of instructions>>>
Enter Name as name for company name on Tractor eg WIT 390
loader down: press and hold mouse button left
loader up: press and hold mouse button right
bucket dump: press and hold keyboard 'd'
bucket curl: press and hold keyboard 'f'
auto retun to level: press keyboard g or G once

<<Background>>>
As I am from farming background with degree in agricultural engineering I was naturally going to draw a tractor!  

I have worked in design of hydraulic systems in construction machinery and witnessed the advance of software control in machinery, I wanted to make an animation based on this. 

One feature is self -levelling function of a loader, for example a bucket or set of pallet forks. 

Without self-levelling is dangerous as the load you are carrying could tip back onto the cab as the operator is lifting the loader arm (lift- arm as I may have referred to it in the code). 

My animation is called the Massey Ferguson self-levelling loader simulator! Which is used to demonstrate to customers the self-levelling feature. 

The customer has the choice to put their own company name on the machine.This is how I achieved meaningful sting methods manipulating the text input (Format of machine branding would be a marketing requirement.

The tractor consists of a Cab, Bonnet, steps, air intake grill, flashing beacon light, loader lift arm, bucket attached to loader lift arm. In the top left of the screen is a display console as what would be displayed in the cab if customer was sitting inside it.






<<<<The animation more detail>>>
Press the play button, enter a name, press OK and then Ok to enter the animation. Notice on the bonnet your name is now in capital letters, trimmed and limited in length to less than 18 characters.

Press the left mouse button to lift the loader arm, notice the bucket stays level
Lift the loader all the was up by holding the left mouse button. Notice that as approach max height an orange warning text appears in the display console top left of screen. When at max height, notice max height warning displayed in the  console top right.

Press mouse right to lower the loader lift arm, and notice that the warnings go away as move out of near max height region, also notice that the bucket is still level.

Press d on keyboard, notice that the bucket dumps and also in the display console in top left of screen the bucket angle is displayed in degrees. Also a red text warning reminds you that the bucket is no longer level.

Press g or G on keyboard and notice that the bucket returns automatically to level, this is a handy feature for returning to dig area after dumping a bucket.

Press f on keyboard to curl up buck 9for filling). Again a red warning is displayed in display console to tell you that the bucket is not level. Bucket angle is also displayed


<<How i got there>>

Main fucntion of the lift arm using rotate and translate functions, played around with thsi untill I had a working lift, then put in the basic shapes, uses whiel and for loops with nexted for to draw some features.
String methods used via teh JoptionPane and using teh methods to manipulate the inpout data. 
Many bepoke methods used to keep the draw() area as clear as possible

<<<Bugs>>>

Some minor bug, in the display console at top left of screen, when lifting the loader and at max height, the error message does not diplay untill mouse button is released. For the purposed of this assignement I am ignoring this

the auto return to bucket level, pressing G or g is a bit digital, i wold like to make it a smooth motion so that it does not snap back to level.


References to code I studied outside of lecture notes:
line 53 refernece to random colour fill https://stackoverflow.com/questions/37369978/how-to-randomize-between-two-set-colors
Line 64 reference to .lenghth string method https://processing.org/reference/String_length_.html
Line 63 reference to .trim string method https://processing.org/reference/trim_.html
line 62 refernece to .toUppercase string method https://www.processing.org/reference/String_toUpperCase_.html
line 65 reference to .substring string method and cutting the characters https://www.w3schools.com/jsref/jsref_substr.asp
line 53 reference to random fill colour 
lines 124,125,132,133,134 :reference to translate and rotate https://processing.org/tutorials/transform2d/  Case study: An arm-waving robot and also from the book "Getting Started with Processing A hands-On Introduction to making Interactive Graphics, Casey Reas & Ben Fry, Second Edition, maker media 2015. Page 173 Example 6-7: An Articulating Arm. 
line 123,131, constrain  https://processing.org/reference/constrain_.html
line 167 to 162 keyPressed and key, reference https://processing.org/reference/key.html













































*/
