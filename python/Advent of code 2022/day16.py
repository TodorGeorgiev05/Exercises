from ast import literal_eval
from collections import defaultdict, Counter, deque
from itertools import product, combinations, permutations, count, pairwise
from heapq import heapify, heappop, heappush
from functools import lru_cache, reduce, cache
from copy import deepcopy
from math import lcm
from string import ascii_lowercase, ascii_uppercase


def part1():
    def dist(start):
        memo = defaultdict(lambda: float("inf"))
        memo[start] = 0
        queue = deque([(0, start)])
        while queue:
            cost, dest = queue.popleft()
            for dest in table[dest]:
                if cost + 1 < memo[dest]:
                    memo[dest] = cost + 1
                    queue.append((cost + 1, dest))
        return memo

    @cache
    def get_value(mask):
        total = 0
        for i, j in enumerate(larger):
            if mask & (1 << i):
                total += value[j]
        return total

    @cache
    def dp(minute, cur, mask):
        current_value = get_value(mask)
        if mask == (1 << len(larger))-1:
            return minute*current_value
        total = 0
        for i in range(len(larger)):
            if mask & (1 << i):
                continue
            remain_minute = max(0, minute - cost[(cur, larger[i])]-1)
            option = dp(remain_minute,
                        larger[i], mask ^ (1 << i)) + (minute-remain_minute)*current_value
            total = max(
                total, option)
        return total

    with open("input16.txt") as f:
        res = f.read().split("\n")
    table = defaultdict(list)
    value = defaultdict(int)
    for line in res:
        a, b = line.split(";")
        aa = a.split()
        value[aa[1]] = int(aa[-1].split("=")[-1])
        arr = b.split(', ')
        for ele in arr:
            table[aa[1]].append(ele.split()[-1])

    cost = defaultdict(lambda: float("inf"))
    for key in value.keys():
        item = dist(key)
        # print(key, item)
        for key2, val in item.items():
            cost[(key, key2)] = val
    larger = [i for i, j in value.items() if j > 0]
    larger = sorted(larger, key=lambda x: value[x], reverse=True)
    print(dp(30, "AA", 0))


def part2():
    def dist(start):
        memo = defaultdict(lambda: float("inf"))
        memo[start] = 0
        queue = deque([(0, start)])
        while queue:
            cost, dest = queue.popleft()
            for dest in table[dest]:
                if cost + 1 < memo[dest]:
                    memo[dest] = cost + 1
                    queue.append((cost + 1, dest))
        return memo

    @cache
    def get_value(mask):
        total = 0
        for i, j in enumerate(larger):
            if mask & (1 << i):
                total += value[j]
        return total

    def permute_generate(length):
        table = defaultdict(list)
        for i in range(2 << length):
            arr = []
            for j in range(length):
                if not (i & (1 << j)):
                    arr.append(j)
            table[i] = list(permutations(arr, 2))
        return table

    @cache
    def dp(minute, cur, cur2, mask, offset=None):
        current_value = get_value(mask)
        if mask == (1 << len(larger))-1:
            return minute*current_value
        elif minute == 0 and offset == None:
            return 0
        total = minute*current_value
        for i, j in permute[mask]:
            new_offset = None
            remain_minute = max(0, minute - cost[(cur, larger[i])]-1+offset[1]
                                ) if offset and offset[0] == 0 else max(0, minute - cost[(cur, larger[i])]-1)
            new_mask = mask ^ (1 << i)
            remain_minute2 = max(0, minute - cost[(cur2, larger[j])]-1+offset[1]
                                 ) if offset and offset[0] == 1 else max(0, minute - cost[(cur2, larger[j])]-1)
            early, late = max(remain_minute, remain_minute2), min(
                remain_minute, remain_minute2)
            pos = j if early == remain_minute2 else i
            new_mask2 = new_mask ^ (1 << j)
            if early > late:
                new_offset = (
                    0 if early == remain_minute else 1, early-late)
            new_val = (minute-early) * \
                current_value+(early-late) * \
                (current_value+value[larger[pos]])
            option2 = dp(late, larger[i], larger[j],
                         new_mask2, new_offset)+new_val
            total = max(total, option2)
        return total

    with open("input16.txt") as f:
        res = f.read().split("\n")
    table = defaultdict(list)
    value = defaultdict(int)
    for line in res:
        a, b = line.split(";")
        aa = a.split()
        value[aa[1]] = int(aa[-1].split("=")[-1])
        arr = b.split(', ')
        for ele in arr:
            table[aa[1]].append(ele.split()[-1])
    cost = defaultdict(lambda: float("inf"))
    for key in value.keys():
        item = dist(key)
        for key2, val in item.items():
            cost[(key, key2)] = val
    larger = [i for i, j in value.items() if j > 0]
    larger = sorted(larger, key=lambda x: value[x], reverse=True)
    permute = permute_generate(len(larger))
    print(dp(26, "AA", "AA", 0))


if __name__ == "__main__":
    part1()
    part2()