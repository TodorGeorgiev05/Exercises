# tasks from advent of code 2022 day 1
with open("input1.txt") as input:
        list = []
        elf = 0
        for calorie in [line.rstrip() for line in input.readlines()]:
            if calorie:
                elf += int(calorie)
            else:
                list.append(elf)
                elf = 0

        print(max(list))

        print(sum(sorted(list, reverse=True)[0:3]))
