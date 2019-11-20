void endOfGame() {
        frame = 0;
        
        speedBoosted = false;
        
        if (end)
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
          
          if (score > bestScore)
          {
            bestScore = score;
            
            naming = true;
            name = "";
            
            //openKeyboard();
          }
        }
        else
        {
          turn++;
          int buffer = 0;
          
          if (speedBoosted)
          {
            speedBoosted = false;
          }
          
          for (int a = 0; a < Y; a++)
          {    
            fullLine = true;
            
            for (int b = 0; b < X; b++)
            {
              if (!grid[b][a])
              {
                fullLine = false;
              }
            }
            
            if (fullLine)
            {
              trying[a] = true;
              
              buffer++;
            }
          }
          
          if (tetris & buffer >= 4 || buffer >= 8)
              {
                score += 1200;
                tetris = true;
              }
              else if (buffer >= 4)
              {
                score += 800;
                tetris = true;
              }
              else if (buffer < 4)
              {
                score += 100 * buffer;
                tetris = false;
              }
              
              if (buffer >= 4)
              {
                for (int a = 0; a < Y; a++)
                {
                  if (trying[a])
                  {
                    for (int c = 0; c < X; c++)
                    {
                      grid[c][a] = true;
                      if (dark)
                      {
                        colo[c][a] = color(235, 235, 235, 235);
                      }
                      else
                      {
                        colo[c][a] = color(255, 255, 255);
                      }
                    }
                  }
                }
              }
              else
              {
                for (int a = 0; a < Y; a++)
                {
                  if (trying[a])
                  {
                    for (int c = 0; c < X; c++)
                    {
                      grid[c][a] = false;
                      colo[c][a] = empty;
                    }
                  }
                }
              }
          
          for (int a = 0; a < buf; a++)
          {
            block[a] = block[a + 1];
          }
          
          block[buf] = new blocks();
          
          block[0].ini();
        }
}
