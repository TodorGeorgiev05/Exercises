with open("input1.txt") as file:
        list = []
        countOfElfs = 0
        for calorie in [line.rstrip() for line in file.readlines()]:
            if calorie:
                countOfElfs += int(calorie)
            else:
                list.append(countOfElfs)
                countOfElfs = 0

        print(max(list))

        print(sum(sorted(list, reverse=True)[0:3]))