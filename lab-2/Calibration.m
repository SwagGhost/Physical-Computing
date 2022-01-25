% First, we open one of the light sensors:
OpenLight(SENSOR_2, 'ACTIVE')
% Then, we place the robot on the white surface.
% And, we get the value that is reflected by the white surface.
% We assign this obtained value to the variable val_white:
val_white = GetLight(SENSOR_2);
% We want to know the value, so we the value:
disp(val_white);
% This time, we place robot in such a way that
% SENSOR_2 detects the value reflected by the black tape.
% We do the same to obtain the value for the black tape:
val_black = GetLight(SENSOR_2);
% We also want to know this value, so we display this value too:
disp(val_black);
% Once we are done, we can close the light sensor:
CloseSensor(SENSOR_2);