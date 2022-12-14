OriginalSensorList = []
with open("input15.txt", "r") as data:
    for t in data:
        Line = t.strip()  
        _, _, SX, SY, _, _, _, _, BX, BY = Line.split()
        SX, SY, BX, BY = int(SX[2:-1]), int(SY[2:-1]), int(BX[2:-1]), int(BY[2:])
        NewTuple = (SX, SY, BX, BY)
        OriginalSensorList.append(NewTuple)

SensorList = []
BeaconSet = set()
MinY, MinX = 10**10, 10**10
MaxX, MaxY = 0,0

for SX, SY, BX, BY in OriginalSensorList:
    BeaconSet.add((BX,BY))
    Radius = abs(SX-BX) + abs(SY-BY)
    NewTuple = (SX, SY, Radius)
    SensorList.append(NewTuple)
    if SX-Radius < MinX:
        MinX = SX-Radius
    if SX+Radius > MaxX:
        MaxX = SX+Radius 
    if SY-Radius < MinY:
        MinY = SY-Radius
    if SY+Radius > MaxY:
        MaxY = SY+Radius 

Part1Row = 2000000
Part1RelevantSensorList = []
for SX, SY, Radius in SensorList:
    if (SY <= Part1Row and SY+Radius >= Part1Row) or (SY >= Part1Row and SY-Radius <= Part1Row):
        Part1RelevantSensorList.append((SX,SY,Radius))

Part1Answer = 0
for GX in range(MinX, MaxX+1):
    if GX % 1000000 == 0:
        print(GX)
    if (GX,Part1Row) in BeaconSet:
        continue
    for u in Part1RelevantSensorList:
        SX, SY, Radius = u
        Distance = abs(GX-SX) + abs(Part1Row-SY)
        if Distance <= Radius:
            Part1Answer += 1
            break

def CheckPointForInRanges(PX, PY):
    InAnyRadius = False
    for SX, SY, Radius in SensorList:
        if abs(SX-PX) + abs(SY-PY) <= Radius:
            InAnyRadius = True
            break
    return InAnyRadius


def YieldCoordinates(SX, SY, Radius):
    print("Activated")
    MaxRange = 4000000
    for d in range(Radius+1):
        PX, PY = SX-Radius+d-1, SY+d
        if PX > MaxRange or PX < 0 or PY > MaxRange or PY < 0:
            continue
        yield (PX, PY)
    for d in range(Radius+1):
        PX, PY = SX+d, SY+Radius-d+1
        if PX > MaxRange or PX < 0 or PY > MaxRange or PY < 0:
            continue
        yield (PX, PY)
    for d in range(Radius+1):
        PX, PY = SX+Radius-d+1, SY-d
        if PX > MaxRange or PX < 0 or PY > MaxRange or PY < 0:
            continue
        yield (PX, PY)
    for d in range(Radius+1):
        PX, PY = SX-d, SY-Radius+d-1
        if PX > MaxRange or PX < 0 or PY > MaxRange or PY < 0:
            continue
        yield (PX, PY)
    yield -1, -1

    
for v, s in enumerate(SensorList):
    print(v)
    SX, SY, Radius = s
    CoordinateGenerator = YieldCoordinates(SX, SY, Radius)
    CoordinateFound = False
    for t in range(Radius*4):
        PX, PY = next(CoordinateGenerator)
        if PX == -1 and PY == -1:
            break
        if not(CheckPointForInRanges(PX, PY)):
            CoordinateFound = True
            FX, FY = PX, PY
            break
    if CoordinateFound:
        break

Part2Answer = FX*4000000 + FY
      
print(f"{Part1Answer = }")
print(f"{Part2Answer = }")