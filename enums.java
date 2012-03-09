enum layer { // listed background - foreground
  enemy,
  player,
  menu,
}

// States that the game can be in
enum state {
  menu,
  paused,
  game,
}

// groups that an entity can be in. they are not mutually exclusive.
enum group {
  game,
  menu,
  pauseMenu,
}
