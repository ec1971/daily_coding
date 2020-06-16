import re

p = re.compile("[^A-Z][A-Z]{3}([a-z]){1}[A-Z]{3}[^A-Z]")
def matched(text):
    return p.findall(text)

def solve():
    count = 0
    with open('content.txt') as f:
        lines = f.readlines()
        for l in lines:
            if matched(l) !=None and len(matched(l)) > 0:
                count += 1
                print(matched(l))
    print(count)
            

if __name__=="__main__":
    solve()
