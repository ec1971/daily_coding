import re
import os
import urllib.request
import pickle
import zipfile


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

def zipping():
    p = re.compile("Next nothing is (\d+)")
    f = zipfile.ZipFile('./channel.zip')
    num = '90052'
    comments = []
    while True:
        comment = f.getinfo(num + '.txt').comment
        comments.append(comment.decode('utf-8'))
        next_file = f.read(num + '.txt')
        match = p.match(next_file.decode('utf-8'))
        if not match:
            break
        num = match.group(1)
    print("".join(comments))
        
    
                
def matched(text):
    return p.findall(text)

if __name__=="__main__":
    zipping()