function recognition(features,samples,numwords)
x = features;
 
filename = samples;
d = [zeros(1, filename)];
 
for k = 1:8
	% Index is equal to k:
    	index = k;
    	filename = ['sample', num2str(index)];
load(filename);
% The variable has the value of samples:
    	d(k) = norm(x - variable);
end
[minimum,index] = min(d);
identified_symbol = mod(index, numwords);
if (identified_symbol == 0)
    identified_symbol = numwords;
else
    identified_symbol;
end
% Close all previously opened connections:
COM_CloseNXT('all');
close all;
% We open an USB-port connection to the robot:
open = COM_OpenNXT();
COM_SetDefaultNXT(open);
if (minimum < 2.4)
switch(identified_symbol)
	%' Case 1 and 2 if the word 'left' is said:
    	case 1
disp('left');
           % The robot turns to the left:
   		mA = NXTMotor('A', 'Power', 30);
    		mC = NXTMotor('C', 'Power', 15);
		% We make the robot move:
   		mA.SendToNXT();
  		mC.SendToNXT();
    		pause (1);
    case 2
        disp('left');
           % The robot turns to the left:
   		mA = NXTMotor('A', 'Power', 30);
    		mC = NXTMotor('C', 'Power', 15);
		% We make the robot move:
   		mA.SendToNXT();
  		mC.SendToNXT();
    pause (1);
	% Case 3 and 4 are for the ?stop? command:
    case 3
       	 disp('stop');
% We make the robot stop:
        	mAC.Stop('brake');
    case 4
        	disp('stop');
% We make the robot stop:
         	mAC.Stop('brake');
% Case 5 and 6 are for the ?forward? command:
    case 5
        	disp('forward');
		% The robot goes straight forward:
   		mAC = NXTMotor ('AC', 'Power', 15);
    		The motors make the robot move:
		% We make the robot move:
   		mAC.SendToNXT();
   case 6
        disp('forward');
		% The robot goes straight forward:
   		mAC = NXTMotor ('AC', 'Power', 15);
    		The motors make the robot move:
		% We make the robot move:
   		mAC.SendToNXT();
% Case 7 and 8 are for the ?right? command:
    case 7
        	disp('right');
		% The robot goes right:
   		mC = NXTMotor ('C', 'Power', 15);
   		mA = NXTMotor ('A', 'Power', 30);
		% We make the robot go to the right:
   		mC.SendToNXT();
   		mA.SendToNXT();
 case 8
        disp('right');
		% The robot goes right:
   		mC = NXTMotor ('C', 'Power', 15);
   		mA = NXTMotor ('A', 'Power', 30);
		% We make the robot go to the right:
   		mC.SendToNXT();
   		mA.SendToNXT();
        
end
% Else: if the word is not recognized:
else
disp('say it again');
end
 


