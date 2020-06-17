import re
import urllib.request
import pickle

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

def getContent(current):

    return content


def test():
    url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=8022"
#    url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=12345"
    address = url.split('=')[0]
    with open("result.txt", 'w') as f:
        for i in range(10000):
            response = urllib.request.urlopen(url)
            content = response.read().decode("utf-8")
            f.write(content)
            f.write("\n")
            url = address + "=" + content.split()[-1]
            


def peakHell():            
    url = "http://www.pythonchallenge.com/pc/def/banner.p"
    response = urllib.request.urlopen(url)
    content = response.read()
    content = pickle.loads(content)
    for line in content:
        output(line)

def output(text):
    cur = ""
    for item in text:
        cur += item[1] * item[0]
    print(cur)

if __name__=="__main__":
    peakHell()