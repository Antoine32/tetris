/*void keyPressed() {
 if (naming) {
 if (keyCode == ENTER & name.length() > 0) {
 naming = false;
 //closeKeyboard();
 } else if (keyCode <= 54 & keyCode >= 29) {
 name += key;
 } else if (keyCode == 67) {
 char[] ab = name.toCharArray();
 name = "";
 
 for (int a = 0; a < ab.length - 1; a++) {
 name += ab[a];
 }
 }
 } else {
 if (key == 's') {
 if (!set & !slowStart & !start) {
 slowStart = true;
 score = 0;
 
 for (int a = 0; a < buf + 1; a++) {
 block[a] = new blocks();
 }
 
 end = false;
 block[0] = menuBlock;
 block[0].ini();
 
 for (int a = 0; a < X; a++) {
 for (int b = 0; b < Y; b++) {
 grid[a][b] = false;
 colo[a][b] = empty;
 }
 }
 }
 }
 }
 
 if (start) { 
 if (key == '0' || key == 'r' || keyCode == UP) {
 block[0].rota = true;
 } else if (key == ' ' || keyCode == DOWN) {
 speedBoosted = true;
 frame = 0;
 } else if (keyCode == RIGHT) {
 movePropX = 1;
 } else if (keyCode == LEFT) {
 movePropX = -1;
 }
 }
 }*/

void keyReleased() {
  if (naming) {
    if (keyCode == ENTER & name.length() > 0) {
      naming = false;
      //closeKeyboard();
    } else if (keyCode <= 54 & keyCode >= 29) {
      name += key;
    } else if (keyCode == 67) {
      char[] ab = name.toCharArray();
      name = "";

      for (int a = 0; a < ab.length - 1; a++) {
        name += ab[a];
      }
    }
  } else {
    if (key == 's') {
      if (!set & !slowStart & !start) {
        slowStart = true;
        score = 0;

        for (int a = 0; a < buf + 1; a++) {
          block[a] = new blocks();
        }

        end = false;
        block[0] = menuBlock;
        block[0].ini();

        for (int a = 0; a < X; a++) {
          for (int b = 0; b < Y; b++) {
            grid[a][b] = false;
            colo[a][b] = empty;
          }
        }
      }
    }
  }

  if (start) { 
    if (key == '0' || key == 'r' || keyCode == UP) {
      block[0].rota = true;
    } else if (key == ' ' || keyCode == DOWN) {
      speedBoosted = true;
      frame = 0;
    } else if (keyCode == RIGHT) {
      movePropX = 1;
    } else if (keyCode == LEFT) {
      movePropX = -1;
    }
  }
}
