import processing.sound.*;

SoundFile sound;

int X = 10;
int Y = 22;
boolean[][] grid = new boolean[X][Y];

color[][] colo = new color[X][Y];
color empty = color(75, 75, 75);

float size;

boolean start = false;

int movePropX = 0;

int buf = 3;
blocks[] block = new blocks[buf + 1];
blocks buffer = new blocks();

boolean mov = true;

boolean fullLine = false;
int bufA = 0;

float bord = 63;
int bufS = int(bord / 5);

int score = 0;

boolean tetris = false;

PFont font;

float topBord = 0;

int speed = 1;
float scoreHolder = 100;

int turn = 0;

boolean end = false;

float Xini = 0;
float Yini = 0;

int frame = 0;

boolean speedBoosted = false;

boolean action = true;

int swipe = 0;

int bestScore = 0;

String name = "";
boolean naming = false;

int fps = 0;
int fpsTwo = 0;
int fpsTrhee = 0;

boolean set = false;
float ajustX = 1;
float ajustY = 1;

boolean pause = false;

boolean slowStart = false;

boolean dark = true;
boolean gosth = true;
boolean music = true;

blocks menuBlock = new blocks();

boolean[] trying = new boolean[Y];

/*
 openKeyboard
 closeKeyboard
 */

void setup() {
  //fullScreen();
  orientation(PORTRAIT);
  size(558, 992);
  frameRate(60);

  try {
    String[] abc = loadStrings("best.txt");

    PrintWriter bufabc = createWriter("best.txt");
    bufabc.println(bestScore);
    bufabc.println(name);
    bufabc.println(ajustX);
    bufabc.println(ajustY);

    if (gosth) {
      bufabc.println(1);
    } else {
      bufabc.println(0);
    }

    if (dark) {
      bufabc.println(1);
    } else {
      bufabc.println(0);
    }

    if (music) {
      bufabc.println(1);
    } else {
      bufabc.println(0);
    }

    bufabc.flush();
    bufabc.close();

    char[] ab = abc[0].toCharArray();

    for (int a = 0; a < ab.length; a++) {
      bestScore *= 10;

      if (ab[a] == '0')
      {
        bestScore += 0;
      } else if (ab[a] == '1')
      {
        bestScore += 1;
      } else if (ab[a] == '2')
      {
        bestScore += 2;
      } else if (ab[a] == '3')
      {
        bestScore += 3;
      } else if (ab[a] == '4')
      {
        bestScore += 4;
      } else if (ab[a] == '5')
      {
        bestScore += 5;
      } else if (ab[a] == '6')
      {
        bestScore += 6;
      } else if (ab[a] == '7')
      {
        bestScore += 7;
      } else if (ab[a] == '8')
      {
        bestScore += 8;
      } else if (ab[a] == '9')
      {
        bestScore += 9;
      }
    }

    name = abc[1];

    ab = abc[2].toCharArray();
    ajustX = 0;

    for (int a = ab.length - 1; a >= 0; a--) {
      if (ab[a] != '.')
      {
        ajustX /= 10;
      }

      if (ab[a] == '0')
      {
        ajustX += 0;
      } else if (ab[a] == '1')
      {
        ajustX += 1;
      } else if (ab[a] == '2')
      {
        ajustX += 2;
      } else if (ab[a] == '3')
      {
        ajustX += 3;
      } else if (ab[a] == '4')
      {
        ajustX += 4;
      } else if (ab[a] == '5')
      {
        ajustX += 5;
      } else if (ab[a] == '6')
      {
        ajustX += 6;
      } else if (ab[a] == '7')
      {
        ajustX += 7;
      } else if (ab[a] == '8')
      {
        ajustX += 8;
      } else if (ab[a] == '9')
      {
        ajustX += 9;
      }
    }

    ab = abc[3].toCharArray();
    ajustY = 0;

    for (int a = ab.length - 1; a >= 0; a--) {
      if (ab[a] != '.')
      {
        ajustY /= 10;
      }

      if (ab[a] == '0')
      {
        ajustY += 0;
      } else if (ab[a] == '1')
      {
        ajustY += 1;
      } else if (ab[a] == '2')
      {
        ajustY += 2;
      } else if (ab[a] == '3')
      {
        ajustY += 3;
      } else if (ab[a] == '4')
      {
        ajustY += 4;
      } else if (ab[a] == '5')
      {
        ajustY += 5;
      } else if (ab[a] == '6')
      {
        ajustY += 6;
      } else if (ab[a] == '7')
      {
        ajustY += 7;
      } else if (ab[a] == '8')
      {
        ajustY += 8;
      } else if (ab[a] == '9')
      {
        ajustY += 9;
      }
    }

    if (abc.length > 4) {
      if (abc[4].toCharArray()[0] == '1')
      {
        gosth = true;
      } else if (abc[4].toCharArray()[0] == '0')
      {
        gosth = false;
      }

      if (abc[5].toCharArray()[0] == '1')
      {
        dark = true;
      } else if (abc[5].toCharArray()[0] == '0')
      {
        dark = false;
      }

      if (abc[6].toCharArray()[0] == '1')
      {
        music = true;
      } else if (abc[6].toCharArray()[0] == '0')
      {
        music = false;
      }
    }
  }
  catch(Exception e) {
    println("Pas de fichier de sauvegarde trouver");
  }

  for (int a = 0; a < buf + 1; a++) {
    block[a] = new blocks();
  }

  block[0].ini();
  buffer.col = color(230, 230, 230, 200);

  for (int a = 0; a < X; a++)
  {
    for (int b = 0; b < Y; b++)
    {
      grid[a][b] = false;
      colo[a][b] = empty;

      trying[b] = false;
    }
  }

  size = (height - topBord) / (Y - 2);

  bord = width - size * X;
  bufS = int(bord / 5);
  topBord = bord;

  font = createFont("NotoMono-Regular.ttf", size);
  textFont(font);

  sound = new SoundFile(this, "song.wav");
  sound.loop();

  if (music)
  {
    sound.play();
  } else
  {
    sound.stop();
  }
}

void disposed() { //dispose == active and disposed == desactive
  PrintWriter output = createWriter("best.txt");
  output.println(bestScore);
  output.println(name);
  output.println(ajustX);
  output.println(ajustY);

  if (gosth) {
    output.println(1);
  } else {
    output.println(0);
  }

  if (dark) {
    output.println(1);
  } else {
    output.println(0);
  }

  if (music) {
    output.println(1);
  } else {
    output.println(0);
  }

  output.flush();
  output.close();
}

void stop() {
  sound.pause();
  if (start)
  {
    pause = true;
    start = false;
  }

  PrintWriter output = createWriter("best.txt");
  output.println(bestScore);
  output.println(name);
  output.println(ajustX);
  output.println(ajustY);

  if (gosth) {
    output.println(1);
  } else {
    output.println(0);
  }

  if (dark) {
    output.println(1);
  } else {
    output.println(0);
  }

  if (music) {
    output.println(1);
  } else {
    output.println(0);
  }

  output.flush();
  output.close();
}
