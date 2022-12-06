import numpy as np
import re


inFile = 'input5.txt'

# def testFunc(testFile: str, realSolution: str, part: int) -> None:          # trying to use a test function from now on
#     if part == 1:
#         mySolution = partOne(testFile)
#     else:
#         mySolution = partTwo(testFile)

#     if mySolution == realSolution:
#         print('TEST PASSED!')
#     else:
#         print('TEST NOT PASSED')
#         print('Your output', mySolution)
#         print('Good output', realSolution)



def partOne(inFile: str) -> str:
    # a bit of a brute force to create a "crate matrix"
    # basically the input crate layout rotated by 90 degress
    with open(inFile) as f:
        data = []
        for idx, line in enumerate(f):
            if line[1] == '1':
                break
            else:
                strLine = line.strip('\n').replace('    ', '0').replace('[', '').replace(']', '').replace(' ', '')  # replace the empty values with zeros, so later we can rotate the matrix by transposing it
                data.append([*strLine])
        
        data = np.array(data).T[:,::-1]         # here is the transposing and revrsing the order to have the upper crates at the end of the lists

        data2 = []
        for i in data:                          # removing the zeros
            row = []
            for j in i:
                if j != '0':
                    row.append(j)
            data2.append(row)

        # here is the actual execution of the crane commands
        # removing and appending the appropriate values from the end of the lists
        for line in f.readlines()[1:]:
            inst = list(map(int, re.findall(r'\d+', line)))
            for i in range(inst[0]):
                data2[inst[2]-1].append(data2[inst[1]-1][-1])
                data2[inst[1]-1].pop()       

    return ''.join([i.pop() for i in data2])

print('1',partOne(inFile))

def partTwo(inFile: str) -> str:
    # again, matrix creation
    with open(inFile) as f:
        data = []
        for idx, line in enumerate(f):
            if line[1] == '1':
                break
            else:
                strLine = line.strip('\n').replace('    ', '0').replace('[', '').replace(']', '').replace(' ', '')
                data.append([*strLine])

        data = np.array(data).T[:,::-1]

        data2 = []
        for i in data:
            row = []
            for j in i:
                if j != '0':
                    row.append(j)
            data2.append(row)
        
        # almost the same as before, but instead of popping the last values one by one
        # we pop the last interval of values
        for line in f.readlines()[1:]:
            inst = list(map(int, re.findall(r'\d+', line)))
            data2[inst[2]-1].extend(data2[inst[1]-1][-inst[0]:])
            del data2[inst[1]-1][-inst[0]:]

    return ''.join([i.pop() for i in data2])

print('2',partTwo(inFile))