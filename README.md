# Algorithm-to-find-the-Greatest-Common-Divisor-GCD-of-two-numbers
Implemented the following algorithm to find the Greatest Common Divisor (GCD) of two numbers:

    while(1){
      while(!start);
      while(A != B){
        if(A > B){
          A = A - B;
        }
        else{  // B > A
          B = B - A;
        }
      }
      res = A; // or res = B because they should be equal
    }

Used the FSMD structure, meaning used control signals as outputs from the FSM and as inputs to the datapath.
