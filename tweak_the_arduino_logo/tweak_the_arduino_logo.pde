import processing.serial.*;
/**
 * Using serial communication, control a program on the computer
 * using the Arduino
 */
 
Serial myPort;

PImage logo;
int bgcolor = 0;
final String arduinoLogoURL = "https://www.arduino.cc/arduino_logo.png";
final String arduinoPort = "COM3";

void setup() {
  colorMode(HSB, 255);
  
  logo = loadImage(arduinoLogoURL);
  size(288, 198);
  
  myPort = new Serial(this, arduinoPort, 9600);
}

void draw() {
  if( myPort.available() > 0 ) {
    bgcolor = myPort.read();
    println(bgcolor);
  }
  background(bgcolor, 255, 255);
  image(logo, 0, 0);
}