void moving() {
  if (start)
  {
    block[0].rotate();
    for (int a = 0; a < 4; a++)
    {
      grid[block[0].x[a]][block[0].y[a]] = false;
      colo[block[0].x[a]][block[0].y[a]] = empty;
    }
    
    if (frame >= 20 / speed)
    {
      for (int a = 0; a < Y; a++)
      {
        if (trying[a])
        {
          for (int b = 0; b < X; b++)
                {
                  for (int c = a; c > 0; c--)
                  {
                    if (grid[b][c - 1])
                    {
                      grid[b][c] = grid[b][c - 1];
                      colo[b][c] = colo[b][c - 1];
                      
                      grid[b][c - 1] = false;
                      colo[b][c - 1] = empty;
                    }
                    else
                    {
                      grid[b][c] = false;
                      colo[b][c] = empty;
                    }
                  }
                }
                
                trying[a] = false;
        }
      }
  }
    
    if (speedBoosted)
    {
      block[0].move(0);
    }
    else
    {
      block[0].move(movePropX);
    }
    movePropX = 0;
    
    for (int a = 0; a < 4; a++)
    {
      grid[block[0].x[a]][block[0].y[a]] = true;
      colo[block[0].x[a]][block[0].y[a]] = block[0].col;
    }
    
    for (int a = 0; a < 4; a++)
    {
      if (colo[buffer.x[a]][buffer.y[a]] == buffer.col)
      {
        colo[buffer.x[a]][buffer.y[a]] = empty;
      }
    }
    
    for (int a = 0; a < X; a++)
    {
      for (int b = 0; b < Y; b++)
      {
        if (!grid[a][b] & !trying[b])
        {
          colo[a][b] = empty;
        }
      }
    }
    
    for (int a = 0; a < 4; a++)
    {
      buffer.x[a] = int(block[0].x[a]);
      buffer.y[a] = int(block[0].y[a]);
    }
    buffer.moveBuf(0);
    
    for (int a = 0; a < 4; a++)
    {
      colo[block[0].x[a]][block[0].y[a]] = block[0].col;
    }
    
    if (block[0].finish())
    {
        endOfGame();
    }
    
    if (frame >= 60 / speed)
    {
      frame = 0;
    }
  }
}
