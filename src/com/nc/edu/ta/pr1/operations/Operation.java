package com.nc.edu.ta.pr1.operations;

public class Operation {
  private int x, y;

  public Operation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public int getResult() {
    return x * y;
  }
}
