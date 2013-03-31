void mouseClicked() {
  com.modestmaps.geo.Location location = map.pointLocation(mouseX, mouseY);
  println(location);
  makeQuery(location);
}
