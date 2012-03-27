enum layer { // listed background - foreground
  enemy,
  bullet,
  player,
  menu,
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
  game,
  player,
  menu,
  pauseMenu,
}
