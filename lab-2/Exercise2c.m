% Instead of the following four lines indicated as
% line 1, 2, 3, and 4, we use the command ?>> setup Exercise 3?.
% COM_CloseNXT('all');		% line 1
% close all;                % line 2
% open = COM_OpenNXT();		% line 3
% COM_SetDefaultNXT(open);	% line 4
% So, our actual code begins here:
% We want our robot to move straight forward with 20% of its maximum
% speed:
mAC = NXTMotor ('AC', 'Power', 20);
% We open the ultrasonic sensor:
OpenUltrasonic (SENSOR_1);
% Once we have set the speed and opened the ultrasonic sensor, we
% make the robot move at the desired speed:
mAC.SendToNXT ();
% Open ultrasonic sensor:
OpenUltrasonic (SENSOR_1);
% Opens left light sensor:
OpenLight (SENSOR_2,'ACTIVE');
% Opens right light sensor
OpenLight (SENSOR_3,'ACTIVE');
% Both light sensors will detect if the robot is encountering the black line. And the ultrasonic sensor will detect if the robot encounters an object.
% We detect the surface and we store the obtained value which represents the colour (in our case: either black or white). We want to store these values and we store these values in a vector. So, we also need variable which will the index of our vector. Here we initialize the variable which will be the index of our vector:
vec_index = 1;
minDistance = 25;
maxDistance = 100;
averageDistance = 50;
x = 1
while (x > 0)
	% Reads sensor and puts the value into a vector
    val(vec_index) = GetUltrasonic (SENSOR_1);
    % If the distance is greater than the max distance
    % increase speed so that the robot is not far behind
    % the object.
    mAC = NXTMotor ('AC', 'Power', 15);
	mAC.SendToNXT(); % Motors make the robot move
	% We want to obtain values of the surface to detect if the
    % robot is encountering the black line. We get the values from
    % both sensors. We store both values in two different vectors.
    % One vector is for the left light sensor:
	vec_val_2(vec_index) = GetLight(SENSOR_2); % Left sensor
    % And the other vector is for the right light sensor:
    vec_val_3(vec_index) = GetLight(SENSOR_3); % Right sensor
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
        % Robot turns
        mA = NXTMotor('A', 'Power', 15);
        mC = NXTMotor('C', 'Power', 30);
        mA.SendToNXT ();
        mC.SendToNXT ();
        pause (1);
    end % End if statement

    % If the value represents black
    if vec_val_3 (vec_index) < 400
        mAC = NXTMotor ('AC', 'Power', -20);
        mAC.SendToNXT ();
        pause(1);
        mC = NXTMotor ('C', 'Power', 15);
        mA = NXTMotor ('A', 'Power', 30);
        mC.SendToNXT ();
        mA.SendToNXT ();
        pause (1)
    end % End if statement

    if val(vec_index) > maxDistance
            mAC = NXTMotor ('AC', 'Power', 40);
            mAC.SendToNXT ();
    end % End if statement

    % If the distance is less than the minimum distance
    % first check whether the object has stopped or slowed down
    if val(vec_index) <= minDistance
        mAC.Stop ('brake');
        pause(3);
        pause_distance = GetUltrasonic (SENSOR_1);
        % If the distance is the same or less than the new
        % distance read the object has stopped.Therefore the robot 
        % must stop as well.
        if pause_distance <= minDistance
            mAC.Stop ('off')
            x = 0;
        end	% End if statement
    end % End if statement
    vec_index = vec_index + 1;
    pause(0.1);
end %End while loop