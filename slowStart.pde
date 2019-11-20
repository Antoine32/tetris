void slow() {
  fpsTwo++;
  
  if (fpsTwo < 180)
  {
    start = false;
  }
  
  for (int a = 0; a < X; a++)
        {
          for (int b = 0; b < Y; b++)
          {
            grid[a][b] = false;
            colo[a][b] = empty;
          }
        }
  
  if (fpsTwo <= 60)
  {
    colo[X/2 - 1][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 - 1][(Y - 2) / 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 - 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    
    colo[X/2][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2][(Y - 2) / 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    
    colo[X/2 + 1][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 + 1][(Y - 2) / 2 - 1] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 + 1][(Y - 2) / 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 + 1][(Y - 2) / 2 + 1] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
    colo[X/2 + 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2, 135 + fpsTwo * 2, 135 + fpsTwo * 2);
  }
  else if (fpsTwo <= 120)
  {
    colo[X/2 - 1][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 + 1][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 + 1][(Y - 2) / 2 - 1] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 + 1][(Y - 2) / 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2][(Y - 2) / 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 - 1][(Y - 2) / 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 - 1][(Y - 2) / 2 + 1] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 - 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
    colo[X/2 + 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120, 135 + fpsTwo * 2 - 120);
  }
  else if (fpsTwo <= 180)
  {
    for (int a = 0; a < 5; a++)
    {
      colo[X / 2][(Y - 2) / 2 - 2 + a] = color(135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240);
    }
    
    colo[X/2 - 1][(Y - 2) / 2 - 2] = color(135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240);
    colo[X/2 - 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240);
    colo[X/2 + 1][(Y - 2) / 2 + 2] = color(135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240, 135 + fpsTwo * 2 - 240);
  }
  else if (fpsTwo > 180)
  {
    fpsTwo = 0;
    start = true;
    slowStart = false;
  }
}
