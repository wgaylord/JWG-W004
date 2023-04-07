import backplane


class Core:
    def __init__():
        PRA = 0
        PRB = 0
        POA = 0
        POB = 0
        SP = 0
        A = 0
        B = 0
        C = 0
        D = 0

        step = 0
        instruction_reg = 0

    def readRegister32(self,num):
        if num == 0:
            return self.PRA
        if num == 2:
            return self.PRB
        if num == 6:
            return self.SP
        if num == 8:
            return (self.A << 16) + (self.B)
        if num == 12:
            return (self.C << 16) + (self.D)

    def writeRegister32(self,num,val):
        if num == 0:
            self.PRA = val
        if num == 2:
            self.PRB = val
        if num == 6:
            self.SP = val
        if num == 8:
            self.A = val >> 16
            self.B = val & 0xFF
        if num == 12:
            self.C = val >> 16
            self.D = val & 0xFF

    def readRegister16(self,num):
        if num == 0:
            return (self.PRA & 0xFF00) >> 8
        if num == 1:
            return (self.PRA & 0x00FF)
        if num == 2:
            return (self.PRB & 0xFF00) >> 8
        if num == 3:
            return (self.PRB & 0x00FF)
        if num == 4:
            return self.POA
        if num == 5:
            return self.POB
        if num == 6:
            return (self.SP & 0xFF00) >> 8
        if num == 7:
            return (self.SP & 0x00FF)
        if num == 8:
            return self.A
        if num == 10:
            return self.B
        if num == 12:
            return self.C
        if num == 14:
            return self.D

    def writeRegister16(self,num,val):
        if num == 0:
            self.PRA = (self.PRA&0x00FF) + ((val & 0xFF)<<16)
        if num == 1:
            self.PRA = (self.PRA&0xFF00) + (val & 0xFF)
        if num == 2:
            self.PRB = (self.PRB&0x00FF) + ((val & 0xFF)<<16)
        if num == 3:
            self.PRB = (self.PRB&0xFF00) + (val & 0xFF)
        if num == 4:
            self.POA = val
        if num == 5:
            self.POB = val
        if num == 6:
            self.SP = (self.SP&0x00FF) + ((val & 0xFF)<<16)
        if num == 7:
            self.SP = (self.SP&0xFF00) + (val & 0xFF)
        if num == 8:
            self.A = val
        if num == 10:
            self.B = val
        if num == 12:
            self.C = val
        if num == 14:
            self.D = val

    def readRegister8(self,num):
        if num == 8:
            return (self.A & 0xFF00) >> 8
        if num == 9:
            return self.A & 0x00FF
        if num == 10:
            return (self.B & 0xFF00) >> 8
        if num == 11:
            return self.B & 0x00FF
        if num == 12:
            return (self.C & 0xFF00) >> 8
        if num == 13:
            return self.C & 0x00FF
        if num == 14:
            return (self.D & 0xFF00) >> 8
        if num == 15:
            return self.D & 0x00FF

    def writeRegister8(self,num,val):
        if num == 8:
            self.A = (self.A & 0x00FF) + (val << 8)
        if num == 9:
             self.A = (self.A & 0xFF00) + val
        if num == 10:
            self.B = (self.B & 0x00FF) + (val << 8)
        if num == 11:
            self.B = (self.B & 0xFF00) + val
        if num == 12:
            self.C = (self.C & 0x00FF) + (val << 8)
        if num == 13:
            self.C = (self.C & 0xFF00) + val
        if num == 14:
            self.D = (self.D & 0x00FF) + (val << 8)
        if num == 15:
            self.D = (self.D & 0xFF00) + val

    def tick(self)
        pass


class MMU:
    def __init__():
        pass

    def read8(self,address):
        pass

    def read16(self,address):
        pass
    
    def write8(self,address):
        pass

    def wrtie16(self,address):
        pass
