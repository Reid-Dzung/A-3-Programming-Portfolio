# Reid Nguyen | Number Game | 02/01/2023
import random
randNum = random.randint (1,100)
print (randNum)
atemmpt = 0
play = True
guess = input("Welcome to Number Guesser, Try to Guess a Number  Between 1 and 100 in as Few  Tries as Posible: ")
inLoop = True
while guess != randNum:
  if (str(guess).isdigit() == False):
    print("It Must Be a Number")
  elif int(guess)<1:
    print("The Number Must Be Between 1 and 100")
  elif int(guess)>100:
    print("The Number Must Be Between 1 and 100")

  while inLoop == True:
    if int(guess) > randNum:
      print(guess + " Is Too High")
      atemmpt += 1
      guess = input("New Guess:")
    elif int(guess) < randNum:
      print(guess + " Is Too Low")
      guess = input ("New Guess:")
      atemmpt += 1
    elif int(guess) == randNum:
      inLoop = False
      print ("You Guess the Number in " + str(atemmpt) + " tries") 
      atemmpt += 1
   
  if input("Want to Play Again? (y/n): ") == "n":
      play = False
      print("Thanks For Playing")
  else:
      randNum = random.randint (1,100)
      atemmpt = 0
      inLoop = True
      guess = input("Welcome to Number Guesser, Try to Guess a Number  Between 1 and 100 in as Few  Tries as Posible:  ")
      
    