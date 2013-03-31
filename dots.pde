public class Dot {
  float lat;
  float lon;
  Point2f self;
  Textbox textbox;

  Dot(float latitude, float longitude, String ss) {
    lat  = latitude;
    lon = longitude;
    self = map.locationPoint(new com.modestmaps.geo.Location(lon, lat));
    textbox = new Textbox(ss);
  }

  void draw() {
    Point2f self = map.locationPoint(new com.modestmaps.geo.Location(lon, lat));
    fill(240, 10, 12);
    ellipse(self.x, self.y, 5, 5);
    textbox.draw(self.x, self.y);
  }

}






