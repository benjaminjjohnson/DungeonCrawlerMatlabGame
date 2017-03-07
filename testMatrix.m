%% testMatrix.m

% Create floor
% Edit the number of rows and columns
% Edit probabilities of number of adjacent rooms to start room:
    % function that takes these inputs(arguments) is assignStart
% Edit probabilities of number of adjacent rooms to any other room
    % function that takes these inputs(arguments) is generateRest

% Require function files:
%       assignStart.m
%       generateRest.m
%       generateRest_treasureRoom.m
%
% Author: Matt Phelps, EG Project Dungeon Crawler, 2/23/2017

clear
clc

%% PARAMETERS , CHANGE STUFF!
%% EDITABLE: 

% Size of map
floorRows=40;
floorCols=60;

% Set floor room Limit (should later vary by floor)
floorRoomLimit = 100;

% Additional Rooms
numTreasure=4;

% ADD START ROOM Probabilities (assignStart)  (rand num from 0-100)
oneALimit=30;    % one (room) Assign Limit
twoALimit=60;    % two (room) Assign Limit
threeALimit=65;  % three (room) Assign Limit

% ADD OTHER NORMAL ROOMS Probabilities (generateRest)
zeroGLimit=2;
oneGLimit=97;
twoGLimit=99;

%% Create wall outside of map of 6's

% Make floor
floor=zeros(floorRows+2,floorCols+2,'int8');

for it=1:floorCols+2
    floor(1,it)=6;
    floor(floorRows+2,it)=6;
end

for it=1:floorRows+2
    floor(it,1)=6;
    floor(it,floorCols+2)=6;
end

%% assignStart
 
% Add start and adjacents
floor=assignStart_add6(floor,oneALimit,twoALimit,threeALimit);  % function 

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

%% generateRest

% Generate rest of map
floor=generateRest(floor,roomCount,floorRoomLimit,zeroGLimit,oneGLimit,twoGLimit);

% END OF GENERATE REST (before additions)

%% generateRest_treasureRoom

floor=generateRest_treasureRoom1(floor,numTreasure,floorRows,floorCols);

%% DISPLAY TO FIGURE

image(floor*7);

%% END OF CODE

% Author: Matt Phelps, 2/23/2017






        