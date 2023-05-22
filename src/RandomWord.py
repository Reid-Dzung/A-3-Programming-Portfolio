import random

rootList = ['ambi', 'mal', 'sect', 'hetero', 'homo', 'bio', 'voc', 'chron', 'dict', 'mort', 'form', 'rupt', 'port', 'hypo', 'micro', 'auto', 'dyna', 'graph', 'nym', 'phil']
rootListDef = ['both.', 'the bad.', 'looked at.', 'the different.', 'the same.', 'the life.', 'called.', 'the time.', 'speaking.', 'from death.', 'the shape.', 'to  break.', 'to carry.', 'below.', 'the small.', 'the self.', 'the power.', 'the writing.', 'the name.', 'the love.']

suffixList = ['able', 'ed', 'en', 'er', 'est', 'ful', 'ic', 'ing', 'ion', 'tion', 'ation', 'ity', 'ty', 'less', 'ly', 'ment', 'ness', 'es', 'y', 'ous']
suffixListDef = ['Can be', 'The past tense of', 'An object made of', 'The one who', 'The most', 'Full of', 'Having characteristics of', 'The present participle', 'The process', 'The process', 'The act', 'The state of', 'The state of', 'Without', 'How something is', 'The state of being', 'The condition of', 'More than one', 'Characterized by', 'Having qualities of']

prefixList = ["anti", "de", "dis", "en", "fore", "inter", "mid", "mis", "non", "over", "pre", "re", "semi", "sub", "super", "trans", "un", "under", "il", "in"]
prefixListDef = ["against", "opposite", "not", "cause to", "before", "between", "middle of", "wrongly", "not", "over", "before", "again", "half", "under", "above", "across", "not", "under", "not", "in"]

while True:
  repeatNum = input("How many words (digits only): ")
  if(repeatNum.isdigit() == True):
    if(int(repeatNum) < 101):
      break
    else:
      print('Too many words. Try again.')
  else:
    print('Please only input digits.')
    
for var in list(range(int(repeatNum))):
  valPre = random.randint(0, 19)
  word = prefixList[valPre]
  
  valRoot = random.randint(0, 19)
  word += rootList[valRoot]
  
  valSuf = random.randint(0, 19)
  word += suffixList[valSuf]

  print(word) #print word
  print(suffixListDef[valSuf], prefixListDef[valPre], rootListDef[valRoot] + "\n") #print definition
  
  