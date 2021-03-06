clear all
clc
rng('shuffle')
%% PARAMETERS , CHANGE STUFF!
%% EDITABLE: 

% Size of map
floorRows=11;
floorCols=14;


% Set floor room Limit (should later vary by floor)
floorRoomLimit = 15;

% Additional Rooms
numTreasure=2;

% ADD START ROOM Probabilities (assignStart)  (rand num from 0-100)
oneALimit=30;    % one (room) Assign Limit
twoALimit=60;    % two (room) Assign Limit
threeALimit=100;  % three (room) Assign Limit

% ADD OTHER NORMAL ROOMS Probabilities (generateRest)
zeroGLimit=0;
oneGLimit=98;
twoGLimit=100;

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
[floor,valueR,valueC]=assignStart_add6(floor,oneALimit,twoALimit,threeALimit);  % function 

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

%% generateRest_bossRoom

floor = generateRest_bossRoom2(floor,floorRows,floorCols,valueR,valueC);

%% generateRest_treasureRoom

% add treasure rooms
floor=generateRest_treasureRoom1(floor,numTreasure,floorRows,floorCols);


[floor,roomData] = GenerateFloor(floor,[13,21]);
[maxRowFloor,maxColFloor] = size(floor);
floorDoor = floor == 8;
[currentPositionY,currentPositionX] = find(floorDoor);

linkXPos = 0.49;
linkYPos = 0.51;
link1 = character(linkXPos,linkYPos,10,10,100,{'Little character left 1.png', 'Little character left 2.png', 'Little character right 1.png', 'Little character right 2.png'});
currentRoom(currentPositionY,currentPositionY) = roomClassEdited(roomData(currentPositionY,currentPositionX),currentPositionY,currentPositionX);

while roomData(currentPositionY,currentPositionX).Type ~= 5
    if currentPositionY > size(currentRoom,1) || currentPositionX > size(currentRoom,2)
        currentRoom(currentPositionY,currentPositionX) = roomClassEdited(roomData(currentPositionY,currentPositionX),currentPositionY,currentPositionX);
    elseif currentRoom(currentPositionY,currentPositionX).Type == 0
        currentRoom(currentPositionY,currentPositionX) = roomClassEdited(roomData(currentPositionY,currentPositionX),currentPositionY,currentPositionX);
    end
    link1 = mouseTestWithCharacterClass(0.025,0.05,link1,0,currentRoom(currentPositionY,currentPositionX));
    if link1.xPos < 0.2
        currentPositionX = currentPositionX - 1;
        link1.xPos = 17/21;
        link1.yPos = 0.5;
    elseif link1.xPos > 0.8
        currentPositionX = currentPositionX + 1;
        link1.xPos = 1/21;
        link1.yPos = 0.5;
    elseif link1.yPos < 0.2
        currentPositionY = currentPositionY + 1;
        link1.yPos = 11/13;
        link1.xPos = 0.46;
    else
        currentPositionY = currentPositionY - 1;
        link1.yPos = 2/13;
        link1.xPos = 0.46;
    end
end
'Found It'