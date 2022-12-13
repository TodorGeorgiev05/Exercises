class Point:
    directions = {"U": (0, -1), "R": (1, 0), "D": (0, 1), "L": (-1, 0)}

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __repr__(self):
        return f"({self.x}, {self.y})"

    def to_tuple(self):
        return self.x, self.y

    def move(self, direction):
        self.x += Point.directions[direction][0]
        self.y += Point.directions[direction][1]

    def move_toward(self, point):
        dx, dy = self.manhattan(point)
        adx, ady = abs(dx), abs(dy)
        if adx == 2:
            self.x += 1 if dx > 0 else -1
            if ady == 1:
                self.y += dy
        if ady == 2:
            self.y += 1 if dy > 0 else -1
            if adx == 1:
                self.x += dx

    def manhattan(self, point):
        return point.x - self.x, point.y - self.y

with open("input9.txt") as file:
    moves = [(dir, int(steps)) for dir, steps in (line.split() for line in file)]

    rope = [Point(0, 0) for _ in range(10)]
    visited1 = {rope[1].to_tuple()}
    visited2 = {rope[-1].to_tuple()}
    for dir, steps in moves:
        for step in range(steps):
            rope[0].move(dir)
            for i in range(1, len(rope)):
                rope[i].move_toward(rope[i - 1])
            visited1.add(rope[1].to_tuple())
            visited2.add(rope[-1].to_tuple())

    print(len(visited1))
    print(len(visited2))