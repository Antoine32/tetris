void mousePressed() {
  Xini = mouseX;
  Yini = mouseY;
  
  if (naming)
  {
    //openKeyboard();
  }
}

void mousy() {
  if (mousePressed)
  {
    if (!pause & !slowStart & !start & !set & !(mouseX > width - bord & mouseY < bord * 2))
    {
      fps++;
      
      if (fps >= 10)
      {
        score = 0;
        slowStart = true;
        fps = 0;
        
        for (int a = 0; a < buf + 1; a++)
        {
          block[a] = new blocks();
        }
        
        end = false;
        block[0] = menuBlock;
        
        for (int a = 0; a < X; a++)
        {
          for (int b = 0; b < Y; b++)
          {
            grid[a][b] = false;
            colo[a][b] = empty;
          }
        }
        
        block[0].ini();
      }
    }
    else if (!set)
    {
      fps = 0;
    }
    
    if (action & !pause & start)
    {
        if (Yini <= mouseY - (size * ajustY))
        {
          swipe = 3;
        }
        else if (Yini >= mouseY + (size * ajustY))
        {
          swipe = 4;
        }
        else if (Xini >= mouseX + (size * ajustX))
        {
          swipe = 1;
        }
        else if (Xini <= mouseX - (size * ajustX))
        {
          swipe = 2;
        }
        else if (mouseY > bord & mouseY - Yini < 0.5 & Yini - mouseY > -0.5 & mouseX - Xini < 0.5 & Xini - mouseX > -0.5 & mouseX > size * X)
        {
          swipe = 4;
        }
        else if (mouseX < size * X & mouseX > block[0].x[0] * size)
        {
          swipe = 2;
        }
        else if (mouseX < block[0].x[0] * size)
        {
          swipe = 1;
        }
    }
  }
  else if (!pause)
  {
    if (swipe == 0)
    {
      
    }
    else if (swipe == 1)
    {
      movePropX = -1;
      action = false;
    }
    else if (swipe == 2)
    {
      movePropX = 1;
      action = false;
    }
    else if (swipe == 3)
    {
      speedBoosted = true;
      action = false;
    }
    else if (swipe == 4)
    {
      block[0].rota = true;
      action = false;
    }
    
    swipe = 0;
    action = true;
  }
  
  if (!mousePressed)
  {
    fps = 0;
    fpsTrhee = 0;
  }
}
