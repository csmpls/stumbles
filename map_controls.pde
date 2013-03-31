//------------------------
// MODEST KEY CONTROLS
//------------------------

// see if we're over any buttons, otherwise tell the map to drag
void mouseDragged() {
  map.mouseDragged();
}

// zoom in or out:
void mouseWheel(int delta) {
  if (delta > 0) {
    map.sc *= 1.05;
  }
  else if (delta < 0) {
    map.sc *= 1.0/1.05;
  }
}

