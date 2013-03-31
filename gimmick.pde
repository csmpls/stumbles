import java.util.Vector;
import java.util.List;
import java.io.Serializable;
import com.modestmaps.*;
import com.modestmaps.core.*;
import com.modestmaps.geo.*;
import com.modestmaps.providers.*;


//
// This is a test of the interactive Modest Maps library for Processing
// the modestmaps.jar in the code folder of this sketch might not be 
// entirely up to date - you have been warned!
//

// modest mpas
InteractiveMap map;
float _lat = 34.040571;
float _long = -118.560363;

// twitter
ConfigurationBuilder cb;
HashMap<Long, Dot> tweets=new HashMap<Long, Dot>();

//UI stuff
PFont font;
boolean boxUp = false;

void setup() {
  size(1280, 1024);
  noStroke();
  smooth();

  // create a new map, optionally specify a provider
  map = new InteractiveMap(this, new Microsoft.HybridProvider());
  // others would be "new Microsoft.HybridProvider()" or "new Microsoft.AerialProvider()"
  // the Google ones get blocked after a few hundred tiles
  // the Yahoo ones look terrible because they're not 256px squares :)

  // set the initial location and zoom level to London:
  map.setCenterZoom(new com.modestmaps.geo.Location(_lat, _long), 19);
  // zoom 0 is the whole world, 19 is street level
  // (try some out, or use getlatlon.com to search for more)

  // enable the mouse wheel, for zooming
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
}

void draw() {
  background(0);

  // draw the map:
  map.draw();
  // (that's it! really... everything else is interactions now)

  smooth();

  // THIS IS WHERE SPOT DRAWING WOULD GO

    for (Dot dot : tweets.values()) {
      dot.draw();
    }
    



  //  ——————————————————————————————————
  //   - - - 
  //  TESTING BLOCK
  //   - - -
  //  
  //VISUAL FILTER
  drawMapFilter();
  //  println((float)map.sc);
  //  println((float)map.tx + " " + (float)map.ty);
  //  println();
  //  ——————————————————————————————————
}

