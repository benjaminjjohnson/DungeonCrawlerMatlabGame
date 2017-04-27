function rooms = GenerateFloor(floor, roomSize)
%% Gets rid of empty rows and columns
modFloor = floor;
%create downsized array that gets rid of blank space from floor array
floorSize = uint8(size(modFloor));
iRow = 1;
iCol = 1;
while iRow ~= floorSize(1)
    %find new size of floor
    floorSize = uint8(size(modFloor));
    %create an empty row of the map for reference
    emptyRow = zeros(1, floorSize(2));
    emptyRow(1) = 6;
    emptyRow(floorSize(2)) = 6;
    %delete what isn't being used
    if modFloor(iRow, :) == emptyRow
        modFloor(iRow, :) = [];
    else
        iRow = iRow + 1;
    end
    floorSize = uint8(size(modFloor));
end

%find new size of floor
floorSize = uint8(size(modFloor));

%create an empty column of the map for reference
emptyCol = zeros(floorSize(1), 1);
emptyCol(1) = 6;
emptyCol(floorSize(1)) = 6;

while iCol ~= floorSize(2)
    %find new size of floor
    floorSize = uint8(size(modFloor));
    %create an empty column of the map for reference
    emptyCol = zeros(floorSize(1), 1);
    emptyCol(1) = 6;
    emptyCol(floorSize(1)) = 6;
    if modFloor(:, iCol) == emptyCol
        modFloor(:, iCol) = [];
    else
        iCol = iCol + 1;
    end
    floorSize = uint8(size(modFloor));
end

%% get rid of borders
iRow = 1;
iCol = 1;

while iRow ~= floorSize(1)
    %find new size of floor
    floorSize = uint8(size(modFloor));
    %create an empty row of the map for reference
    emptyRow = ones(1, floorSize(2));
    emptyRow = emptyRow*6;
    %delete what isn't being used
    if modFloor(iRow, :) == emptyRow
        modFloor(iRow, :) = [];
    else
        iRow = iRow + 1;
    end
    floorSize = uint8(size(modFloor));
end

while iCol ~= floorSize(2)
    %find new size of floor
    floorSize = uint8(size(modFloor));
    %create an empty column of the map for reference
    emptyCol = ones(floorSize(1), 1);
    emptyCol = emptyCol*6;
    if modFloor(:, iCol) == emptyCol
        modFloor(:, iCol) = [];
    else
        iCol = iCol + 1;
    end
    floorSize = uint8(size(modFloor));
end

%set "border" tiles to value of zero
for iRow=1:floorSize(1)
    for iCol=1:floorSize(2)
        if modFloor(iRow, iCol) == 6
            modFloor(iRow, iCol) = 0;
        end
    end
end


%% Create arrays of proper size

%create room sizes, (adding 4 because 2 tile thick border for walls of
%dungeon rooms)
roomSize = uint8(roomSize);


%create array of structs containing data for generating rooms
roomData = generateRoomData(modFloor, roomSize);

%create empty array of roomClass




end

%% =======================================================================

function roomData = generateRoomData(modFloor, roomSize)
%get size of floor
floorSize = size(modFloor);

%create empty array of structs the size of modFloor
roomData = repmat( ...
    struct('Type', uint8(0), ...
    'Doors', struct('Top', false, 'Bottom', false, 'Left', false, ...
    'Right', false), ...
    'TileInfo', struct( ...
    'Obstacles', uint8(1), ...
    'QuadrantsUsed', struct('topRight', false, ...
    'topLeft', false, 'bottomLeft', false, ...
    'bottomRight', false, 'Center', false), ...
    'Theme', struct('color', uint(13), 'obstacle', uint(3), 'lava', false, 'block', true), ...
    'NumberNodes', 1), ...
    'Size', roomSize, ...
    'MapPosition', [1, 1]), ...
    floorSize(1), floorSize(2));

