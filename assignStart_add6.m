function floor=assignStart_add6(floor,oneALimit,twoALimit,threeALimit)

%% This function creates the first room and however many rooms are adjacent

%  Do recall that no fourSLimit is needed because anything above
%      threeSLimit will generate four rooms

%% SETUP:

% Assign value to determine # of rooms
tempiValue=100*rand();

% Figure out how many floorRows and floorCols
floorRows=max(size(floor(:,1)));
floorCols=max(size(floor(1,:)));

% Assign 'center' point:
% Middle third of grid!
valueR=randi(round([2+floorRows/3,floorRows-1-floorRows/3])); % HOW FAR AWAY FROM SOLID 6 WALL?
valueC=randi(round([2+floorCols/3,floorCols-1-floorRows/3])); % HOW FAR AWAY FROM SOLID 6 WALL?
floor(valueR,valueC)=8;           % 8 RESPRESENTS START ~ ~ ~ ~ ~ ~ 
 
% CHOOSE TO ADD 6's or NOT ADD 6's.
% JUST CHANGE THE FOLLOWING LINES FROM COMMENTS TO LINES OF CODE BY DELETING
%     THE PERCENTAGE SIGN
%floor(valueR-1,valueC-1)=6;
%floor(valueR+1,valueC+1)=6;
%floor(valueR-1,valueC+1)=6;
%floor(valueR+1,valueC-1)=6;

%% Determine how many rooms

if tempiValue <= oneALimit
    % ONE neighboring room
    
    tempValue=randi(4);
    switch tempValue
        % Add to right
        case 1
            floor(valueR+1,valueC)=1;
        % Add to left
        case 2
            floor(valueR-1,valueC)=1;
        % Add to above
        case 3
            floor(valueR,valueC+1)=1;
        % Add to below
        case 4
            floor(valueR,valueC-1)=1;
    end
   
elseif tempiValue <= twoALimit
    % TWO neighboring rooms
    
    tempValue=randi(4);
    tempValue2=randi(4);
    while tempValue==tempValue2    % ensure they aren't the same
        tempValue2=randi(4);
    end
    % Add two rooms
    switch tempValue
        case 1
            floor(valueR+1,valueC)=1;   % right
        case 2
            floor(valueR-1,valueC)=1;   % left
        case 3
            floor(valueR,valueC-1)=1;   % above
        case 4
            floor(valueR,valueC+1)=1;   % below
    end
    switch tempValue2
        case 1
            floor(valueR+1,valueC)=1;   % right
        case 2
            floor(valueR-1,valueC)=1;   % left
        case 3
            floor(valueR,valueC-1)=1;   % above
        case 4
            floor(valueR,valueC+1)=1;   % below
    end
elseif tempiValue <= threeALimit
    % THREE neighboring rooms
    tempEmpValue=randi(4);  % get an 'empty' value from 1 to 4
    switch tempEmpValue
        case 1  % above
            floor(valueR+1,valueC)=1;   % right
            floor(valueR-1,valueC)=1;   % left        -   -
            floor(valueR,valueC+1)=1;   % below         |
        case 2  % below
            floor(valueR+1,valueC)=1;   % right         |
            floor(valueR-1,valueC)=1;   % left        -   -
            floor(valueR,valueC-1)=1;   % above
        case 3  % right
            floor(valueR-1,valueC)=1;   % left          |
            floor(valueR,valueC-1)=1;   % above       -
            floor(valueR,valueC+1)=1;   % below         |
        case 4  % left
            floor(valueR+1,valueC)=1;   % right         |
            floor(valueR,valueC-1)=1;   % above           -
            floor(valueR,valueC+1)=1;   % below         |
    end
else
    % FOUR neighboring rooms
    floor(valueR+1,valueC)=1;
    floor(valueR-1,valueC)=1;
    floor(valueR,valueC+1)=1;
    floor(valueR,valueC-1)=1;
end 

%% End of code

% Author: Matt Phelps, 2/22/17





