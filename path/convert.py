import os
try:
    import comtypes.client
except:
    os.exec("pip install comtypes")
    import comtypes.client

def DOCtoPDF(inputFileName, outputFileName, formatType = 17):
    word = comtypes.client.CreateObject('Word.Application')
    doc = word.Documents.Open(inputFileName)
    if outputFileName[-4:] != '.pdf':
        outputFileName = outputFileName + ".pdf"
    doc.SaveAs(outputFileName, FileFormat=formatType)
    doc.Close()
    word.Quit()


def PPTtoPDF(inputFileName, outputFileName, formatType = 32):
    powerpoint = comtypes.client.CreateObject("Powerpoint.Application")
    if outputFileName[-4:] != '.pdf':
        outputFileName = outputFileName + ".pdf"
    deck = powerpoint.Presentations.Open(inputFileName)
    deck.SaveAs(outputFileName, formatType) # formatType = 32 for ppt to pdf
    deck.Close()
    powerpoint.Quit()


def allppts(PATH = ""):
    # PATH = r"D:\Study\college\3sem\DSA\thurai"
    os.chdir(PATH)
    ls = os.listdir()
    ls = [i for i in ls if "ppt" in i]
    print(ls)
    print(len(ls))
    for i in ls:
        PPTtoPDF(PATH + "\\" + i, PATH + "\\" + i[:-4])
    for i in ls:
        os.remove(i)


def alldocs(PATH = ""):
    # PATH = r"D:\Study\college\3sem\DSA\thurai"
    os.chdir(PATH)
    ls = os.listdir()
    ls = [i for i in ls if "doc" in i]
    print(ls)
    print(len(ls))
    for i in ls:
        DOCtoPDF(PATH + "\\" + i, PATH + "\\" + i[:-4])
    for i in ls:
        os.remove(i)


if __name__ == '__main__':
    PATH = os.getcwd()
    alldocs(PATH)
    allppts(PATH)
