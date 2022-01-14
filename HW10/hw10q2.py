
import sys
#encode transition table as a dictionary (with tuples as keys)
transitionDict = {('q0', 'a'): 'q1', ('q0', 'b'): 'q3', ('q0', 'c'): 'q5',
					('q1', 'a'): 'q0', ('q1', 'b'): 'q2', ('q1', 'c'): 'q6',
					('q2', 'a'): 'q3', ('q2', 'b'): 'q1', ('q2', 'c'): 'q7', 
					('q3', 'a'): 'q2', ('q3', 'b'): 'q0', ('q3', 'c'): 'q4', 
					('q4', 'a'): 'q7', ('q4', 'b'): 'q5', ('q4', 'c'): 'q3', 
					('q5', 'a'): 'q6', ('q5', 'b'): 'q4', ('q5', 'c'): 'q0',
					('q6', 'a'): 'q5' , ('q6', 'b'): 'q7', ('q6', 'c'): 'q1',
					('q7', 'a'): 'q4', ('q7', 'b'): 'q6', ('q7', 'c'): 'q2',}
#make a list including all accepting states 
acceptingStates= ['q1', 'q2', 'q3', 'q4', 'q5', 'q6', 'q7'] 
state = 'q0'
#for each input in the command line
for input in sys.argv[1:]:
	if (state, input) in transitionDict:
		state=transitionDict[(state, input)]
		#print (state) #used to check the steps in between 
	else:
		state = 'reject'
		break
if state in acceptingStates:
	print ("Accept")
else:
	print ("Reject") 
