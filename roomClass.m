classdef roomClass
    %ROOMCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Type
        Doors
        Position
        NumberObstacles
        TileInfo
        Size
        Images
        roomArray
    end
    
    methods
        %contructor method
        function obj = roomClass(roomData, iRow, iCol )
            obj.Type = roomData.Type;
            if obj.Type == 0
                obj = [];
            else
                %% set properties
                obj.Doors = roomData.Doors;
                obj.Position = [iRow, iCol];
                obj.NumberObstacles = roomData.TileInfo.Obstacles;
                obj.TileInfo.QuadrantsUsed = roomData.TileInfo.QuadrantsUsed;
                obj.TileInfo.Theme.color = roomData.TileInfo.Theme.color;
                obj.TileInfo.Theme.obstacle = roomData.TileInfo.Theme.obstacle;
                obj.TileInfo.Theme.lava = roomData.TileInfo.Theme.lava;
                obj.TileInfo.Theme.block = roomData.TileInfo.Theme.block;
                obj.TileInfo.Nodes = roomData.TileInfo.NumberNodes;
                obj.Size = roomData.Size;
                
                
                %% Used for creating Images Property: Struct of all images
                
                color = obj.TileInfo.Theme.color;
                obstacle = obj.TileInfo.Theme.obstacle;
                lava = obj.TileInfo.Theme.lava;
                block = obj.TileInfo.Theme.block;
                switch color
                    case 1 %grayscale 1
                        ImageNames = {'PlainGrayscaleTile1.png', ...
                            'BlocktGrayscaleTile1.png', ...
                            'PyramidtGrayscaleTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 2 % Grayscale 2
                        ImageNames = {'PlaintGrayscaleTile2.png', ...
                            'BlocktGrayscaleTile2.png', ...
                            'PyramidtGrayscaleTile2.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 3 %Lavendar 1
                        ImageNames = {'PlaintLavendarTile1.png', ...
                            'BlocktLavendarTile1.png', ...
                            'PyramidtLavendarTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 4 %Muted Green 1
                        ImageNames = {'PlaintMutedGreenTile1.png', ...
                            'BlocktMutedGreenTile1.png', ...
                            'PyramidtMutedGreenTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 5 %Muted Green 2
                        ImageNames = {'PlaintMutedGreenTile2.png', ...
                            'BlocktMutedGreenTile2.png', ...
                            'PyramidtMutedGreenTile2.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 6 %Neon Bright Blue
                        ImageNames = {'PlaintNeonBrightBlueTile1.png', ...
                            'BlocktNeonBrightBlueTile1.png', ...
                            'PyramidtNeonBrightBlueTile1', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 7 %Neon Dark Blue
                        ImageNames = {'PlaintNeonDarkBlueTile1.png', ...
                            'BlocktNeonDarkBlueTile1.png', ...
                            'PyramidtNeonDarkBlueTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 8 %Purple 3
                        ImageNames = {...
                            'PlaintPurpleTile3.png', ...
                            'BlocktPurpleTile3.png', ...
                            'PyramidtPurpleTile3.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 9 %Red 1
                        ImageNames = {...
                            'PlaintRedTile1.png', ...
                            'BlocktRedTile1.png', ...
                            'PyramidtRedTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 10 %Red 2
                        ImageNames = {...
                            'PlaintRedTile2.png', ...
                            'BlocktRedTile2.png', ...
                            'PyramidtRedTile2.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 11 %Red 3
                        ImageNames = {...
                            'PlaintRedTile3.png', ...
                            'BlocktRedTile3.png', ...
                            'PyramidtRedTile3.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                    case 12 %Sepia
                        ImageNames = {...
                            'PlaintSepiaTile1.png', ...
                            'BlocktSepiaTile1.png', ...
                            'PyramidtSepiaTile1.png', ...
                            [], ...
                            [], [], [], [], [], [], [], [], [], [], [], []};
                        
                end
                ImageNames{5} = 'bottom horizontal border_32x32.png';
                ImageNames{6} = 'bottom horizontal border_DOOR_32x32.png';
                ImageNames{7} = 'bottom left corner_32x32.png';
                ImageNames{8} = 'bottom right corner_32x32.png';
                ImageNames{9} = 'left vertical border_32x32.png';
                ImageNames{10} = 'left vertical border_DOOR_32x32.png';
                ImageNames{11} = 'right vertical border_32x32.png';
                ImageNames{12} = 'right vertical border_DOOR_32x32.png';
                ImageNames{13} = 'top horizontal border_32x32.png';
                ImageNames{14} = 'top horizontal border_DOOR_32x32.png';
                ImageNames{15} = 'top left corner_32x32.png';
                ImageNames{16} = 'top right corner_32x32.png';
                
                if lava
                    ImageNames{4} = struct('one', 'Lava3_1.png', ...
                        'two', 'Lava3_2.png', ...
                        'three', 'Lava3_3.png', ...
                        'four', 'Lava3_4.png');
                else
                    ImageNames{4} = struct('one', 'Water3_1.png', ...
                        'two', 'Water3_2.png', ...
                        'three', 'Water3_3.png', ...
                        'four', 'Water3_4.png');
                end
                
                %tile images are read
                tileImage = imread(ImageNames{1});
                
                %block images are selected by if statement
                if block
                    blockImage = imread(ImageNames{2});
                else
                    blockImage = imread(ImageNames{3});
                end
                
                %water images
                waterImage.one = imread(ImageNames{4}.one);
                waterImage.two = imread(ImageNames{4}.two);
                waterImage.three = imread(ImageNames{4}.three);
                waterImage.four = imread(ImageNames{4}.four);
                
                %create structure for walls
                wallImage.leftWall = imread(ImageNames{9});
                wallImage.leftDoor = imread(ImageNames{10});
                
                wallImage.rightWall = imread(ImageNames{11});
                wallImage.rightDoor = imread(ImageNames{12});
                
                wallImage.topWall = imread(ImageNames{13});
                wallImage.topDoor = imread(ImageNames{14});
                
                wallImage.bottomWall = imread(ImageNames{5});
                wallImage.bottomDoor = imread(ImageNames{14});
                
                wallImage.bottomRight = imread(ImageNames{8});
                wallImage.bottomLeft = imread(ImageNames{7});
                wallImage.topRight = imread(ImageNames{16});
                wallImage.topLeft =imread(ImageNames{15});
                
                obj.Images = struct('Tile', tileImage, ...
                    'Block', blockImage , ...
                    'Water', waterImage , ...
                    'Wall', wallImage );
                
                %% Generate initial arrays for procedural generator
                tempArray.Tiles = zeros((roomData.Size + 4), 'uint8');
                tempArray.Tiles(3:14, 3:10) = uint8(1);
                tempArray.Walls = zeros((roomData.Size + 4), 'uint8');
                tempArray.Assembly = zeros((roomData.Size + 4), 'uint8');
                
                %% Find "quadrant" limits and create array for walls
                %find median of rows
                rowsMedian = median(1:(roomData.Size(1)+4));
                lowerRestrictedRow = ceil(rowsMedian);
                upperRestrictedRow = floor(rowsMedian);
                
                %do the same for columns
                colsMedian = median(1:(roomData.Size(2)+1));
                leftRestrictedCol = floor(colsMedian);
                rightRestrictedCol = ceil(colsMedian);
                
                %generate left walls for room
                for nRow = 1:(roomData.Size(1))
                    for mCol = 1:2
                        if nRow < 3
                            tempArray.Walls(nRow, mCol) = 6;
                        elseif nRow > (roomData.Size(1)-1)
                            tempArray.Walls(nRow, mCol) = 15;
                        else
                            tempArray.Walls(nRow, mCol) = 5;
                        end
                    end
                end
                
                %generate right walls for room
                for nRow = 1:(roomData.Size(1))
                    for mCol = (roomData.Size(2)-1):roomData.Size(2)
                        if nRow < 3
                            tempArray.Walls(nRow, mCol) = 9;
                        elseif nRow > (roomData.Size(1)-1)
                            tempArray.Walls(nRow, mCol) = 12;
                        else
                            tempArray.Walls(nRow, mCol) = 10;
                        end
                    end
                end
                
                %insert top wall
                tempArray.Walls(1:2, 3:(roomData.Size(2)-2)) = 7;
                
                %insert bottom wall
                tempArray.Walls((roomData.Size(1)-1):roomData.Size(1), ...
                    3:(roomData.Size(2)-2)) = 13;
                
                
                
                %check to add right door
                if obj.Doors.Right
                    quadrant1.Rows.min = 3;
                    quadrant1.Rows.max = (upperRestrictedRow-1);
                    quadrant4.Rows.min = (lowerRestrictedRow+1);
                    quadrant4.Rows.max = roomData.Size(1)-2;
                    
                    tempArray.Walls(upperRestrictedRow:lowerRestrictedRow, ...
                        (roomData.Size(2)-1):roomData.Size(2)) = 11;
                else
                    quadrant1.Rows.min = 3;
                    quadrant1.Rows.min = (upperRestrictedRow);
                    quadrant4.Rows.min = lowerRestrictedRow;
                    quadrant4.Rows.max = roomData.Size(1)-2;
                end
                
                %now check to add left door
                if obj.Doors.Left
                    quadrant1.Rows.min = 3;
                    quadrant1.Rows.max = (upperRestrictedRow-1);
                    quadrant4.Rows.min = (lowerRestrictedRow+1);
                    quadrant4.Rows.max = roomData.Size(1)-2;
                    
                    tempArray.Walls(upperRestrictedRow:lowerRestrictedRow, ...
                        1:2) = 4;
                else
                    quadrant2.Rows.min = 3;
                    quadrant2.Rows.max = (upperRestrictedRow);
                    quadrant3.Rows.min = lowerRestrictedRow;
                    quadrant4.Rows.max = roomData.Size(1)-2;
                end
                
                %check to add top door
                if obj.Doors.Top
                    quadrant1.Cols.min = rightRestrictedCol+1;
                    quadrant1.Cols.max = roomData.Size(2)-2;
                    quadrant2.Cols.min = 3;
                    quadrant2.Cols.max = leftRestrictedCol-1;
                    
                    tempArray.Walls(1:2, ...
                        leftRestrictedCol:rightRestrictedRow) = 8;
                else
                    quadrant1.Cols.min = rightRestrictedCol;
                    quadrant1.Cols.max = roomData.Size(2)-2;
                    quadrant2.Cols.min = 3;
                    quadrant2.Cols.max = leftRestrictedCol;
                end
                
                %check to add bottom door
                if obj.Doors.Bottom
                    quadrant4.Cols.min = rightRestrictedCol;
                    quadrant4.Cols.max = roomData.Size(2)-2;
                    quadrant3.Cols.min = 3;
                    quadrant3.Cols.max = leftRestrictedCol;
                    
                    tempArray.Walls((roomData.Size(2)-1):roomData.Size(2),...
                        leftRestrictedCol:rightRestrictedCol) = 14;
                else
                    quadrant4.Cols.min = (rightRestrictedCol+1);
                    quadrant4.Cols.max = roomData.Size(2)-2;
                    quadrant3.Cols.min = 3;
                    quadrant3.Cols.min = (leftRestrictedCol-1);
                end
                
                %find center
                Center.upperlimit = floor(rowsMedian-1);
                Center.lowerlimit = ceil(rowsMedian+1);
                Center.leftlimit = floor(colsMedian -2);
                Center.rightlimit = ceil(colsMedian+2);
                
                quadrant5.Rows.min = Center.upperlimit;
                quadrant5.Rows.max = Center.lowerlimit;
                quadrant5.Cols.min = Center.leftlimit;
                quadrant5.Cols.max = Center.rightlimit;
                
                %% create obstacles in quadrant that is called for
                %will set a node as a starting point, only allowed to use a
                %set number of nodes
                nodesUsed = 0;
                
                %preallocate node structured array
                node(obj.TileInfo.Nodes).row =1;
                node(obj.TileInfo.Nodes).col =1;
                
                while nodesUsed < obj.TileInfo.Nodes
                    rng('shuffe');
                    if obj.TileInfo.QuadrantsUsed.topRight
                        nodesUsed = nodesUsed +1;
                        node(nodesUsed).row = randi([2, 4]);
                        node(nodesUsed).col = randi([2, 6]);
                        node(nodesUsed).quadrant = 1;
                    end
                    
                    
                    if obj.TileInfo.QuadrantsUsed.topLeft
                        nodesUsed = nodesUsed +1;
                        node(nodesUsed).row = randi([2, 4]);
                        node(nodesUsed).col = randi([2, 6]);
                        node(nodesUsed).quadrant = 2;
                    end
                    
                    
                    if obj.TileInfo.QuadrantsUsed.bottomLeft
                        nodesUsed = nodesUsed +1;
                        node(nodesUsed).row = randi([2, 4]);
                        node(nodesUsed).col = randi([2, 6]);
                        node(nodesUsed).quadrant = 3;
                    end
                    
                    
                    if obj.TileInfo.QuadrantsUsed.bottomRight
                        nodesUsed = nodesUsed +1;
                        node(nodesUsed).row = randi([2, 4]);
                        node(nodesUsed).col = randi([2, 6]);
                        node(nodesUsed).quadrant = 4;
                    end
                    
                    
                    if obj.TileInfo.QuadrantsUsed.Center
                        nodesUsed = nodesUsed +1;
                        node(nodesUsed).row = randi([2, 5]);
                        node(nodesUsed).col = randi([2, 7]);
                        node(nodesUsed).quadrant = 5;
                    end
                end
                
                quadrantArray = zeros([5, 7], 'uint8');
                quadrantArray(2:4, 2:6) = uint8(1);
                for i = 1:4
                    quadrant{i} = quadrantArray;
                end
                quadrantArray = zeros([6, 8], 'uint8');
                quadrantArray(2:5, 2:7) = uint8(1);
                quadrant{5} = quadrantArray;
                
                
                %% Place obstacles in their respective quadrant
                obstaclesPlaced = 0;
                
                switch obstacle
                    case 1 %only blocks used
                        for i = 1:nodesUsed
                            quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                                = 2;
                            obstaclesPlaced + 1;
                        end
                        
                        while obstaclesPlaced < obj.NumberObstacles
                            for i = 1:nodesUsed
                                currentQuadrant = node{i}.quadrant;
                                currentRow = node(i).row;
                                currentCol = node(i).col;
                                
                                switch rand(4)
                                    case 1 %go up
                                        if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                                            currentRow = currentRow - 1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 2 %go down
                                        if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                                            currentRow = currentRow+1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 3 %go left
                                        if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                                            currentRow = (currentCol-1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 4 %go right
                                        if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                                            currentRow = (currentCol+1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                        
                                end
                                
                            end
                            
                        end
                    case 2 %only water used
                        for i = 1:nodesUsed
                            quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                                = 3;
                            obstaclesPlaced + 1;
                        end
                        
                        while obstaclesPlaced < obj.NumberObstacles
                            for i = 1:nodesUsed
                                currentQuadrant = node{i}.quadrant;
                                currentRow = node(i).row;
                                currentCol = node(i).col;
                                
                                switch rand(4)
                                    case 1 %go up
                                        if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                                            currentRow = currentRow - 1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 2 %go down
                                        if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                                            currentRow = currentRow+1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 3 %go left
                                        if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                                            currentRow = (currentCol-1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 4 %go right
                                        if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                                            currentRow = (currentCol+1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                        
                                end
                                
                            end
                            
                        end
                        
                    case 3 %both, water will take preference though
                        for i = 1:nodesUsed
                            place = randi([2, 3]);
                            quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                                = place;
                            obstaclesPlaced + 1;
                        end
                        while obstaclesPlaced < obj.NumberObstacles
                            for i = 1:nodesUsed
                                currentQuadrant = node{i}.quadrant;
                                currentRow = node(i).row;
                                currentCol = node(i).col;
                                place = quadrant{currentQuadrant}((currentRow), currentCol);
                                
                                switch rand(4)
                                    case 1 %go up
                                        if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                                            currentRow = currentRow - 1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = place;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 2 %go down
                                        if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                                            currentRow = currentRow+1;
                                            quadrant{currentQuadrant}(currentRow, currentCol) = place;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 3 %go left
                                        if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                                            currentRow = (currentCol-1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = place;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                    case 4 %go right
                                        if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                                            currentRow = (currentCol+1);
                                            quadrant{currentQuadrant}(currentRow, currentCol) = place;
                                            obstaclesPlaced = obstaclesPlaced +1;
                                        end
                                        
                                end
                                
                            end
                            
                        end
                        
                end
                
                    tempArray.Tiles(3:5, 3:7) = quadrant{2}(2:4, 2:6);
                    tempArray.Tiles(8:10, 3:7) = quadrant{3}(2:4, 2:6);
                    tempArray.Tiles(3:5, 10:14) = quadrant{1}(2:4, 2:6);
                    tempArray.Tiles(8:10, 10:14) = quadrant{4}(2:4, 2:6);
                    tempArray.Tiles(5:8, 6:11) = quadrant{5}(2:5, 2:7)
                    
                    obj.RoomArray.ImageIndex = tempArray.Tiles + tempArray.Walls;
                    obj.RoomArray.Collision = obj.RoomArray.ImageIndex ~= 1
                    obj.RoomArray.IsDoor = obj.RoomArray.ImageIndex == 4 || obj.RoomArray.ImageIndex == 8 || obj.RoomArray.ImageIndex == 11 || obj.RoomArray.ImageIndex == 14
            end
            
            
        end
    end
    
    
    
end
