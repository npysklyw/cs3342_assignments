import sys
import re

#Open the sample file
f = open(sys.argv[1], "r")

#Create a new file with removed comments
outF = open(sys.argv[2], "w")

#Used to track if when parsing the document if we encounter a multline comment
memory = 0

#Go through each line of the file
for line in f:

       if (re.search(r"(\/\*)(.+?)(?=[\n\r]|\*\))", line)):# If line starts with a /* for c++ multiline comments
           memory = 1
           outF.write(re.sub(r"(\/\*)(.+?)(?=[\n\r]|\*\))", "", line))
       elif (memory == 1): #If we are in a multiline comment
           if (re.search(r"\*\/$", line)): #If multiline comment ends
               memory = 0 #We are no out of the state of being in a comment
       else:
          outF.write(re.sub(r"(\/\/)(.+?)(?=[\n\r]|\*\))","",line)) #Remove any singleline comment, only replace this part with nothing
f.close()
outF.close()

