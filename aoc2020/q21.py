lines = [line.strip() for line in open("q21_input.txt", "r").read().strip().split("\n")]

allergen_map = {}
ingredient_count = {}
for line in lines:
    ingreds, allergens = line.split("(")
    ingreds = ingreds.strip().split()
    allergens = [value.strip(",") for value in allergens[:-1].split(" ")[1:]]
    for ingredient in ingreds:
        ingredient_count[ingredient] = ingredient_count.get(ingredient, 0) + 1
    for allergen in allergens:
        if allergen not in allergen_map:
            allergen_map[allergen] = set(ingreds)
        else:
            allergen_map[allergen] = allergen_map[allergen].intersection(set(ingreds))

allergens = set.union(*[allergen for allergen in allergen_map.values()])
safe_ingredients = set(ingredient_count.keys()).difference(allergens)

print(sum([ingredient_count[ing] for ing in safe_ingredients]))

known = set()
while len(allergen_map) > 0:
    for allergen, ingreds in allergen_map.items():
        if len(ingreds) == 1:
            isolated_allergen = allergen
            isolated_ingred = ingreds.pop()
            known.add((allergen, isolated_ingred))
            break

    for ingreds in allergen_map.values():
        ingreds.discard(isolated_ingred)

    allergen_map.pop(isolated_allergen)

known = list(known)
known.sort(key=lambda tuple: tuple[0])
print(known)
print(",".join([tup[1] for tup in known]))
