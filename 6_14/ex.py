import string

inTable = string.ascii_lowercase
outTable = inTable[2:] + 'ab'


if __name__=="__main__":
    input = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
    input2 = "http://www.pythonchallenge.com/pc/def/map.html"
    transTable = str.maketrans(inTable, outTable)
    print(input.translate(transTable))
    print(input2.translate(transTable))

