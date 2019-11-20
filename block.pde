public class blocks {
  int[] x;
  int[] y;
  int amo = 4;
  int type;
  
  color col;
  
  int Xmi = 0;
  int Xma = X;
  
  boolean rota = false;
  
  boolean turns = false;
  
  public blocks() {
    type = int(random(1, 8));
    x = new int[amo];
    y = new int[amo];
    
    col = color(125 + random(0, 100), 125 + random(0, 100), 125 + random(0, 100));
    
    for (int a = 0; a < amo; a++)
    {
      if (type == 1)
      {
        col = color(19, 240, 237);
        
        y[a] = 0;
        x[a] = 1;
        
        if (a == 1)
        {
          x[a] = 0;
        }
        else if (a == 2 || a == 3)
        {
          x[a] = a;
        }
        else if (a == 0)
        {
          x[a] = 1;
        }
      }
      else if (type == 2)
      {
        col = color(237, 240, 19);
        
        if (a < 2)
        {
          y[a] = 0;
          x[a] = 1 - a;
        }
        else
        {
          y[a] = 1;
          x[a] = a - 2;
        }
      }
      else if (type == 3)
      {
        col = color(206, 19, 240);
        
        if (a < 3)
        {
          y[a] = 0;
        }
        else
        {
          y[a] = 1;
        }
        
        if (a == 0 || a == 3)
        {
          x[a] = 1;
        }
        else if (a == 1)
        {
          x[a] = 0;
        }
        else if (a == 2)
        {
          x[a] = 2;
        }
      }
      else if (type == 4)
      {
        col = color(246, 166, 11);
        
        if (a < 3)
        {
          y[a] = 0;
        }
        else
        {
          y[a] = 1;
        }
        
        if (a == 2 || a == 3)
        {
          x[a] = 0;
        }
        else if (a == 0 || a == 1)
        {
          x[a] = 1 + a;
        }
      }
      else if (type == 5)
      {
        col = color(22, 11, 246);
        
        if (a < 3)
        {
          y[a] = 0;
        }
        else
        {
          y[a] = 1;
        }
        
        if (a == 2 || a == 3)
        {
          x[a] = 2;
        }
        else if (a == 0 || a == 1)
        {
          x[a] = 1 - a;
        }
      }
      else if (type == 6)
      {
        col = color(230, 19, 19);
        
        if (a < 2)
        {
          y[a] = 0;
        }
        else
        {
          y[a] = 1;
        }
        
        if (a == 0 || a == 2)
        {
          x[a] = 1;
        }
        else if (a == 1 || a == 3)
        {
          x[a] = -1 + a;
        }
      }
      else if (type == 7)
      {
        col = color(19, 230, 19);
        
        if (a < 2)
        {
          y[a] = 0;
        }
        else
        {
          y[a] = 1;
        }
        
        if (a == 0 || a == 2)
        {
          x[a] = 1;
        }
        else if (a == 1 || a == 3)
        {
          x[a] = 3 - a;
        }
      }
    }
  }
  
  void ini() {
    for (int a = 0; a < amo; a++)
    {
      x[a] += (X - 1) / 2;
      y[a] += 1;
      
      if (grid[x[a]][y[a]])
      {
        end = true;
      }
    }
    
    if (end)
    {
      for (int a = 0; a < amo; a++)
      {
        y[a] -= 1;
      }
    }
  }
  
  void move(int Xmove) {
    int[] bufX = new int[amo];
    
    boolean bufFail = failY();
    boolean failX = false;
    
    for (int a = 0; a < amo; a++)
    {
      bufX[a] = x[a];
      
      if (Xmi > 0 & Xmove < 0 || Xma < X - 1 & Xmove > 0)
      {
        x[a] += Xmove;
      }

      if (mov & frame >= 60 / speed & !bufFail || speedBoosted & mov & !bufFail)
      {
        y[a]++;
      }
    }
    
    for (int a = 0; a < amo; a++)
    {
      if (grid[x[a]][y[a]])
      {
        failX = true;
      }
    }
    
    if (failX)
    {
      for (int a = 0; a < amo; a++)
      {
        x[a] = bufX[a];
      }
    }
    
    
  }
  
  void moveBuf(int Xmove) {
    int[] bufX = new int[amo];
    
    while(!failY())
    {
      for (int a = 0; a < 4; a++)
    {


        y[a]++;
      
    }
    

    }
    
    for (int a = 0; a < amo; a++)
    {
      colo[x[a]][y[a]] = col;
    }
  }
  
  void rotate() {
    int Xmax = -1;
    int Xmin = X;
      
    int Ymax = -1;
    int Ymin = Y;
    
    for (int b = 0; b < amo; b++)
    {
      grid[x[b]][y[b]] = false;
      colo[x[b]][y[b]] = empty;
      
      if (x[b] - x[0] > Xmax)
      {
        Xmax = x[b];
      }
      
      if (x[0] - x[b] < Xmin)
      {
        Xmin = x[b];
      }
      
      if (y[b] - y[0] > Ymax)
      {
        Ymax = y[b];
      }
      
      if (y[0] - y[b] < Ymin)
      {
        Ymin = y[b];
      }
    }
        
    Xmi = Xmin;
    Xma = Xmax;
        
    if (type != 2)
    {
      if (Xmax - Xmin > Ymax - Ymin)
      {
        Ymax = int(y[0] + (Xmax - x[0]));
        Ymin = int(y[0] - (Xmax - x[0]));
      }
      else if (Ymax - Ymin > Xmax - Xmin)
      {
        Xmax = int(x[0] + (Ymax - y[0]));
        Xmin = int(x[0] - (Ymax - y[0]));
      }
      
      if (rota)
      {
        rota = false;
        
        for (int b = 0; b < amo; b++)
        {
          grid[x[b]][y[b]] = false;
          colo[x[b]][y[b]] = empty;
        }
        
        boolean corectR = false;
        boolean corectL = false;
        int bufX[] = new int[amo];
        int bufY[] = new int[amo];
        
        for (int b = 0; b < amo; b++)
        {
          bufX[b] = x[b];
          bufY[b] = y[b];
          
          x[b] = int(x[0] + (y[0] - bufY[b]));
          y[b] = int(y[0] - (x[0] - bufX[b]));
          
          bufX[b] = x[b];
          bufY[b] = y[b];
          
          boolean notOk = false;
          
          do{
            notOk = false;
            
            if (x[b] > -1 & x[b] < X & y[b] > -1 & y[b] < Y)
            {
              if (grid[x[b]][y[b]])
              {
                if (x[0] < x[b])
                {
                  corectR = true;
                }
                else
                {
                  corectL = true;
                }
              }
            }
            else if (x[b] <= -1)
            {
              corectL = true;
            }
            else if (x[b] >= X)
            {
              corectR = true;
            }
            else if (y[b] <= -1)
            {
              do{
                for (int a = 0; a < amo; a++)
                {
                  y[a]++;
                }
              }while(y[b] <= -1);
              
              notOk = true;
            }
            else if (y[b] >= Y)
            {
              do{
                for (int a = 0; a < amo; a++)
                {
                  y[a]--;
                }
              }while(y[b] >= Y);
              
              notOk = true;
            }
          }while(notOk);
        }
        
        ///////////////////////////////////////////////////////////////////////////////////Corecteur
        
        boolean problem = false;
        do{
          problem = false;
          
          if (corectL)
          {
            boolean doIt = false;
            
            do{
              doIt = false;
              
              for (int b = 0; b < amo; b++)
              {
                x[b]++;
                
                if (x[b] >= X)
                {
                  for (int a = 0; a < amo; a++)
                  {
                    y[a]--;
                    x[a] = bufX[a];
                  }
                  
                  if (x[b] <= -1)
                  {
                    doIt = true;
                    b = 0;
                  }
                  else if (grid[x[b]][y[b]])
                  {
                    if (x[0] < x[b])
                    {
                      corectR = true;
                      problem = true;
                      b = amo;
                      doIt = false;
                    }
                    else
                    {
                      doIt = true;
                      b = 0;
                    }
                  }
                  else
                  {
                    b = amo;
                    doIt = false;
                  }
                }
                else if (x[b] <= -1)
                {
                  doIt = true;
                }
                else if (grid[x[b]][y[b]])
                {
                  if (x[0] < x[b])
                    {
                      corectR = true;
                      problem = true;
                      b = amo;
                      doIt = false;
                    }
                    else
                    {
                      doIt = true;
                    }
                }
              }
            }while(doIt);
          }
          else if (corectR)
          {
            boolean doIt = false;
            
            do{
              doIt = false;
              
              for (int b = 0; b < amo; b++)
              {
                x[b]--;
                
                if (x[b] <= -1)
                {
                  for (int a = 0; a < amo; a++)
                  {
                    y[a]--;
                    x[a] = bufX[a];
                  }
                  
                  if (x[b] >= X)
                  {
                    doIt = true;
                    b = 0;
                  }
                  else if (grid[x[b]][y[b]])
                  {
                    if (x[0] > x[b])
                    {
                      corectL = true;
                      problem = true;
                      b = amo;
                      doIt = false;
                    }
                    else
                    {
                      doIt = true;
                      b = 0;
                    }
                  }
                  else
                  {
                    b = amo;
                    doIt = false;
                  }
                }
                else if (x[b] >= X)
                {
                  doIt = true;
                }
                else if (grid[x[b]][y[b]])
                {
                  if (x[0] > x[b])
                    {
                      corectL = true;
                      problem = true;
                      b = amo;
                      doIt = false;
                    }
                    else
                    {
                      doIt = true;
                    }
                }
              }
            }while(doIt);
          }
          
          for (int b = 0; b < amo; b++)
              {
                if (x[b] > -1 & x[b] < X & y[b] > -1 & y[b] < Y)
                {
                  if (grid[x[b]][y[b]])
                  {
                    if (x[0] < x[b])
                    {
                      corectR = true;
                      problem = true;
                    }
                    else
                    {
                      corectL = true;
                      problem = true;
                    }
                  }
                }
                else if (x[b] <= -1)
                {
                  corectL = true;
                }
                else if (x[b] >= X)
                {
                  corectR = true;
                }
              }
          
        }while(problem);
        
        for (int b = 0; b < amo; b++)
        {
          grid[x[b]][y[b]] = true;
          colo[x[b]][y[b]] = col;
        }
      }
    }
    
    Xma = -1;
    Xmi = X;
    
    for (int b = 0; b < amo; b++)
    {
      if (x[b] > Xma)
      {
        Xma = x[b];
      }
      
      if (x[b] < Xmi)
      {
        Xmi = x[b];
      }
    }
  }
  
  boolean failY() {
    boolean failY = false;
    
    for (int a = 0; a < amo; a++)
    {
      if (y[a] >= Y - 1)
      {
        failY = true;
        a = amo;
      }
      else if (grid[x[a]][y[a] + 1])
      {
        failY = true;
        
        for (int b = 0; b < amo; b++)
          {
            if (x[a] == x[b] & y[a] + 1 == y[b])
            {
              failY = false;
            }
          }
          
          if (failY)
          {
            a = amo;
          }
      }
    }
    
    return failY;
  }
  
  boolean finish() {
    boolean death = false;
    boolean turn = false;
    
    for (int b = 0; b < amo; b++)
    {
      if (y[b] >= Y - 1 & speedBoosted || y[b] >= Y - 1 & frame + 1 >= 60 / speed)
      {
        if (turns)
        {
          death = true;
          turn = true;
        }
        else
        {
          turn = true;
        }
      }
      else if (!(y[b] >= Y - 1) & speedBoosted || !(y[b] >= Y - 1) & frame + 1 >= 60 / speed)
      {
        if (grid[x[b]][y[b] + 1])
        {
          boolean bufDead = true;
            for (int a = 0; a < amo; a++)
            {
              if (x[b] == x[a] & y[b] + 1 == y[a])
              {
                bufDead = false;
              }
            }
            
            if (bufDead)
            {
              death = true;
            }
            
            if (death & turns)
            {
              turn = true;
            }
            else if (death)
            {
              death = false;
              turn = true;
            }
        }
      }
    }
    
    if (turn)
    {
      turns = true;
    }
    else
    {
      turns = false;
    }
    
    return death;
  }
}
