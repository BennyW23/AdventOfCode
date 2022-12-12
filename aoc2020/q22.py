def recursive_combat(deck_1, deck_2):
    seen_before = set()
    infinite = False
    while len(deck_1) > 0 and len(deck_2) > 0:
        if (tuple(deck_1), tuple(deck_2)) in seen_before:
            infinite = True
            break
        seen_before.add((tuple(deck_1), tuple(deck_2)))
        card_1 = deck_1.pop(0)
        card_2 = deck_2.pop(0)
        if len(deck_1) >= card_1 and len(deck_2) >= card_2:
            winner, score = recursive_combat(deck_1[:card_1], deck_2[:card_2])
        else:
            if card_1 > card_2:
                winner = 1
            else:
                winner = 2
        if winner == 1:
            deck_1.append(card_1)
            deck_1.append(card_2)
        else:
            deck_2.append(card_2)
            deck_2.append(card_1)

    if infinite or len(deck_2) == 0:
        winner = 1
        winning_deck = deck_1
    else:
        winner = 2
        winning_deck = deck_2

    score = 0
    for count, value in enumerate(winning_deck[::-1]):
        score += (count + 1) * value

    return winner, score


decks = [lines.strip() for lines in open("q22_input.txt", "r").read().strip().split("\n\n")]

deck_1 = [int(val) for val in decks[0].split("\n")[1:]]
deck_2 = [int(val) for val in decks[1].split("\n")[1:]]


r = 1
while len(deck_1) > 0 and len(deck_2) > 0:
    card_1 = deck_1.pop(0)
    card_2 = deck_2.pop(0)
    if card_1 > card_2:
        deck_1.append(card_1)
        deck_1.append(card_2)
    else:
        deck_2.append(card_2)
        deck_2.append(card_1)


winner = deck_1 if len(deck_1) > 0 else deck_2
score = 0
for count, value in enumerate(winner[::-1]):
    score += (count + 1) * value

print(score)

deck_1 = [int(val) for val in decks[0].split("\n")[1:]]
deck_2 = [int(val) for val in decks[1].split("\n")[1:]]

winner, score = recursive_combat(deck_1, deck_2)
print(score)
