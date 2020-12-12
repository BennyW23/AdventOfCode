inputs = [i.strip() for i in open("q12_input.txt", "r")]

x = 0
y = 0
# 0 for North, 1 for East, 2 for S and 3 for W
direction = 1

for line in inputs:
    command = line[0]
    value = int(line[1:])

    if command == "F":
        if direction == 0:
            command = "N"
        elif direction == 1:
            command = "E"
        elif direction == 2:
            command = "S"
        elif direction == 3:
            command = "W"

    if command == "N":
        y -= value
    elif command == "S":
        y += value
    elif command == "E":
        x += value
    elif command == "W":
        x -= value
    elif command == "L":
        amount = value / 90
        direction = (direction - amount) % 4
    elif command == "R":
        amount = value / 90
        direction = (direction + amount) % 4

print(abs(x) + abs(y))


def rotate(ccw_amount, waypoint_x, waypoint_y):
    ccw_amount = ccw_amount % 4
    if ccw_amount == 0:
        return waypoint_x, waypoint_y
    elif ccw_amount == 1:
        return waypoint_y, -1 * waypoint_x
    elif ccw_amount == 2:
        return -1 * waypoint_x, -1 * waypoint_y
    elif ccw_amount == 3:
        return -1 * waypoint_y, waypoint_x


waypoint_x = 10
waypoint_y = -1
ship_x = 0
ship_y = 0
# 0 for North, 1 for East, 2 for S and 3 for W
direction = 1

for line in inputs:
    command = line[0]
    value = int(line[1:])

    if command == "F":
        ship_x += value * waypoint_x
        ship_y += value * waypoint_y
    elif command == "N":
        waypoint_y -= value
    elif command == "S":
        waypoint_y += value
    elif command == "E":
        waypoint_x += value
    elif command == "W":
        waypoint_x -= value
    elif command == "L":
        amount = value / 90
        waypoint_x, waypoint_y = rotate(amount, waypoint_x, waypoint_y)
    elif command == "R":
        amount = value / 90
        waypoint_x, waypoint_y = rotate(-1 * amount, waypoint_x, waypoint_y)

print(abs(ship_x) + abs(ship_y))
