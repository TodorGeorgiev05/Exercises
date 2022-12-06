inputFile = open('input6.txt', 'r')
 
lines = inputFile.read().split("\n")
 
def marker_index(line, block_size):
    for i in range(len(line)):
        block = line[i:i+block_size]
        if len(set(block)) == block_size:
            return i + block_size
 
# part 1
for line in lines:
    print(marker_index(line, 4))
 
# part 2
for line in lines:
    print(marker_index(line, 14))