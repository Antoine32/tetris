void menu() {
  //background(25, 25, 25, 175);
  fill(25, 25, 25, 175);
  rect(0, 0, width, height);

  textAlign(CENTER, CENTER);
  textFont(font);
  fill (225, 225, 225, 225);

  text("Click to start", (width - bord) / 2, (height / 8) * 3);
  text("Score:" + score, (width - bord) / 2, (height / 8) * 5);
  text("Best Score:" + bestScore, (width - bord) / 2, (height / 8) * 7 - size * 0.5);
  text("By " + name, (width - bord) / 2, (height / 8) * 7 + size * 0.5);

  if (mousePressed & mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2)
  {
    fill(155, 155, 155, 255);
  } else if (mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2)
  {
    set = true;
    Xini = 0;
    Yini = 0;
  }

  ellipse(width - bord / 2, (bord / 4) * 1, bord / 4, bord / 4);
  ellipse(width - bord / 2, (bord / 4) * 3, bord / 4, bord / 4);
  ellipse(width - bord / 2, (bord / 4) * 5, bord / 4, bord / 4);

  boolean change = false;

  int r = 255;
  int g = 255;
  int b = 255;
  int ajustement = 0;
  if (menuBlock.type == 1)
  {
    ajustement = -1;
    r -= 19;
    g -= 240;
    b -= 237;
  } else if (menuBlock.type == 2)
  {
    ajustement = 1;
    r -= 237;
    g -= 240;
    b -= 19;
  } else if (menuBlock.type == 3)
  {
    ajustement = 0;
    r -= 206;
    g -= 19;
    b -= 240;
  } else if (menuBlock.type == 4)
  {
    ajustement = 0;
    r -= 246;
    g -= 166;
    b -= 11;
  } else if (menuBlock.type == 5)
  {
    ajustement = 0;
    r -= 19;
    g -= 240;
    b -= 237;
  } else if (menuBlock.type == 6)
  {
    ajustement = 1;
    r -= 230;
    g -= 19;
    b -= 19;
  } else if (menuBlock.type == 7)
  {
    ajustement = -1;
    r -= 19;
    g -= 230;
    b -= 19;
  }

  fill(menuBlock.col);
  for (int a = 0; a < 4; a++)
  {
    if (mousePressed & mouseX > (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) & mouseX < (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) + size * 2 & mouseY > (size * 2) * (menuBlock.y[a]) + size & mouseY < (size * 2) * (menuBlock.y[a]) + size * 3)
    {
      fps = 0;
    } else if (mouseX > (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) & mouseX < (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) + size * 2 & mouseY > (size * 2) * (menuBlock.y[a]) + size & mouseY < (size * 2) * (menuBlock.y[a]) + size * 3 & Xini > (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) & Xini < (size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) + size * 2 & Yini > (size * 2) * (menuBlock.y[a]) + size & Yini < (size * 2) * (menuBlock.y[a]) + size * 3)
    {
      Xini = 0;
      Yini = 0;

      change = true;
    }

    rect((size * 2) * ((X + 1) / 4 + (menuBlock.x[a] - 1)) + (ajustement * size), (size * 2) * (menuBlock.y[a]) + size, (size * 2), (size * 2));
  }

  textAlign(CENTER, CENTER);
  fill(r, g, b, 255);
  text("TETRIS", (size * 2) * ((X + 1) / 4 + (menuBlock.x[0] - 1)) + size, (size * 2) * (menuBlock.y[0]) + size * 2);

  if (change)
  {
    int bufType = menuBlock.type;

    do {
      menuBlock = new blocks();
    } while (bufType == menuBlock.type);
  }
}
