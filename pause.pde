void paused() {
  if (pause) {
    background(25);

    if (!(mouseX > width - bord & mouseY < bord * 2)) {
      fpsTrhee++;

      if (fpsTrhee >= 10) {
        if (!slowStart) {
          start = true;
        }
        pause = false;
        fpsTrhee = 0;
      }
    } else if (!set) {
      fpsTrhee = 0;
    }
  }

  if (mousePressed & mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2) {
    if (pause) {
      fill(100, 100, 100, 255);
    } else {
      fill(155, 155, 155, 255);
    }
  } else if (mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2) {
    Xini = 0;
    Yini = 0;

    if (pause) {
      pause = false;
      if (!slowStart) {
        start = true;
      }
      block[0].rota = false;

      if (music) {
        sound.play();
      }
    } else {
      if (sound.isPlaying()) {
        sound.pause();
      }
      pause = true;
      start = false;
      block[0].rota = false;
    }
  } else {
    if (pause) {
      fill (155, 155, 155, 225);
    } else {
      fill (225, 225, 225, 225);
    }
  }

  rect(width - (bord / 8) * 7, bord / 8, bord / 4, bord);
  rect(width - (bord / 8) * 3, bord / 8, bord / 4, bord);

  if (pause)
  {
    fill (155, 155, 155, 225);
    textAlign(CENTER, CENTER);
    text("Pause", width / 2, height / 2);

    if (mousePressed & mouseX < size & mouseY < size & Xini < size & Yini < size)
    {
      fill (225, 225, 225, 225);
    } else if (mouseX < size & mouseY < size & Xini < size & Yini < size)
    {
      Xini = 0;
      Yini = 0;

      start = false;
      slowStart = false;
      pause = false;

      turn = 0;
      frame = 0;
      fps = 0;
      fpsTwo = 0;
      fpsTrhee = 0;
      speedBoosted = false;
      scoreHolder = 100;
      speed = 1;
      menuBlock = new blocks();

      for (int a = 0; a < 4; a++)
      {
        grid[block[0].x[a]][block[0].y[a]] = false;
        colo[block[0].x[a]][block[0].y[a]] = empty;
      }
      block[0].moveBuf(0);
      block[0].move(0);
      for (int a = 0; a < 4; a++)
      {
        grid[block[0].x[a]][block[0].y[a]] = true;
        colo[block[0].x[a]][block[0].y[a]] = block[0].col;
      }

      for (int a = 0; a < X; a++)
      {
        for (int b = 0; b < Y; b++)
        {
          if (!grid[a][b])
          {
            colo[a][b] = empty;
          }
        }
      }
    }

    textAlign(LEFT, TOP);
    text("X", 0, 0);
  }
}
