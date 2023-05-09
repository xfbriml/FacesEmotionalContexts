#Before Experiment

from numpy.random import random, randint, normal, shuffle
import xlrd

#Begin Experiment

expNumber = 0

import xlrd #Version 1.2.0 or below
import random
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice as randchoice


import xlrd #Version 1.2.0 or below
import random

#create Face Class to atribute an index to each file
class Image:
    def __init__(self, emoContext, neutralFace, index):
        self.emoContext = emoContext
        self.neutralFace = neutralFace
        self.index = index
    def __repr__(self):
        return str(self.index)

#Open xlsx file.
in_file = './ImageFile.xlsx'
inbook = xlrd.open_workbook(in_file)
insheet = inbook.sheet_by_index(0)

#num of study items
num_study = 180
num_new = 180

#arrays for our stimuli
faces = []
newFaces = []


#read the stimuli from our sheet
for excelRow in range(0,num_study):
    
    #read in the values of all columns on this row
    row = insheet.row_values(excelRow + 1)

    #Create instance of Face with both filename and index
    face = Image(row[0], row[2], row[3])
    
    #print row[0]
    #saving the word to word array
    faces.append(face)

print(faces)

random.shuffle(faces);
random.shuffle(newFaces);
insheet = inbook.sheet_by_index(1)


for excelRow in range (0,num_new):
    row = insheet.row_values(excelRow + 1)
    newFaces.append(row[0])


experimentSeries = []

sets = 9 # 9 blocos
facesPerSet = 20

for set in range(sets):
    currentSerie = []

    for face in range (facesPerSet):
        currentSerie.append(faces[(set * 20) + face])
       
    experimentSeries.append(currentSerie)
    
    

Jitter = random() * (1.5 - 1.0) + 1.0

#Begin Routine Study Code

def getEmotionFile(face):
    return face.emoContext

def getNeutralFile(face):
    return face.neutralFace

def getIndex(face):
    return face.index

EmotionalOrder = 0
NeutralFaceOrder = 0


indexes = map(getIndex, experimentSeries[expNumber]);



def _unicode_(self):
        return self.some_field or u'None'





emotionFilePerSet = list(map(getEmotionFile, experimentSeries[expNumber])); #Se você alterar o expNumber, você vai pro próximo bloco
print (emotionFilePerSet);
CallEmotional = emotionFilePerSet [EmotionalOrder];

import xlrd #Version 1.2.0 or below
import random
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice as randchoice

import xlrd #Version 1.2.0 or below
import random

length = 20;

if NeutralFaceOrder == 0:
    neutralFacesFilePerSet = list(map(getNeutralFile, experimentSeries[expNumber]))
    
    testFacesFilePerSet = list(map(getNeutralFile, experimentSeries[expNumber]))
    
    random.shuffle(neutralFacesFilePerSet)


    
    print(testFacesFilePerSet)

    testFacesFilePerSet.extend(newFaces[expNumber*20:length*(expNumber+1)])
    random.shuffle(testFacesFilePerSet);

print (len(testFacesFilePerSet))

CallNeutralFace = neutralFacesFilePerSet [NeutralFaceOrder];
    

print (neutralFacesFilePerSet)

CallTestFace = testFacesFilePerSet [NeutralFaceOrder] 
print (testFacesFilePerSet)

print (range(NeutralFaceOrder))

#Begin Routine Before Study Trial

CallNeutralFace = neutralFacesFilePerSet [NeutralFaceOrder];
CallEmotional = emotionFilePerSet [EmotionalOrder];

#End Routine Before Study Trial

  #log the current face and context to our data file
  EmotionalOrder = EmotionalOrder + 1
  thisExp.addData('contextfile', CallEmotional)





  NeutralFaceOrder = NeutralFaceOrder + 1

  print (neutralFacesFilePerSet);


  thisExp.addData('facesfile_study', CallNeutralFace)


  #End Routine Study Context
  
    check_trial_number = randint(low = 0, high = 40)

if check_trial_number == 0:
    docheck = 1
else:
    docheck = 0
    
 
#Begin Routine Instruction Before Test

NeutralFaceOrder = 0

#Begin Routine Code Before Test Trial

CallTestFace = testFacesFilePerSet [NeutralFaceOrder] 

print(NeutralFaceOrder)

#End Routine Test Trial

thisExp.addData('facesfile_test', CallTestFace)

NeutralFaceOrder=NeutralFaceOrder+1


#Code CounterBlocks Begin Routine

expNumber = expNumber +1






