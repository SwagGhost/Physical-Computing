% This function can be used to classify an image with
% coins, keys, and apples using our own rule-based classifier.
% Before we use this function, we have to run the getimage function.
% Once we have done that, we can run this function by typing the
% following command in the command window: Classifier

function Classifier
    % We have to use global variables in order get information from the
    % function we used to label our objects:
    global labels;
    global numlabels;
    
    % We want the area and perimeter of each object, so we can classify 
    % the objects by area. If not area, we can use the area and perimeter 
    % to calculate the form factor, so that we are still able to classify
    % the objects. We obtain the information we need for classification:
    stats = regionprops(labels, 'all');

    % We initialise the counter for each type of object we want to count
    % to zero. We took an image of an apple, coins, and keys:
    apple = 0;
    coin = 0;
    key = 0;

    % We used a for-loop. We start at 1 and we execute the loop until we 
    % have classified all objects. The total number of objects is equal 
    % to the value stored in numlabels:
    for (x = 1:numlabels)
        % We calculate the form factor of each object (x is the
        % label of the object, kind of. So, if x = 1, then we calculate
        % the form factor of object 1 which has the label L = x. In
        % this example, L = 1 (because L = x = 1).
        % We calculate the form factor of an object of which the value 
        % is stored in the variable f, using the following formula:
        % f = (4 * pi * A) / P^2 where A is the area of the object and
        % P is its perimeter:
        f = 4 * pi * stats(x).Area / ((stats(x).Perimeter)^2);

        % We display the form factor and area of each object:
        disp(['Object ', num2str(x), ': ']);
        disp(['Form factor of object ' , num2str(x), ': f = ', num2str(f)]);
        disp(['Area of object ', num2str(x), ': ', num2str(stats(x).Area)]);

        % If the area of pixels occupied by the objects of the object 
        % is bigger than 40000
        if (stats(x).Area > 40000)
            % We display the sentence: 'Object <number of object> is
            % an apple':
            disp(['Object ', num2str(x), ' is an apple.']);
            disp([' ']);
            % We increment the value of variable in which we store the 
            % number of counted apples:
            apple = apple + 1;

        % If the form factor of the object is smaller than 0.85:
        elseif (f < 0.85)
            % We display the sentence: 'Object <number of object> is
            % a key':
            disp(['Object ', num2str(x), ' is a key.']);
            disp([' ']);
            % We increment the value of variable in which we store the 
            % number of counted keys:
            key = key + 1;

        % We know that if the form factor has an value which is almost
        % equal to 1, then the object is round.
        % If the form factor of the object is bigger than 0.9:
        elseif (f > 0.9)
            % We display the sentence: 'bject <number of object> is
            % a coin':
            disp(['Object ', num2str(x), ' is a coin.']);
            disp([' ']);
            % We increment the value of variable in which we store the 
            % number of counted coins:
            coin = coin + 1;
        % We end the if-statement
        end 
    % We end the for-loop:
    end
    
    % We display the total amount of objects found:
    disp(['Total number of counted objects: ',  num2str(numlabels)]);
    disp(['Counted objects:']);
    
    % We display the amount of apples:
    % If there is only one apple counted:
    if (apple == 1)
        disp([num2str(apple), ' apple.']);
    % If there is more than one apple counted:
    else
        disp([num2str(apple), ' apples.']);
    % We end the if-statement:
    end

    % We display the amount of coins:
    % If there is only one coin counted:
    if (coin == 1)
        disp([num2str(coin), ' coin.']);
    % If there is more than one coin counted:
    else
        disp ([num2str(coin), ' coins.']);
    % We end the if-statement:
    end

    % We display the amount of keys:
    % If there is only one key counted:
    if (key == 1)
        disp([num2str(key), ' key.']);
    % If there is more than one key detected:
    else
        disp ([num2str(key), ' keys.']);
    % We end the if-statement:
    end
% We end our function:
end