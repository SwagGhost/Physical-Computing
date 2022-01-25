% We used the variables val_white and val_black which we determined
% by calibration (as we described earlier):

% Instead of the following four lines indicated as
% line 1, 2, 3, and 4, we use the command ?>> setup Exercise 3?.
% COM_CloseNXT('all');		% line 1
% close all;                % line 2
% open = COM_OpenNXT();		% line 3
% COM_SetDefaultNXT(open);	% line 4
% So, our actual code begins here:
% Opens left light sensor:
OpenLight (SENSOR_2,?ACTIVE');
% Opens right light sensor
OpenLight (SENSOR_3,?ACTIVE');
% Both sensors detect if the robot is encountering the black line.
% We detect the surface and we store the obtained value which 
% represents the colour (in our case: either black or white). We want % to store these values and we store these values in a vector. So, we % also need variable which will the index of our vector. Here we 
% initialize the variable which will be the index of our vector:
vec_index = 1;
while (true)
	% We want our robot to move straight forward with 15% of its
    % maximum speed:

	mAC = NXTMotor ('AC', 'Power', 15);
	% The motors make the robot move:
	mAC.SendToNXT();
    % We want to obtain values of the surface to detect if the
    % robot is encountering the black line. We get the values from
    % both sensors. We store both values in two different vectors.
    % One vector is for the left light sensor:
	vec_val_2(vec_index) = GetLight(SENSOR_2); % Left sensor
    pause (0.1);
    % And the other vector is for the right light sensor:
    vec_val_3(vec_index) = GetLight(SENSOR_3); % Right sensor

    % If the left light sensors detects black:
    if vec_val_2(vec_index) < 400
        % Robot turns right
        mA = NXTMotor('A', 'Power', 5);
        mC = NXTMotor('C', 'Power', 15);
        mA.SendToNXT ();
        mC.SendToNXT ();
        pause (1);
    end % End if statement
	
    % If the right light sensors detects black:
    if vec_val_3 (vec_index) < 400
            % Robot turn left
        mC = NXTMotor ('C', 'Power', 5);
        mA = NXTMotor ('A', 'Power', 15);
        mC.SendToNXT ();
        mA.SendToNXT ();
        pause (1);
    end % End if statement

    % If both light sensors detects white:
    if vec_val_2(vec_index) < 600 
        if vec_val_3(vec_index)<600
            % Robot moves straight forward
            mAC = NXTMotor('AC', 'Power', 15);
            mAC.SendToNXT ();
            pause (1);
        end % End if statement
    end % End if statement

    % If both light sensors detects black:
    if vec_val_2(vec_index) < 400 
        if vec_val_3(vec_index)< 400
            % Robot stops
            mAC.Stop ('off');
            pause (1);
        end % End if statement
    end % End if statement

    vec_index = vec_index + 1;
    pause (0.1);

end % End while loop