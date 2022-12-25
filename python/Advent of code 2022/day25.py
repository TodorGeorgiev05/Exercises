def snafu_to_decimal(s):
    last_character = s[len(s) - 1]
    if last_character == "2":
        last_digit = 2
    if last_character == "1":
        last_digit = 1
    if last_character == "0":
        last_digit = 0
    if last_character == "-":
        last_digit = -1
    if last_character == "=":
        last_digit = -2
    if len(s) == 1:
        return last_digit
    return 5 * snafu_to_decimal(s[0:len(s) - 1]) + last_digit
 
def decimal_to_snafu(i):
    s = "2"
    while snafu_to_decimal(s) < i:
        s += "2"
    for p in range(0, len(s)):
        for new_digit in ["1", "0", "-", "="]:
            new_s = s[0:p] + new_digit + s[p+1:len(s)]
            if snafu_to_decimal(new_s) >= i:
                s = new_s
    return s
 
total = 0
 
input_data = open(r"input25.txt")
for input_line in input_data.read().splitlines():
    input_line = input_line.replace("\n", "")
    total += snafu_to_decimal(input_line)
    
print (decimal_to_snafu(total))