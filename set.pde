void setIt() {
  if (fps >= 480) {
    fps = 0;

    PrintWriter bufabc = createWriter("best.txt");
    bufabc.println("0");
    bufabc.println("");
    bufabc.println("1");
    bufabc.println("1");
    bufabc.println("1");
    bufabc.flush();
    bufabc.close();

    score = 0;
    bestScore = 0;
    name = "";
    ajustX = 1;
    ajustY = 1;
    dark = true;
    gosth = true;
    music = true;

    for (int a = 0; a < X; a++)
    {
      for (int b = 0; b < Y; b++)
      {
        grid[a][b] = false;
        colo[a][b] = empty;
      }
    }

    menuBlock = new blocks();

    background(255);
  } else {
    //background(25, 25, 25, 175);
    fill(25, 25, 25, 175);
    rect(0, 0, width, height);
  }

  if (mousePressed & mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2) {
    fill(155, 155, 155, 255);
  } else if (mouseX > width - bord & mouseY < bord * 2 & Xini > width - bord & Yini < bord * 2) {
    set = false;
    Xini = 0;
    Yini = 0;
  } else {
    fill (225, 225, 225, 225);
  }

  ellipse(width - bord / 2, (bord / 4) * 1, bord / 4, bord / 4);
  ellipse(width - bord / 2, (bord / 4) * 3, bord / 4, bord / 4);
  ellipse(width - bord / 2, (bord / 4) * 5, bord / 4, bord / 4);

  int PosiBuf = 4;

  if (mousePressed & Yini < height / PosiBuf + size / 2 - size * 2 & Yini > height / PosiBuf - size / 2 - size * 2)
  {
    if (mouseX > width - bord)
    {
      ajustX = ((width - bord) / ((size / 4) * 2)) * 0.1;
    } else
    {
      ajustX = (mouseX / ((size / 4) * 2)) * 0.1;
    }

    fill(255, 255, 255, 255);
  } else
  {
    fill(200, 200, 200, 200);
  }

  ajustX = int(ajustX * 10);
  ajustX /= 10;

  rect(0, height / PosiBuf - size / 2 - size * 2, (((width - bord) / 4) * 2) * ajustX, size);

  fill(225, 225, 225, 225);
  textAlign(CENTER, BOTTOM);
  text("X:" + ajustX, (width - bord) / 2, height / PosiBuf - size * 3);

  if (mousePressed & Yini < height / PosiBuf + size / 2 + size * 2 & Yini > height / PosiBuf - size / 2 + size * 2)
  {
    if (mouseX > width - bord)
    {
      ajustY = ((width - bord) / ((size / 4) * 2)) * 0.1;
    } else
    {
      ajustY = (mouseX / ((size / 4) * 2)) * 0.1;
    }

    fill(255, 255, 255, 255);
  } else
  {
    fill(200, 200, 200, 200);
  }

  ajustY = int(ajustY * 10);
  ajustY /= 10;

  rect(0, height / PosiBuf - size / 2 + size * 2, (((width - bord) / 4) * 2) * ajustY, size);

  fill(225, 225, 225, 225);
  textAlign(CENTER, BOTTOM);
  text("Y:" + ajustY, (width - bord) / 2, height / PosiBuf + size);

  ////////////////////////////////////////////////////

  if (mousePressed & mouseX < width - bord - size & mouseX > size & mouseY > height - size * 11 & mouseY < height - size * 9 & Xini < width - bord - size & Xini > size & Yini > height - size * 11 & Yini < height - size * 9)
  {
    fill(200, 200, 200, 255);
  } else if (mouseX < width - bord - size & mouseX > size & mouseY > height - size * 11 & mouseY < height - size * 9 & Xini < width - bord - size & Xini > size & Yini > height - size * 11 & Yini < height - size * 9)
  {
    Xini = 0;
    Yini = 0;

    if (music)
    {
      music = false;
      sound.stop();
    } else
    {
      music = true;
      sound.play();
    }
  } else
  {
    if (music)
    {
      fill(150, 150, 150, 225);
    } else
    {
      fill(100, 100, 100, 225);
    }
  }

  rect(size, height - size * 11, width - bord - size * 2, size * 2);

  fill(255, 255, 255, 225);
  textAlign(CENTER, CENTER);
  text("Music", width - bord - (X / 2) * size, height - size * 10.5);

  if (music)
  {
    text("ON", width - bord - (X / 2) * size, height - size * 9.5);
  } else
  {
    text("OFF", width - bord - (X / 2) * size, height - size * 9.5);
  }

  ////////////////////////////////////////////////////

  if (mousePressed & mouseX < width - bord - size & mouseX > size & mouseY > height - size * 8 & mouseY < height - size * 6 & Xini < width - bord - size & Xini > size & Yini > height - size * 8 & Yini < height - size * 6)
  {
    fill(200, 200, 200, 255);
  } else if (mouseX < width - bord - size & mouseX > size & mouseY > height - size * 8 & mouseY < height - size * 6 & Xini < width - bord - size & Xini > size & Yini > height - size * 8 & Yini < height - size * 6)
  {
    Xini = 0;
    Yini = 0;

    if (gosth)
    {
      gosth = false;
      buffer.col = empty;
    } else
    {
      gosth = true;
      if (dark)
      {
        buffer.col = color(230, 230, 230, 200);
      } else
      {
        buffer.col = color(255, 255, 255, 255);
      }
    }
  } else
  {
    if (gosth)
    {
      fill(155, 155, 155, 225);
    } else
    {
      fill(100, 100, 100, 225);
    }
  }

  rect(size, height - size * 8, width - bord - size * 2, size * 2);

  fill(255, 255, 255, 225);
  textAlign(CENTER, CENTER);
  text("Gosth Block", width - bord - (X / 2) * size, height - size * 7.5);
  if (gosth)
  {
    text("ON", width - bord - (X / 2) * size, height - size * 6.5);
  } else
  {
    text("OFF", width - bord - (X / 2) * size, height - size * 6.5);
  }

  ////////////////////////////////////////////////////
  if (mousePressed & mouseX < width - bord - size & mouseX > size & mouseY > height - size * 5 & mouseY < height - size * 3 & Xini < width - bord - size & Xini > size & Yini > height - size * 5 & Yini < height - size * 3)
  {
    fill(200, 200, 200, 255);
  } else if (mouseX < width - bord - size & mouseX > size & mouseY > height - size * 5 & mouseY < height - size * 3 & Xini < width - bord - size & Xini > size & Yini > height - size * 5 & Yini < height - size * 3)
  {
    Xini = 0;
    Yini = 0;

    if (dark)
    {
      dark = false;
      empty = color(175, 175, 175);
      if (gosth)
      {
        buffer.col = color(255, 255, 255, 255);
      }
    } else
    {
      dark = true;
      empty = color(75, 75, 75);
      if (gosth)
      {
        buffer.col = color(230, 230, 230, 200);
      }
    }
  } else
  {
    if (!dark)
    {
      fill(155, 155, 155, 225);
    } else
    {
      fill(100, 100, 100, 225);
    }
  }

  rect(size, height - size * 5, width - bord - size * 2, size * 2);

  fill(255, 255, 255, 225);
  textAlign(CENTER, CENTER);
  if (dark)
  {
    text("Dark", width - bord - (X / 2) * size, height - size * 4.5);
  } else
  {
    text("Light", width - bord - (X / 2) * size, height - size * 4.5);
  }

  text("Theme", width - bord - (X / 2) * size, height - size * 3.5);

  ///////////////////////////////////////////////////

  if (mousePressed & mouseX < width - bord & mouseY > height - size * 2 & Xini < width - bord & Yini > height - size * 2)
  {
    fps++;
    fill(200, 200, 200, 255);
  } else
  {
    fps = 0;
    fill(150, 150, 150, 225);
  }

  rect(0, height - size * 2, width - bord, size * 2);
  fill(255, 255, 255, 225);
  textAlign(CENTER, CENTER);
  text("Reset", (width - bord) / 2, height - size);
}
