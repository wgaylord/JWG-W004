
AddressBus = 0
DataBus = 0
ByteEnable = 3 #0 is unused, 1 is lower byte, 2 is upper byte, 3 is both bytes
Interrupt1 = False
Interrupt2 = False
Interrupt3 = False
Interrupt4 = False
Read = False
Write = False
CPUInhibit = False
CPUAccept = False


cards = []

def tick():
    for x in cards:
        x.tick()