%go through entire map
for iRow=1:floorSize(1)
    for iCol=1:floorSize(2)
        rng('shuffle');
        %% set type of room
        roomData(iRow, iCol).Type = uint8(modFloor(iRow, iCol));
        %will generate rest of room data only if room is being used (room
        %type value of 0 indicates that room space is not being used)
        if roomData(iRow, iCol).Type ~= 0
        %% generate and store data about door location
        %Set Top
        if iRow == 1 %if is checking top row, cannot go up
            roomData(iRow, iCol).Doors.Top = false;
        else %check above for any row other than the first one
            %if value above is 0 or 6, cannot go up,
            if modFloor((iRow - 1), iCol) == 0 || ...
                    modFloor((iRow - 1), iCol) == 6
                roomData(iRow, iCol).Doors.Top = false;
            else
                roomData(iRow, iCol).Doors.Top = true;
            end
        end
        
        %Set bottom
        if iRow == roomSize(1) %if is checking bottom row, cannot go down
            roomData(iRow, iCol).Doors.Bottom = false;
        elseif iRow < roomSize(1) %check above for any row other than the last one
            %if value above is 0 or 6, cannot go down,
          
            if modFloor((iRow + 1), iCol) == 0 || ...
                    modFloor((iRow + 1), iCol) == 6
                roomData(iRow, iCol).Doors.Bottom = false;
            else
                roomData(iRow, iCol).Doors.Bottom = true;
            end
           
        end
        
        %set left
        if iCol == 1 %if is checking leftmost row, cannot go left
            roomData(iRow, iCol).Doors.Left = false;
        else %check above for any cloumn other than the first one
            %if value above is 0 or 6, cannot go left,
            if modFloor(iRow, (iCol-1)) == 0 || ...
                    modFloor(iRow, (iCol-1)) == 6
                roomData(iRow, iCol).Doors.Left = false;
            else
                roomData(iRow, iCol).Doors.Left = true;
            end
        end
        
        %Set Right
        if iCol == roomSize(2) %if checking rightmost row, cannot go right
            roomData(iRow, iCol).Doors.Right = false;
        else %check above for any column other than the last one
            %if value above is 0 or 6, cannot go right,
            if modFloor(iRow, (iCol+1)) == 0 || ...
                    modFloor(iRow, (iCol+1)) == 6
                roomData(iRow, iCol).Doors.Right = false;
            else
                roomData(iRow, iCol).Doors.Right = true;
            end
        end
        
        %find total number of doors being used
        totalDoors = uint8(roomData(iRow, iCol).Doors.Top) + ...
            uint8(roomData(iRow, iCol).Doors.Bottom) + ...
            uint8(roomData(iRow, iCol).Doors.Left) + ...
            uint8(roomData(iRow, iCol).Doors.Right);
                    
        
        %% generate max number of obstacles that will be allowed in room
        %first get the room size without walls
        totalTiles = prod(roomSize - 4);
        %will generate number of allowed obstacles from a randi function
        %over a certain range, first must calculate bounds of that range
        nMax = round(totalTiles*((7-totalDoors)/8));
        nMin = round(totalTiles*((6-totalDoors)/10));
        
        %generate the max number of obstacles that can be used in room
        roomData(iRow, iCol).TileInfo.Obstacles = ...
            randi([nMin, nMax], 1, 'uint8');
        
        %%Select which quadrants to use in room
        %generate a random integer between 1 and 5 to see what quandrants
        %can be used
        nQuadrantsPicked = 0;
        while nQuadrantsPicked < 3
            quadrant = randi(5);
           switch quadrant
                case 1
                    %first check if the first quadrant has already been
                    %picked before, if it has do not increment the counter,
                    %if it has not increment counter and set quandrant to
                    %true
                   if ~roomData(iRow, iCol).TileInfo.QuadrantsUsed.topRight
                 roomData(iRow, iCol).TileInfo.QuadrantsUsed.topRight = true;
                 nQuadrantsPicked = nQuadrantsPicked + 1;
                   end
                    
                case 2 %do same thing for other quadrants
                  if ~roomData(iRow, iCol).TileInfo.QuadrantsUsed.topLeft
                roomData(iRow, iCol).TileInfo.QuadrantsUsed.topLeft = true;
                nQuadrantsPicked = nQuadrantsPicked + 1;
                    end
                   
                case 3
                if ~roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomLeft
             roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomLeft = true;
             nQuadrantsPicked = nQuadrantsPicked + 1;
                    end
                   
                case 4
            if ~roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomRight
          roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomRight = true;
          nQuadrantsPicked = nQuadrantsPicked + 1;
                    end
                   
                case 5
             if ~roomData(iRow, iCol).TileInfo.QuadrantsUsed.Center
          roomData(iRow, iCol).TileInfo.QuadrantsUsed.Center = true;
          nQuadrantsPicked = nQuadrantsPicked + 2;
                    end 
           end
        end
        
        %% determine 'theme' of room
        %theme is represented by four values
        %first value determines what color pallete will be used from the 13
        %possibilities
        
        color = randi(13, 'uint8');
        
        %second value determines whether only blocks will be used, only
        %water will be used, or both will be used when spawning obstacles,
        %each of these possibilities corresponds to 1, 2, and 3 respectively
        obstacle = randi(3, 'uint8');
        
        %third value determines if water will be used instead of lava, it is
        %a logical variable
        lava = logical(round(rand(1)));
        
        %fourth value determines whether obstacles will be a block or a
        %pyramid. A 1 means that it will display a block, a 0 means that it
        %will use pyramids
        block = logical(round(rand(1)));
        
        roomData(iRow, iCol).TileInfo.Theme = {color, obstacle, ...
            lava, block};
        
        %% Determine number of nodes to be used for generation
        %determine total number of quadrants that will be used
    roomData(iRow, iCol).TileInfo.NumberNodes = ...
        uint8(roomData(iRow, iCol).TileInfo.QuadrantsUsed.topRight)...
        +uint8(roomData(iRow, iCol).TileInfo.QuadrantsUsed.topLeft)+...
        uint8(roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomLeft) + ...
        uint8(roomData(iRow, iCol).TileInfo.QuadrantsUsed.bottomRight) ...
        + uint8(roomData(iRow, iCol).TileInfo.QuadrantsUsed.Center);

    %% Store position of room in map
    roomData(iRow, iCol).MapPosition = [iRow, iCol];
    
    %if the room at the given position is a 0, make it empty
        
        end
        
    end
end
end

%% =======================================================================


    
    
