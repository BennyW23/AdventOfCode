card_key = 10212254
door_key = 12577395

done = False
magic_mod = 20201227
value = 1
subject_number = 7
card_loop_size = 1
door_loop_size = 1
card_continuing = True
door_continuing = True
while card_continuing or door_continuing:
    value = (value * subject_number) % magic_mod
    if value == card_key:
        card_continuing = False
    elif value == door_key:
        door_continuing = False
    card_loop_size += int(card_continuing)
    door_loop_size += int(door_continuing)

value = 1
subject_number = door_key
for i in range(card_loop_size):
    value = (value * subject_number) % magic_mod

print(value)
