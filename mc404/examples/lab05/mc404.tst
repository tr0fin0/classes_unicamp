load mc404.asm,
output-file mc404.out,
compare-to mc404.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[4]%D2.6.2;

set RAM[0] 3,  // Set test arguments
set RAM[1] 4,  //
set RAM[2] 5;  // 
set RAM[4] -1; // 
repeat 100 {
  ticktock;
}
set RAM[0] 3,  //
set RAM[1] 4,  //
set RAM[2] 5,  //
output;

set PC 0,
set RAM[0] 5,   //
set RAM[1] 3,   //
set RAM[2] 4,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 5,  //
set RAM[1] 3,  //
set RAM[2] 4,  //
output;

set PC 0,
set RAM[0] 4,   //
set RAM[1] 5,   //
set RAM[2] 3,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 4,  //
set RAM[1] 5,  //
set RAM[2] 3,  //
output;

set PC 0,
set RAM[0] 6,   //
set RAM[1] 3,   //
set RAM[2] 3,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 6,  //
set RAM[1] 3,  //
set RAM[2] 3,  //
output;

set PC 0,
set RAM[0] 3,   //
set RAM[1] 6,   //
set RAM[2] 3,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 3,  //
set RAM[1] 6,  //
set RAM[2] 3,  //
output;

set PC 0,
set RAM[0] 3,   //
set RAM[1] 3,   //
set RAM[2] 6,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 3,  //
set RAM[1] 3,  //
set RAM[2] 6,  //
output;

set PC 0,
set RAM[0] 7,   //
set RAM[1] 3,   //
set RAM[2] 3,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 7,  //
set RAM[1] 3,  //
set RAM[2] 3,  //
output;

set PC 0,
set RAM[0] 3,   //
set RAM[1] 7,   //
set RAM[2] 3,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 3,  //
set RAM[1] 7,  //
set RAM[2] 3,  //
output;

set PC 0,
set RAM[0] 3,   //
set RAM[1] 3,   //
set RAM[2] 7,   //
set RAM[4] -1;  //
repeat 100 {
  ticktock;
}
set RAM[0] 3,  //
set RAM[1] 3,  //
set RAM[2] 7,  //
output;