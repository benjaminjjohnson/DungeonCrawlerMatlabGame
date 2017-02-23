%% testMatrix.m

% Create floor
% Edit the number of rows and columns
% Edit probabilities of number of adjacent rooms to start room:
    % function that takes these inputs(arguments) is assignStart
% Edit probabilities of number of adjacent rooms to any other room
    % function that takes these inputs(arguments) is generateRest

% Require function files:
%       generateRest.m
%       assignStart.m
%
% Author: Matt Phelps, EG Project Dungeon Crawler, 2/23/2017

clear
clc

%% Set desired size of map

% EDITABLE:
floorRows=8;
floorCols=10;

% Add wall of 6's
floor=zeros(floorRows+2,floorCols+2);

%% Create wall outside of map of 6's

for it=1:floorCols+2
    floor(1,it)=6;
    floor(floorRows+2,it)=6;
end

for it=1:floorRows+2
    floor(it,1)=6;
    floor(it,floorCols+2)=6;
end

% disp(floor)

% Clear screen
% clc

%% AssignStart

% Set probality limits for 1,2,3,4 (0-100)
% EDITABLE:
oneALimit=80;   % one (room) Assign Limit
twoALimit=90;   % two (room) Assign Limit
threeALimit=95; % three (room) Assign Limit
 
% Add start and adjacents
floor=assignStart(floor,oneALimit,twoALimit,threeALimit);  % function 
disp(floor)

% Count number of rooms
roomCount=1; % Because starter room counts for a room too
for irow=1:floorRows+2
    for icol=1:floorCols+2
        if floor(irow,icol)==1
            roomCount=roomCount+1;
        end
    end 
end
clear irow;
clear icol;

% END OF ASSIGN START

%% GenerateRest

% Set probability limits for 0,1,2,3 (0-100)
% EDITABLE:
zeroGLimit=0;
oneGLimit=60;
twoGLimit=80;
% no 3 G Limit

% Set floor room Limit (should later vary by floor)
floorRoomLimit = 30;

% Generate rest of map
floor=generateRest(floor,roomCount,floorRoomLimit,zeroGLimit,oneGLimit,twoGLimit);

% Display floor
disp(floor)


%% END OF CODE

% Author: Matt Phelps, 2/23/2017






        