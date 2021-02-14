// Futásidő alatt minden második egérkattintásra jelenjenek meg az aktuális,  //<>// //<>//
// illetve a megelőző kattintás pontjaira illeszkedő egyenes!

int count;
int prevMouseX, prevMouseY;

void setup() {
    size(640, 480);
}

void draw() {
}

void mousePressed() {
    count++;

    if (count % 2 == 0) {    
        Line line = new Line(mouseX, mouseY, prevMouseX, prevMouseY); 
        line.drawInf();
    }

    prevMouseX = mouseX;
    prevMouseY = mouseY;
}

class Line {
    float x1, y1, x2, y2;

    public Line(float x1, float y1, float x2, float y2) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
    }

    void draw() {
        float x, y;

        for (x = (x1<x2)?x1:x2; x < ((x1>x2)?x1:x2); x++) { 
            y = (y2-y1)/(x2-x1)*(x-x1)+y1;
            point(x, y);
        }
    }

    void drawInf() {
        float x, y;

        draw();

        x = (x1<x2)?x1:x2;
        do {
            y = (y2-y1)/(x2-x1)*(x-x1)+y1;
            point(x, y);
            x--;
        } while (x>=0 && y>=0);

        x = (x1>x2)?x1:x2;
        do {
            y = (y2-y1)/(x2-x1)*(x-x1)+y1;
            point(x, y);
            x++;
        } while (x<=width && y<=height);
    }
}
