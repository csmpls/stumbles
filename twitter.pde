Twitter configTwitter() {

  cb = new ConfigurationBuilder();

  //oAuth
  cb.setOAuthConsumerKey("jyx8GCkaQgP3ABxSfayBQ");
  cb.setOAuthConsumerSecret("WrPggFPFVcLfeyOr7NJLKU3exQI1CQhn9IbzDKWRxvk");
  cb.setOAuthAccessToken("612170622-plpOqiKLbr07Zcf0Y01p2tFHFOIQFFgWN6XgKCt6");
  cb.setOAuthAccessTokenSecret("QQKlekyjGhFyYty5RdnIbMZv15qkARlJljxrKDUo");

  return new TwitterFactory(cb.build()).getInstance();
}

void makeQuery(com.modestmaps.geo.Location clickCoordinates) {
  Twitter twitter = configTwitter();
  //HashMap<Long, Tweet> tweets=new HashMap<Long, Tweet>();
  
  Query query = new Query("");
  query.setRpp(100); // how many tweets per page?

  GeoLocation loc = new GeoLocation((double)clickCoordinates.lat, (double)clickCoordinates.lon);
  query.geoCode(loc, 1, "km");

  query.resultType("MIXED");
  //Date referenceDate=new Date();
  //String d=new SimpleDateFormat("yyyy-MM-dd").format(referenceDate);
  //query.until(d);

  try {
    QueryResult result = twitter.search(query);

    for (Tweet tweet : result.getTweets()) {
      if (tweets.get(tweet.getId())==null) { // first check if ID is unique? 
        GeoLocation ll=tweet.getGeoLocation(); // filter out tweets wo GPS
        if (ll!=null) { 
          println("adding tweet: "+tweet.getText());
          GeoLocation lll=tweet.getGeoLocation();
          Dot dot = new Dot((float)lll.getLongitude(), (float)lll.getLatitude(), tweet.getText());
          tweets.put(tweet.getId(), dot);
        }
      } 
      else {
        println("skipping: "+tweet.getId());
      }
    }
  } 
  catch(TwitterException te) {
    println(te.getMessage());
  }
}
