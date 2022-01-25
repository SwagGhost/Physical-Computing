% This code makes robot drive. The robot stops in front of first
% encountered fixed obstacle. We detect the obstacle by using the
% ultrasound sensor by sending out a sound with a frequency that is
% beyond human hearing; Then, the time of flight, the time it takes
% for the sound to be reflected back, is measured. This time of
% flight (ToF) is then multiplied by the sound speed (this is a
% constant that is equal to 300 m/s) and then this value is also
% divided by two. This formula is used: ToF * c / 2; Now, the
% distance to the object is calculated.
% Instead of the following four lines indicated as
% line 1, 2, 3, and 4, we use the command ?>> setup Exercise 3?.
% COM_CloseNXT('all');		% line 1
% close all;                % line 2
% open = COM_OpenNXT();		% line 3
% COM_SetDefaultNXT(open);	% line 4
% So, our actual code begins here:
% We want our robot to move straight forward with 30% of its maximum
% speed:
mAC = NXTMotor ('AC', 'Power', 30);
% We open the ultrasonic sensor of the robot:
OpenUltrasonic (SENSOR_1);
% Once we have set the speed and opened the ultrasonic sensor, we
% make the robot move at the desired speed:
mAC.SendToNXT ();
% We determine the distance that the robot should keep to the object.
% This distance cannot be zero, because the ultrasonic sensor is
% placed not directly at the front of the robot:
minDistance = 30;
% The ultrasonic sensor will measure the distance to the object. We
% store this obtained value (the distance to the object) in a vector.
% So, we also need a variable which will be the index of our vector.
% We initialize the variable for the index of our vector:
vec_index = 1;
% We use a while-loop, because we want our robot to keep moving
% (unless the robot reaches the minimum distance to the object):
while (true)
    % The ultrasonic sensor obtains the value of the distance
    % between object and this value is stored as an element with
    % index vec_index in a vector:
    val(vec_index) = GetUltrasonic(SENSOR_1);
    % Stops if the distance is less than the minimum distance:
    if val(vec_index) < minDistance 
        mAC.Stop ('off');
    % We end the if-statement:
    end
    % Before the end of the while-loop, we increment our variable
    % vec_index by one, so we can store the next obtained value
    % from the ultrasonic sensor if the the loop is executed again:
    vec_index = vec_index + 1;
    % This process happens every 0,1 seconds. We do this every 0,1
    % seconds, because we want to measure the distance to the
    % object every 0,1 seconds:
    pause (0.1);
% We end the while-loop:
end