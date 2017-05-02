classdef roomClassEdited
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
        function obj = roomClassEdited(roomData, iRow, iCol)
            
            if  nargin == 0
                obj.roomArray = 0;
                obj.Type = 0;
                obj.Doors = 0;
                obj.Position = 0;
                obj.NumberObstacles = 0;
                obj.TileInfo = 0;
                obj.Size = 0;
                obj.Images = 0;
            else
                %% set properties
                obj.Type = roomData.Type;
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
                        ImageNames{1} = 'PlainGrayscaleTile1.png';
                        ImageNames{2} = 'BlocktGrayscaleTile1.png';
                        ImageNames{3} = 'PyramidtGrayscaleTile1.png';
                        
                    case 2 % Grayscale 2
                        ImageNames{1} = 'PlaintGrayscaleTile2.png';
                        ImageNames{2} = 'BlocktGrayscaleTile2.png';
                        ImageNames{3} = 'PyramidtGrayscaleTile2.png';
                        
                    case 3 %Lavendar 1
                        ImageNames{1} = 'PlaintLavendarTile1.png';
                        ImageNames{2} = 'BlocktLavendarTile1.png';
                        ImageNames{3} = 'PyramidtLavendarTile1.png';
                        
                    case 4 %Muted Green 1
                        ImageNames{1} = 'PlaintMutedGreenTile1.png';
                        ImageNames{2} = 'BlocktMutedGreenTile1.png';
                        ImageNames{3} = 'PyramidtMutedGreenTile1.png';
                        
                    case 5 %Muted Green 2
                        ImageNames{1} = 'PlaintMutedGreenTile2.png';
                        ImageNames{2} = 'BlocktMutedGreenTile2.png';
                        ImageNames{3} = 'PyramidtMutedGreenTile2.png';
                        
                    case 6 %Neon Bright Blue
                        ImageNames{1} = 'PlaintNeonBrightBlueTile1.png';
                        ImageNames{2} = 'BlocktNeonBrightBlueTile1.png';
                        ImageNames{3} = 'PyramidtNeonBrightBlueTile1.png';
                        
                    case 7 %Neon Dark Blue
                        ImageNames{1} = 'PlaintNeonDarkBlueTile1.png';
                        ImageNames{2} = 'BlocktNeonDarkBlueTile1.png';
                        ImageNames{3} = 'PyramidtNeonDarkBlueTile1.png';
                        
                    case 8 %Purple 3
                        
                        ImageNames{1} = 'PlaintPurpleTile3.png';
                        ImageNames{2} = 'BlocktPurpleTile3.png';
                        ImageNames{3} = 'PyramidtPurpleTile3.png';
                        
                    case 9 %Red 1
                        
                        ImageNames{1} = 'PlaintRedTile1.png';
                        ImageNames{2} = 'BlocktRedTile1.png';
                        ImageNames{3} = 'PyramidtRedTile1.png';
                        
                    case 10 %Red 2
                        
                        ImageNames{1} = 'PlaintRedTile2.png';
                        ImageNames{2} = 'BlocktRedTile2.png' ;
                        ImageNames{3} = 'PyramidtRedTile2.png';
                        
                    case 11 %Red 3
                        ImageNames{1} = 'PlaintRedTile3.png';
                        ImageNames{2} = 'BlocktRedTile3.png';
                        ImageNames{3} = 'PyramidtRedTile3.png';
                        
                    case 12 %Sepia
                        ImageNames{1} = 'PlaintSepiaTile1.png';
                        ImageNames{2} = 'BlocktSepiaTile1.png';
                        ImageNames{3} = 'PyramidtSepiaTile1.png';
                    otherwise
                        ImageNames{1} = 'PlaintSepiaTile1.png';
                        ImageNames{2} = 'BlocktSepiaTile1.png';
                        ImageNames{3} = 'PyramidtSepiaTile1.png';
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
                ImageNames{17} = 'Closed Treasure Chest.png';
                
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
                wallImage.topDoor = imread(ImageNames{6});
                
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
                obj.Images.Treasure = imread(ImageNames{17});
                
                %% Generate initial arrays for procedural generator
                obj.roomArray.ImageIndex = ones(obj.Size, 'uint8');
                
                obj.roomArray.ImageIndex(2:(obj.Size(1)-1),1) = 5;
                obj.roomArray.ImageIndex(2:(obj.Size(1)-1),obj.Size(2)) = 10;
                obj.roomArray.ImageIndex(1,2:(obj.Size(2)-1)) = 13;
                obj.roomArray.ImageIndex(obj.Size(1),2:(obj.Size(2)-1)) = 7;
                obj.roomArray.ImageIndex(1,1) = 15;
                obj.roomArray.ImageIndex(1,obj.Size(2)) = 12;
                obj.roomArray.ImageIndex(obj.Size(1),1) = 6;
                obj.roomArray.ImageIndex(obj.Size(1),obj.Size(2)) = 9;
                
                if obj.Doors.Top
                    obj.roomArray.ImageIndex(1,obj.Size(2)/2) = 8;
                end
                if obj.Doors.Bottom
                    obj.roomArray.ImageIndex(obj.Size(1),obj.Size(2)/2) = 14;
                end
                if obj.Doors.Left
                    obj.roomArray.ImageIndex(obj.Size(1)/2,1) = 4;
                end
                if obj.Doors.Right
                    obj.roomArray.ImageIndex(obj.Size(1)/2,obj.Size(2)) = 11;
                end
                
                switch randi(3)
                    case 1
                        obj.roomArray.ImageIndex(2,2) = 2;
                        obj.roomArray.ImageIndex(2,obj.Size(2)-1) = 2;
                        obj.roomArray.ImageIndex(obj.Size(1)-1,2) = 2;
                        obj.roomArray.ImageIndex(obj.Size(1)-1,obj.Size(2)-1) = 2;
                    case 2
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)-obj.Size(1)/4):((obj.Size(1)/2)-1),((obj.Size(2)/2)-1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)+1):((obj.Size(1)/2)+obj.Size(1)/4),((obj.Size(2)/2)-1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)-obj.Size(1)/4):((obj.Size(1)/2)-1),((obj.Size(2)/2)+1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)+1):((obj.Size(1)/2)+obj.Size(1)/4),((obj.Size(2)/2)+1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)-1),((obj.Size(2)/2)-obj.Size(2)/4):((obj.Size(2)/2)-1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)-1),((obj.Size(2)/2)+1):((obj.Size(2)/2)+obj.Size(2)/4)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)+1),((obj.Size(2)/2)-obj.Size(2)/4):((obj.Size(2)/2)-1)) = 2;
                        obj.roomArray.ImageIndex(((obj.Size(1)/2)+1),((obj.Size(2)/2)+1):((obj.Size(2)/2)+obj.Size(2)/4)) = 2;
                    case 3
                        growthThreshold = randi([3 5],1);
                        growthCounter = 0;
                        iRow = 2;
                        rowCounter = 2;
                        while iRow <= obj.Size(1)-1
                            iCol = 2;
                            rowCounter = rowCounter + 1;
                            if rowCounter < obj.Size(1)-1
                                iRow = randi([2 obj.Size(1)-1]);
                            end
                            while iCol <= obj.Size(2)-1
                                if growthThreshold < growthCounter
                                    iRow = obj.Size(1);
                                    iCol = obj.Size(2);
                                else
                                    
                                end
                                if rand(1) < 0.1 && iRow ~= obj.Size(1)/2 && iCol ~= obj.Size(2)/2
                                    obj.roomArray.ImageIndex(iRow,iCol) = 2;
                                    growthCounter = growthCounter + 1;
                                    growthFactor = 0.9;
                                    growthTest = rand(1);
                                    while growthTest < growthFactor
                                        growth = randi([0 1]);
                                        if growth
                                            growthX = randi([-1 1],1);
                                            growthY = 0;
                                        else
                                            growthY = randi([-1,1],1);
                                            growthX = 0;
                                        end
                                        growthTest = rand(1);
                                        iRowC = iRow + growthY;
                                        iColC = iCol + growthX;
                                        if iRowC > size(obj.roomArray.ImageIndex,1) || iRowC < 1 || iColC > size(obj.roomArray.ImageIndex,2) || iColC < 1
                                            
                                        elseif obj.roomArray.ImageIndex(iRow + growthY,iCol + growthX) == 1 && iRow + growthY ~= obj.Size(1)/2 && iCol + growthX ~= obj.Size(2)/2
                                            obj.roomArray.ImageIndex(iRow+growthY,iCol+growthX) = 2;
                                            growthFactor = growthFactor - 0.2;
                                        end
                                    end
                                end
                                iCol = iCol + 1;
                            end
                        end
                end
                
                
                growthThreshold = randi([3 5],1);
                growthCounter = 0;
                iRow = 2;
                rowCounter = 2;
                while iRow <= obj.Size(1)-1
                    iCol = 2;
                    rowCounter = rowCounter + 1;
                    if rowCounter < obj.Size(1)-1
                        iRow = randi([2 obj.Size(1)-1]);
                    end
                    while iCol <= obj.Size(2)-1
                        if growthThreshold < growthCounter
                            iRow = obj.Size(1);
                            iCol = obj.Size(2);
                        else
                            
                        end
                        if rand(1) < 0.1 && iRow ~= obj.Size(1)/2 && iCol ~= obj.Size(2)/2 && obj.roomArray.ImageIndex(iRow,iCol) == 1
                            obj.roomArray.ImageIndex(iRow,iCol) = 3;
                            growthCounter = growthCounter + 1;
                            growthFactor = 0.9;
                            growthTest = rand(1);
                            while growthTest < growthFactor
                                growth = randi([0 1]);
                                if growth
                                    growthX = randi([-1 1],1);
                                    growthY = 0;
                                else
                                    growthY = randi([-1,1],1);
                                    growthX = 0;
                                end
                                growthTest = rand(1);
                                iRowC = iRow + growthY;
                                iColC = iCol + growthX;
                                if iRowC > size(obj.roomArray.ImageIndex,1) || iRowC < 1 || iColC > size(obj.roomArray.ImageIndex,2) || iColC < 1
                                elseif obj.roomArray.ImageIndex(iRow + growthY,iCol + growthX) == 1 && iRow + growthY ~= obj.Size(1)/2 && iCol + growthX ~= obj.Size(2)/2
                                    obj.roomArray.ImageIndex(iRow+growthY,iCol+growthX) = 3;
                                    growthFactor = growthFactor - 0.2;
                                end
                            end
                        end
                        iCol = iCol + 1;
                    end
                end
                
                
                
                
                obj.roomArray.Collision = (obj.roomArray.ImageIndex ~= 1);
                obj.roomArray.IsDoor = obj.roomArray.ImageIndex == 4;
                obj.roomArray.IsDoor = obj.roomArray.IsDoor + (obj.roomArray.ImageIndex == 8);
                obj.roomArray.IsDoor = obj.roomArray.IsDoor + (obj.roomArray.ImageIndex == 14);
                obj.roomArray.IsDoor = obj.roomArray.IsDoor + (obj.roomArray.ImageIndex == 11);
                
                
                
                
                %                 %% Find "quadrant" limits and create array for walls
                %                 %find median of rows
                %                 rowsMedian = median(1:(roomData.Size(1)+4));
                %                 lowerRestrictedRow = ceil(rowsMedian);
                %                 upperRestrictedRow = floor(rowsMedian);
                %
                %                 %do the same for columns
                %                 colsMedian = median(1:(roomData.Size(2)+1));
                %                 leftRestrictedCol = floor(colsMedian);
                %                 rightRestrictedCol = ceil(colsMedian);
                %
                %                 %generate left walls for room
                %                 for nRow = 1:(roomData.Size(1))
                %                     for mCol = 1:2
                %                         if nRow < 3
                %                             tempArray.Walls(nRow, mCol) = 6;
                %                         elseif nRow > (roomData.Size(1)-1)
                %                             tempArray.Walls(nRow, mCol) = 15;
                %                         else
                %                             tempArray.Walls(nRow, mCol) = 5;
                %                         end
                %                     end
                %                 end
                %
                %                 %generate right walls for room
                %                 for nRow = 1:(roomData.Size(1))
                %                     for mCol = (roomData.Size(2)-1):roomData.Size(2)
                %                         if nRow < 3
                %                             tempArray.Walls(nRow, mCol) = 9;
                %                         elseif nRow > (roomData.Size(1)-1)
                %                             tempArray.Walls(nRow, mCol) = 12;
                %                         else
                %                             tempArray.Walls(nRow, mCol) = 10;
                %                         end
                %                     end
                %                 end
                %
                %                 %insert top wall
                %                 tempArray.Walls(1:2, 3:(roomData.Size(2)-2)) = 7;
                %
                %                 %insert bottom wall
                %                 tempArray.Walls((roomData.Size(1)-1):roomData.Size(1), ...
                %                     3:(roomData.Size(2)-2)) = 13;
                %
                %
                %
                %                 %check to add right door
                %                 if obj.Doors.Right
                %                     quadrant1.Rows.min = 3;
                %                     quadrant1.Rows.max = (upperRestrictedRow-1);
                %                     quadrant4.Rows.min = (lowerRestrictedRow+1);
                %                     quadrant4.Rows.max = roomData.Size(1)-2;
                %
                %                     tempArray.Walls(upperRestrictedRow:lowerRestrictedRow, ...
                %                         (roomData.Size(2)-1):roomData.Size(2)) = 11;
                %                 else
                %                     quadrant1.Rows.min = 3;
                %                     quadrant1.Rows.min = (upperRestrictedRow);
                %                     quadrant4.Rows.min = lowerRestrictedRow;
                %                     quadrant4.Rows.max = roomData.Size(1)-2;
                %                 end
                %
                %                 %now check to add left door
                %                 if obj.Doors.Left
                %                     quadrant1.Rows.min = 3;
                %                     quadrant1.Rows.max = (upperRestrictedRow-1);
                %                     quadrant4.Rows.min = (lowerRestrictedRow+1);
                %                     quadrant4.Rows.max = roomData.Size(1)-2;
                %
                %                     tempArray.Walls(upperRestrictedRow:lowerRestrictedRow, ...
                %                         1:2) = 4;
                %                 else
                %                     quadrant2.Rows.min = 3;
                %                     quadrant2.Rows.max = (upperRestrictedRow);
                %                     quadrant3.Rows.min = lowerRestrictedRow;
                %                     quadrant4.Rows.max = roomData.Size(1)-2;
                %                 end
                %
                %                 %check to add top door
                %                 if obj.Doors.Top
                %                     quadrant1.Cols.min = rightRestrictedCol+1;
                %                     quadrant1.Cols.max = roomData.Size(2)-2;
                %                     quadrant2.Cols.min = 3;
                %                     quadrant2.Cols.max = leftRestrictedCol-1;
                %
                %                     tempArray.Walls(1:2, ...
                %                         leftRestrictedCol:rightRestrictedCol) = 8;
                %                 else
                %                     quadrant1.Cols.min = rightRestrictedCol;
                %                     quadrant1.Cols.max = roomData.Size(2)-2;
                %                     quadrant2.Cols.min = 3;
                %                     quadrant2.Cols.max = leftRestrictedCol;
                %                 end
                %
                %                 %check to add bottom door
                %                 if obj.Doors.Bottom
                %                     quadrant4.Cols.min = rightRestrictedCol;
                %                     quadrant4.Cols.max = roomData.Size(2)-2;
                %                     quadrant3.Cols.min = 3;
                %                     quadrant3.Cols.max = leftRestrictedCol;
                %
                %                     tempArray.Walls((roomData.Size(2)-1):roomData.Size(2),...
                %                         leftRestrictedCol:rightRestrictedCol) = 14;
                %                 else
                %                     quadrant4.Cols.min = (rightRestrictedCol+1);
                %                     quadrant4.Cols.max = roomData.Size(2)-2;
                %                     quadrant3.Cols.min = 3;
                %                     quadrant3.Cols.min = (leftRestrictedCol-1);
                %                 end
                %
                %                 %find center
                %                 Center.upperlimit = floor(rowsMedian-1);
                %                 Center.lowerlimit = ceil(rowsMedian+1);
                %                 Center.leftlimit = floor(colsMedian -2);
                %                 Center.rightlimit = ceil(colsMedian+2);
                %
                %                 quadrant5.Rows.min = Center.upperlimit;
                %                 quadrant5.Rows.max = Center.lowerlimit;
                %                 quadrant5.Cols.min = Center.leftlimit;
                %                 quadrant5.Cols.max = Center.rightlimit;
                %
                %                 %% create obstacles in quadrant that is called for
                %                 %will set a node as a starting point, only allowed to use a
                %                 %set number of nodes
                %                 nodesUsed = 0;
                %
                %                 %preallocate node structured array
                %                 node(obj.TileInfo.Nodes).row =1;
                %                 node(obj.TileInfo.Nodes).col =1;
                %
                %                 while nodesUsed < obj.TileInfo.Nodes
                %                     if obj.TileInfo.QuadrantsUsed.topRight
                %                         nodesUsed = nodesUsed +1;
                %                         node(nodesUsed).row = randi([2, 4]);
                %                         node(nodesUsed).col = randi([2, 6]);
                %                         node(nodesUsed).quadrant = 1;
                %                     end
                %
                %
                %                     if obj.TileInfo.QuadrantsUsed.topLeft
                %                         nodesUsed = nodesUsed +1;
                %                         node(nodesUsed).row = randi([2, 4]);
                %                         node(nodesUsed).col = randi([2, 6]);
                %                         node(nodesUsed).quadrant = 2;
                %                     end
                %
                %
                %                     if obj.TileInfo.QuadrantsUsed.bottomLeft
                %                         nodesUsed = nodesUsed +1;
                %                         node(nodesUsed).row = randi([2, 4]);
                %                         node(nodesUsed).col = randi([2, 6]);
                %                         node(nodesUsed).quadrant = 3;
                %                     end
                %
                %
                %                     if obj.TileInfo.QuadrantsUsed.bottomRight
                %                         nodesUsed = nodesUsed +1;
                %                         node(nodesUsed).row = randi([2, 4]);
                %                         node(nodesUsed).col = randi([2, 6]);
                %                         node(nodesUsed).quadrant = 4;
                %                     end
                %
                %
                %                     if obj.TileInfo.QuadrantsUsed.Center
                %                         nodesUsed = nodesUsed +1;
                %                         node(nodesUsed).row = randi([2, 5]);
                %                         node(nodesUsed).col = randi([2, 7]);
                %                         node(nodesUsed).quadrant = 5;
                %                     end
                %                 end
                %
                %                 quadrantArray = zeros([5, 7], 'uint8');
                %                 quadrantArray(2:4, 2:6) = uint8(1);
                %                 for i = 1:4
                %                     quadrant{i} = quadrantArray;
                %                 end
                %                 quadrantArray = zeros([6, 8], 'uint8');
                %                 quadrantArray(2:5, 2:7) = uint8(1);
                %                 quadrant{5} = quadrantArray;
                %
                %
                %                 %% Place obstacles in their respective quadrant
                %                 obstaclesPlaced = 0;
                %
                %                 switch obstacle
                %                     case 1 %only blocks used
                %                         for i = 1:nodesUsed
                %                             quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                %                                 = 2;
                %                             obstaclesPlaced + 1;
                %                         end
                %
                %                         while obstaclesPlaced < obj.NumberObstacles
                %                             for i = 1:nodesUsed
                %                                 currentQuadrant = node(i).quadrant;
                %                                 currentRow = node(i).row;
                %                                 currentCol = node(i).col;
                %
                %                                 switch randi(4)
                %                                     case 1 %go up
                %                                         if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                %                                             currentRow = currentRow - 1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 2 %go down
                %                                         if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                %                                             currentRow = currentRow+1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 3 %go left
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                %                                             currentRow = (currentCol-1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 4 %go right
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                %                                             currentRow = (currentCol+1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 2;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %
                %                                 end
                %
                %                             end
                %
                %                         end
                %                     case 2 %only water used
                %                         for i = 1:nodesUsed
                %                             quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                %                                 = 3;
                %                             obstaclesPlaced = obstaclesPlaced + 1;
                %                         end
                %
                %                         while obstaclesPlaced < obj.NumberObstacles
                %                             for i = 1:nodesUsed
                %                                 currentQuadrant = node(i).quadrant;
                %                                 currentRow = node(i).row;
                %                                 currentCol = node(i).col;
                %
                %                                 switch randi(4)
                %                                     case 1 %go up
                %                                         if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                %                                             currentRow = currentRow - 1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 2 %go down
                %                                         if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                %                                             currentRow = currentRow+1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 3 %go left
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                %                                             currentRow = (currentCol-1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 4 %go right
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                %                                             currentRow = (currentCol+1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = 3;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %
                %                                 end
                %
                %                             end
                %
                %                         end
                %
                %                     case 3 %both, water will take preference though
                %                         for i = 1:nodesUsed
                %                             place = randi([2, 3]);
                %                             quadrant{node(i).quadrant}(node(i).row, node(i).col) ...
                %                                 = place;
                %                             obstaclesPlaced = obstaclesPlaced + 1;
                %                         end
                %                         while obstaclesPlaced < obj.NumberObstacles
                %                             for i = 1:nodesUsed
                %                                 currentQuadrant = node(i).quadrant;
                %                                 currentRow = node(i).row;
                %                                 currentCol = node(i).col;
                %                                 place = quadrant{currentQuadrant}((currentRow), currentCol);
                %                                 switch randi(4)
                %                                     case 1 %go up
                %                                         if quadrant{currentQuadrant}((currentRow - 1), currentCol) ==1
                %                                             currentRow = currentRow - 1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = place;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 2 %go down
                %                                         if quadrant{currentQuadrant}((currentRow + 1), currentCol) ==1
                %                                             currentRow = currentRow+1;
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = place;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 3 %go left
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol-1)) ==1
                %                                             currentRow = (currentCol-1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = place;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                     case 4 %go right
                %                                         if quadrant{currentQuadrant}((currentRow), (currentCol+1)) ==1
                %                                             currentRow = (currentCol+1);
                %                                             quadrant{currentQuadrant}(currentRow, currentCol) = place;
                %                                             obstaclesPlaced = obstaclesPlaced +1;
                %                                         end
                %                                 end
                %                             end
                %                         end
                %                 end
                %                 tempArray.Walls(3:14, 3:10) = uint8(1);
                %                 tempArray.Walls(3:5, 3:7) = quadrant{2}(2:4, 2:6);
                %                 tempArray.Walls(8:10, 3:7) = quadrant{3}(2:4, 2:6);
                %                 tempArray.Walls(3:5, 10:14) = quadrant{1}(2:4, 2:6);
                %                 tempArray.Walls(8:10, 10:14) = quadrant{4}(2:4, 2:6);
                %                 tempArray.Walls(5:8, 6:11) = quadrant{5}(2:5, 2:7);
                %
                %                 obj.roomArray.ImageIndex = tempArray.Walls;
                %                 obj.roomArray.Collision = (obj.roomArray.ImageIndex ~= 1);
                %                 obj.roomArray.IsDoor = obj.roomArray.ImageIndex == 4;
                %                 array = obj.roomArray.ImageIndex == 8 ;
                %                 obj.roomArray.IsDoor = obj.roomArray.IsDoor + array;
                %                 array = obj.roomArray.ImageIndex == 11;
                %                 obj.roomArray.IsDoor = obj.roomArray.IsDoor + array;
                %                 array = obj.roomArray.ImageIndex == 14;
                %                 obj.roomArray.IsDoor = obj.roomArray.IsDoor + array;
            end
        end
    end
end
