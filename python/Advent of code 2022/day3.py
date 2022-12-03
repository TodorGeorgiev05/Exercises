# I can't to write this task, so i found out solution and take it, and change some things, next year without help :)

file = open("input3.txt", "r")

packs = file.read().split("\n")

sum_priorities = 0

def get_value(item_char):
  value = 0
  if item_char.lower() == item_char:
    value = ord(item_char) - 96
  else:
    value = ord(item_char) - 38

  return value

# ----- part 1 ------

for pack in packs:
  totalNumberOfItems = len(pack)
  middleIndex = int(totalNumberOfItems / 2)
  seen_items = {}
  for idx, item in enumerate(pack):
    if idx < middleIndex:
      seen_items[item] = 1
    else:
      if item in seen_items:
        sum_priorities = sum_priorities + get_value(item)
        break

print(sum_priorities)

# ------ part 2 -------

sum_priorities = 0
seen_items = {}

for idx, pack in enumerate(packs):
  for item in pack:
    if item in seen_items:
      seen_items[item].add(idx)
      if len(seen_items[item]) == 3:
        sum_priorities = sum_priorities + get_value(item)
        seen_items = {}
        break
    else:
      seen_items[item] = {idx}
  

print(sum_priorities)