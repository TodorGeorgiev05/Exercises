dataForFirstTask = {"A X":4, "A Y":8, "B X":1, "A Z":3, "C X":7, "B Y":5, "B Z":9, "C Y":2, "C Z":6}
dataForSecondTask = {"A Y":4, "A Z":8 ,"B X":1, "A X":3, "C Z":7, "B Y":5, "B Z":9, "C X":2, "C Y":6}
raw_data = [x.strip() for x in open("input2.txt").read().split("\n")]
score1 = sum(dataForFirstTask[x] for x in raw_data)
score2 = sum(dataForSecondTask[x] for x in raw_data)
print("First:",score1)
print("Second:", score2)