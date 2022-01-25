% Instead of the following four lines indicated as
% line 1, 2, 3, and 4, we use the command ?>> setup Exercise 3?.
% COM_CloseNXT('all');		% line 1
% close all;                % line 2
% open = COM_OpenNXT();		% line 3
% COM_SetDefaultNXT(open);	% line 4
% So, our actual code begins here:
% The left light sensor is opened:
OpenLight (SENSOR_2,'ACTIVE');
% The right light sensor is opened:
OpenLight (SENSOR_3,'ACTIVE');
% Both sensors detect if the robot is encountering the black line.
% The sensors detect the surface and we store the obtained value
% which represents the colour (in our case: either black or white).
% We store these values in two vectors, one vector for each sensor.
% So, we also need a variable which will be the index of our vector.
% We initialize the variable for the index of our vector:
vec_index = 1;
% We use a while loop, because we want our robot to keep moving:
while (true)
	% We make an object for both motors. We set the speed of the
    % motors to 15 (which is 15% of the maximum speed):
	mAC = NXTMotor ('AC', 'Power', 15);
	% The motors make the robot move:
    mAC.SendToNXT();
    % We want to obtain values of the surface to detect if the
    % robot is encountering the black line. We get the values from
    % both sensors. We store both values in two different vectors.
    % One vector is for the left light sensor:
	vec_val_2(vec_index) = GetLight(SENSOR_2);
	% And the other vector is for the right light sensor:
    vec_val_3(vec_index) = GetLight(SENSOR_3);
    % If the left light sensors detects black:
    if vec_val_2(vec_index) < 400
        % The robot will first move backwards. We achieve this by
        % using a negative value for the speed. The robot will
        % move backwards with a speed of this value multiplied by
        % minus one (-20 * -1 = 20):
        mAC = NXTMotor('AC', 'Power', -20);
        % Now, the robot moves backwards with a speed of 20:
        mAC.SendToNXT ();
        pause(1);
        % The robot turns:
        mA = NXTMotor('A', 'Power', 15);
        mC = NXTMotor('C', 'Power', 30);
        mA.SendToNXT ();
        mC.SendToNXT ();
        pause (1);
    % We end the if-statement:
    end

    % If the right sensors detects black:
    if vec_val_3 (vec_index) < 400
        % We do the same when the right light sensor detects the
        % black line 
        mAC = NXTMotor ('AC', 'Power', -20);
        mAC.SendToNXT ();
        pause(1);
        % The robot turns:
        mC = NXTMotor ('C', 'Power', 15);
        mA = NXTMotor ('A', 'Power', 30);
        mC.SendToNXT ();
        mA.SendToNXT ();
        pause (1)
    % We end the if-statement:
    end
    % Before the end of the while-loop, we increment our variable
    % vec_index by one, so we can store the next obtained values
    % from the light sensors if the the loop is executed again:
    vec_index = vec_index + 1;
    % This process happens every 0,1 seconds. We do this every 0,1
    % seconds, because we want to detect the value of the surface
    % every 0,1 seconds:
    pause (0.1);
% We end the while-loop:
end