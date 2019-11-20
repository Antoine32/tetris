void draw() {
  if (dark) {
    background(0);
  } else {
    background(50);
  }

  if (!pause & music & !sound.isPlaying()) {
    sound.play();
  }

  if (naming) {
    fill(225, 225, 225);
    rect(width / 2 - (((size / 4) * 2.4) * (name.length())) / 2, height / 2 + size * 0.5, ((size / 4) * 2.4) * (name.length()), size / 5);

    textAlign(CENTER, CENTER);
    text("Name yourself", width / 2, height / 2 - size * 1.5);
    text(name, width / 2, height / 2);
  } else {
    if (start) {      
      if (score >= scoreHolder * 5) {
        scoreHolder = score;
        speed++;
      }

      frame++;

      moving();
    }

    for (int a = 0; a < X; a++) {
      for (int b = 2; b < Y; b++) {
        fill(colo[a][b]);

        rect(a * size, (b - 2) * size, size, size);
      }
    }

    for (int a = 1; a < buf + 1; a++) {
      for (int b = 0; b < 4; b++) {
        fill(block[a].col);
        rect(width - bord + ((block[a].x[b] + 0.5) * bufS), ((a - 0.5) * (size * 1.5)) + block[a].y[b] * bufS + topBord, bufS, bufS);
      }
    }

    fill(255, 255, 255);
    textAlign(CENTER, TOP);

    String abc = "";
    abc += score;
    char[] ab = abc.toCharArray();

    for (int a = 0; a < abc.length(); a++) {
      text(ab[a], width - bord / 2, size * 5 + size * a + topBord);
    }

    fill(155, 25, 25);
    if (score > 0 & start) {
      rect(width - bord, height - bord, bord / ((scoreHolder * 5) / score), bord);
    }

    textAlign(CENTER, CENTER);
    fill(255, 230, 230);
    text(speed, width - bord / 2, height - bord / 1.8);

    mousy();

    if (set) {
      setIt();
    } else if (slowStart & !pause) {
      slow();
    } else if (!start & !pause) {
      menu();
    }

    if (slowStart || start || pause) {
      paused();
    }
  }
}
