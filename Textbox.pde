class Textbox {
  String comment;

  boolean active = false;
  int padding = 10;
  int box_width = 360;
  int box_height = 60;
  
  Textbox(String t) {
    comment = t;
  }
  
  void draw(float xpos, float ypos) {
    //just popping up for the first time?
    if (!boxUp && !active) {
      if (mouseOver(xpos, ypos)) {
        active = true;
        boxUp = true;
       }
     }
     //already active?
    if (active) {
      if (mouseOver(xpos, ypos)) {
        drawRectAndText(xpos - (box_width / 2), ypos - box_height - 20);
      } else { 
        active = false;
        boxUp = false;
      }
    }
    
 }
 
 void drawRectAndText(float x, float y) {
   fill(255, 220);
   rect(x, y, box_width, box_height);  
   fill(0);
   text(comment, x + padding, y + padding, box_width - 4*padding, box_height - 2*padding);
 }
 
 boolean mouseOver(float x, float y) {
   boolean isOver = false;
    if (mouseX > x - 10 && mouseX < x + 10) {
      if (mouseY > y - 10 && mouseY < y + 10) {
        isOver = true;
      } 
    } return isOver;
  }
    
}
