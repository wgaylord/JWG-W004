#subruledef indirectReg
{
	PRA => 0
	PRB => 2
}

#subruledef register32
{
    PRA => 0
    PRB => 2
    SP  => 6
    AB  => 8
    CD  => 12
}
#subruledef register16
{
   PRAH => 0
   PRAL => 1
   PRBH => 2
   PRBL => 3
   POA  => 4
   POB  => 5
   SPH  => 6
   SPL  => 7
   A    => 8
   B    => 10
   C    => 12
   D    => 14
}
#subruledef register8
{
  AH => 8
  AL => 9
  BH => 10
  BL => 11
  CH => 12
  CL => 13
  DH => 14
  DL => 15
}

#ruledef
{
  ADDw {r1: register16},{r2: register16},{r3: register16} => 0x8 @ r1`4 @ r2`4 @ r3`4 ;Add 16-bit
  SUBw {r1: register16},{r2: register16},{r3: register16} => 0x9 @ r1`4 @ r2`4 @ r3`4 ;Sub 16-bit
  ANDw {r1: register16},{r2: register16},{r3: register16} => 0xA @ r1`4 @ r2`4 @ r3`4 ;And 16-bit
  ORw {r1: register16},{r2: register16},{r3: register16} => 0xB @ r1`4 @ r2`4 @ r3`4  ;OR 16-bit
  XORw {r1: register16},{r2: register16},{r3: register16} => 0xC @ r1`4 @ r2`4 @ r3`4 ;XOR 16-bit
  ADDd {r1: register32},{r2: register32},{r3: register32} => 0xD @ r1`4 @ r2`4 @ r3`4 ;Add 32-bit
  SUBd {r1: register32},{r2: register32},{r3: register32} => 0xE @ r1`4 @ r2`4 @ r3`4 ;Sub 32-bit
  NOP => 0xF000
  
  
  NOTw {r1: register16},{r2: register16} => 0x00 @ r1`4 @ r2`4 ;Not 16-bit
  SFRw {r1: register16},{r2: register16} => 0x01 @ r1`4 @ r2`4 ;Shift Right 16-bit
  SFLw {r1: register16},{r2: register16} => 0x02 @ r1`4 @ r2`4 ;Shift Left 16-bit
  NOTb {r1: register8},{r2: register8} => 0x03 @ r1`4 @ r2`4 ;Not 8-bit
  SHRb {r1: register8},{r2: register8} => 0x04 @ r1`4 @ r2`4 ;Shift Right 8-bit
  SHLb {r1: register8},{r2: register8} => 0x05 @ r1`4 @ r2`4 ;Shift Left 8 bit
  SFR  {r1: register16} => 0x06 @ r1`4 @ 0x0 ;Store Flag Register
  LFR  {r1: register16} => 0x07 @ r1`4 @ 0x0 ;Load Flag Register
  CC => 0x0800 ;Clear Carry
  SC => 0x0900 ;Set Carrt
  LIb {r1: indirectReg},{r2: register8} => 0x0A @ r1`4 @ r2`4  ;Load Indirect 8-bit
  SIb {r1: indirectReg},{r2: register8} => 0x0B @ r1`4 @ r2`4  ;Store Indirect 8-bit
  LIw {r1: indirectReg},{r2: register16} => 0x0C @ r1`4 @ r2`4 ;Load Indirect 16-bit
  SIw {r1: indirectReg},{r2: register16} => 0x0D @ r1`4 @ r2`4 ;Store Indirect 16-bit
  CMPb {r1: register8},{r2: register8} => 0x0E @ r1`4 @ r2`4   ;Compare 8-bit
  CMPw {r1: register16},{r2: register16} => 0x0F @ r1`4 @ r2`4 ;Compare 16-bit
  
  CMPd {r1: register32},{r2: register32} => 0x10 @ r1`4 @ r2`4 ;Compare 32-bit
  MVb {r1: register8},{r2: register8} => 0x11 @ r1`4 @ r2`4 ;Move 8-bit
  MVw {r1: register16},{r2: register16} => 0x12 @ r1`4 @ r2`4 ;Move 16-bit
  POPb  {r1: register8} => 0x13 @ r1`4 @ 0x0 ;Pop 8-bit
  POPw  {r1: register16} => 0x14 @ r1`4 @ 0x0 ;Pop 16-bit
  POPd  {r1: register32} => 0x15 @ r1`4 @ 0x0 ;Pop 32-bit
  PUSHb  {r1: register8} => 0x16 @ r1`4 @ 0x0 ;Push 8-bit
  PUSHw  {r1: register16} => 0x17 @ r1`4 @ 0x0 ;Push 16-bit
  PUSHd  {r1: register32} => 0x18 @ r1`4 @ 0x0 ;Push 32-bit
  BNEr  {r1: register32} => 0x19 @ r1`4 @ 0x0 ;Branch Not Equal - Register
  BEr  {r1: register32} => 0x1A @ r1`4 @ 0x0 ;Branch Equal - Register
  BGr  {r1: register32} => 0x1B @ r1`4 @ 0x0 ;Branch Greater - Register
  BGEr  {r1: register32} => 0x1C @ r1`4 @ 0x0 ;Branch Greater than equal - Register
  BCr  {r1: register32} => 0x1D @ r1`4 @ 0x0 ;Branch on Carry - Register
  RTN => 0x1E00 ;Return
  INT {r1: register8} => 0x1F @ r1`4 @ 0x0 ;Inttrupt - register
  
  ;Not implemented yet in CPU
  MULTb {r1: register8},{r2: register8},{r3: register8} => 0x20 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Multiply 8-bit
  MULTw {r1: register16},{r2: register16},{r3: register16} => 0x21 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Multiply 16-bit
  MULTd {r1: register32},{r2: register32},{r3: register32} => 0x22 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Multiple 32-bit
  DIVb {r1: register8},{r2: register8},{r3: register8} => 0x23 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Divide 8-bit
  DIVw {r1: register16},{r2: register16},{r3: register16} => 0x24 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Divide 16-bit
  DIVd {r1: register32},{r2: register32},{r3: register32} => 0x25 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Divide 32-bit
  REMb {r1: register8},{r2: register8},{r3: register8} => 0x26 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Remander 8-bit
  REMw {r1: register16},{r2: register16},{r3: register16} => 0x27 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Remander 16-bit
  REMd {r1: register32},{r2: register32},{r3: register32} => 0x28 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Remander 32-bit
  
  ADDb {r1: register8},{r2: register8},{r3: register8} => 0x29 @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Add 8-bit
  SUBb {r1: register8},{r2: register8},{r3: register8} => 0x2A @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Sub 8-bit
  ANDb {r1: register8},{r2: register8},{r3: register8} => 0x2B @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;And 8-bit
  ORb {r1: register8},{r2: register8},{r3: register8} => 0x2C @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;Or 8-bit
  XORb {r1: register8},{r2: register8},{r3: register8} => 0x2D @ r1`4 @ r2`4 @ r3`4 @ 0x000 ;XOR 8-bit
  LDIb {r1: register8}, {value} => 0x2E @ r1`4 @ 0x0 @ 0x00 @ value`8 ;Load Immediate 8-bit
  LDIw {r1: register16}, {value} => 0x2F @ r1`4 @ 0x0 @  value`16 ;Load Immediate 16-bit
  
  
  LDb {r1: register8}, {addr} => 0x30 @ r1`4 @ 0x0 @ addr`32 ;Load 8-bit
  LDw {r1: register16}, {addr} => 0x31 @ r1`4 @ 0x0 @ addr`32 ;Load 16-bit
  STb {r1: register8}, {addr} => 0x32 @ r1`4 @ 0x0 @ addr`32 ;Store 8-bit
  STw {r1: register16}, {addr} => 0x33 @ r1`4 @ 0x0 @ addr`32 ;Store 16-bit
  LDId {r1: register32}, {value} => 0x34 @ r1`4 @ 0x0 @ value`32 ;Load Immediate 32-bit
  
  CALL {addr} => 0x35 @ 0x00 @ addr`32 ;Call
  JUMP {addr} => 0x36 @ 0x00 @ addr`32 ;Jump
  BNE {addr} => 0x37 @ 0x00 @ addr`32 ;Branch Not Equal
  BE {addr} => 0x38 @ 0x00 @ addr`32 ;brnach Equal
  BG {addr} => 0x39 @ 0x00 @ addr`32 ;Branch Greater
  BGE {addr} => 0x3A @ 0x00 @ addr`32 ;Branch Greater than equal
  BC {addr} => 0x3B @ 0x00 @ addr`32 ;Branch on Carry
  LSR {r1: register16} => 0x3C @ r1`4 @ 0x000000000 ;Load Status Register
  
  ;Privlaged
  SSR {r1: register16} => 0x40 @ r1`4 @ 0x0 ;Store Status Register
  SPTI {r1: register16} => 0x41 @ r1`4 @ 0x0 ;Store Page Table Index
  LPTI {r1: register16} => 0x42 @ r1`4 @ 0x0 ;Load Page Table Index
  SIVT {r1: register16} => 0x43 @ r1`4 @ 0x0 ;Store Inttrupt Vector Table
  LIVT {r1: register16} => 0x44 @ r1`4 @ 0x0 ;Load Inttrupt Vector Table
  RINT  => 0x4500 ;Return Inttrupt
  HALT  => 0x4600 ;Halt
  
}

