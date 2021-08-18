package com.nc.edu.ta.pr1.operations.tests;

import com.nc.edu.ta.pr1.operations.*;
import org.junit.*;

public class OperationTest {
  @Test
  public void testMultiply() {
    for (int a = 0; a < 100; a++)
      for (int b = 0; b < 100; b++) {
        Assert.assertEquals(a * b, new Operation(a, b).getResult());
      }
  }
}
