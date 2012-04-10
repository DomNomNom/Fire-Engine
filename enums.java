enum layer { // listed background - foreground
  background,
  enemy,
  bullet,
  player,
  menu,
  invisible,
}

// States that the game can be in
enum state {
  gameInit,
  menu,
  paused,
  game,
}

// groups that an entity can be in. they are not mutually exclusive.
enum group {
  background,
  game,
  player,
  bullet,
  enemy,
  levelBounds,
  menu,
  pauseMenu,
}
