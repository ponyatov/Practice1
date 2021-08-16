package com.nc.edu.ta.pr1;

class Operation {
    private int x,y;

    Operation(int x, int y) {
        this.x=x; this.y=y;
    }

    int getResult() {
        return x*y;
    }
}
