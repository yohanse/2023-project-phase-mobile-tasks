abstract class Event {}

class NextEvent extends Event {}

class LikeEvent extends Event {}


abstract class PageEvent{}

class WordViewPage extends PageEvent{}

class FavouriteViewPage extends PageEvent{}