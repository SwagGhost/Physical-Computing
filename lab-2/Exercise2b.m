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
% We define the minimum distance to the object:
minDistance = 25;
% We define the maximum distance to the object. If the robot is at a distance of more than 100 to the object, then it will move faster.
maxDistance = 100;
% We define the average distance to object. This distance should be kept while following the object:
averageDistance = 50;
vec_index = 1;
% We use a variable x to determine when we swant the condiition for
% the while-loop to be true. Thus, we use this variable to exit the
% while-loop when it is the right moment (i.e. when the object is
% standing still):
x = 1
% We use a while-loop and at the beginning the condition of the
% while-loop is true (x = 1, which means that x > 0), but it is not
% true if x becomes less than or equal to zero:
while (x > 0)
	% The ultrasonic sensor measures the distance to the object it
    % is following and this value (the distance to the object is
    % stored as an element with the index vec_index in the vector:
    val(vec_index) = GetUltrasonic (SENSOR_1);
    % If the distance to the object is greater than the maximum
    % distance (maxDistance):
    % increase speed so that the robot is not far behind
    % the object.
    if val(vec_index) > maxDistance
        % The speed of the robot is increased so that the robot is
        % not far behind the object:
        mAC = NXTMotor ('AC', 'Power', 40);
        mAC.SendToNXT ();
    % We end the if-statement:
    end
    % If the distance is less than or equal to the minimum
    % distance:
    % first check whether the object has stopped or slowed down
    if val(vec_index) <= minDistance
        % First, the robot stops
        mAC.Stop ('brake');
        % The robot stops for three seconds to make sure whether
        % the object has stopped moving or slowed down:
        pause(3);
        % The robot measures the distance to the object:
        pause_distance = GetUltrasonic (SENSOR_1);
        % If the pause_distance is the same or less than the
        % measured distance before the robot stopped, then the
        % object has stopped:
        if pause_distance <= val(vec_index)
            % So, we stop the robot from moving:
            mAC.Stop ('off')
            % By assigning the value zero to the variable x, the
            % condition for the while-loop (condition: x must be
            % bigger than zero) is false and thus, we will exit
            % the while-loop:
            x = 0;
        % We end the if-statement:
        end
        % We end the if-statement:
    end
    % Before the end of the while-loop, we increment our variable
    % vec_index by one, so we can store the next obtained value
    % (the distance to the object) from the ultrasonic sensor if
    % the the loop is executed again:
    vec_index = vec_index + 1;
    % This process happens every 0,1 seconds. We do this every 0,1
    % seconds, because we want to measure the distance to the
    % object every 0,1 seconds:
    pause (0.1);
% We end the while-loop:
end