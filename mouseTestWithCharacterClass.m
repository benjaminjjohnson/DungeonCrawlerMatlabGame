function [link1] = mouseTestWithCharacterClass(playerLength, playerHeight, link1, enemyList, roomClass)

position = [0 0 1 1];

screenRatio = 16/9;
linkXSpeed = 0.0075;
linkYSpeed = linkXSpeed * screenRatio;
% playerLength = 0.025;
% playerHeight = 0.01;
% link1XPos = 0;
% link1YPos = 0;
% link1 = character(link1XPos,link1YPos,10,10,100,{'Little character left 1.png', 'Little character left 2.png', 'Little character right 1.png', 'Little character right 2.png'});

% Set up the figure window and maximize it
figure1 = figure('Name',(['Room at: ', num2str(roomClass.Position(1)),', ',num2str(roomClass.Position(2))]));
figure(figure1);
set(figure1, 'Position', get(0,'Screensize'));

% Set up the axes to represent the room
roomAxes = axes('Position',position,'XLim',[0 1],'YLim',[0 1]); % Fill the figure
% Construct an image object with the character image data and position
% equal to player object passed to the room display function
linkImage = image('XData',[link1.xPos, link1.xPos + playerLength],'YData',[link1.yPos,link1.yPos + playerHeight],'CData',link1.spriteList(1).cData,'AlphaData',link1.spriteList(1).alphaMap,'Parent',roomAxes);
axis off % Turn the graph on the axes off

% Initilize counter variables
frame = 0; % Used to time animations and the like, incremented every iteration of the while loop
animation = 1; % Used to swap between the two frames of animation for the character, bounces between 1 and 2 every time a new frame of animation for the character is displayed
wAnimation = 1; % Used to swap between the four frames of animation for the water, goes from 1 to 4 and loops back around, incremented every time a frame of animation is displayed for the water
moveCounter = 0; % Used to keep track of the number of frames the character has moved for. Once this reaches 30, there is a chance to encounter a monster, after which the value is reset to 0.
roomTransition = false; % Flag flipped whenever the character touches a door - indicates a room transition
linkMove = false;
previousAnimation = true;

%% Draw Room Tiles
[yLength,xLength] = size(roomClass.roomArray.ImageIndex); % Variables deliniating the size of the room

% Nested FOR loop to iterate through the ImageIndex array
for iXRoom = 1:xLength 
    for iYRoom = 1:yLength
        switch roomClass.roomArray.ImageIndex(iYRoom,iXRoom) % Determine which type of tile the current position on the axis should display as, and load that image data
            case 1
                cDataTemp = roomClass.Images.Tile;
            case 2
                cDataTemp = roomClass.Images.Block;
            case 3
                cDataTemp = roomClass.Images.Water.one;
            case 4
                cDataTemp = roomClass.Images.Wall.leftDoor;
            case 5
                cDataTemp = roomClass.Images.Wall.leftWall;
            case 6
                cDataTemp = roomClass.Images.Wall.topLeft;
            case 7
                cDataTemp = roomClass.Images.Wall.topWall;
            case 8
                cDataTemp = roomClass.Images.Wall.topDoor;
            case 9
                cDataTemp = roomClass.Images.Wall.topRight;
            case 10
                cDataTemp = roomClass.Images.Wall.rightWall;
            case 11
                cDataTemp = roomClass.Images.Wall.rightDoor;
            case 12
                cDataTemp = roomClass.Images.Wall.bottomRight;
            case 13
                cDataTemp = roomClass.Images.Wall.bottomWall;
            case 14
                cDataTemp = roomClass.Images.Wall.bottomDoor;
            case 15
                cDataTemp = roomClass.Images.Wall.bottomLeft;
            case 16
                cDataTemp = roomClass.Images.Treasure;
        end
        % Create an image object using the loaded image data and the
        % current position on the room grid
        displayImage(iXRoom,iYRoom) = image('XData',[(iXRoom-1)/(xLength + 1), iXRoom/(xLength + 1)],'YData',[((yLength+1)-iYRoom)/(yLength+1), ((yLength+2)-iYRoom)/(yLength+1)],'CData',cDataTemp,'Parent',roomAxes);
        if roomClass.roomArray.ImageIndex(iYRoom,iXRoom) == 3
            uistack(displayImage(iXRoom,iYRoom),'bottom')
        end
            
    end
end

uistack(linkImage,'top') % Displays the character image above the room tiles

% Main while loop, updates various aspects of the images with each
% iteration
while ~roomTransition
    mouse = get(0,'PointerLocation'); % store the current mouse position in pixels in an array called mouse
    %% Update Charactor's Position
    if (mouse(1) < 760) % If the mouse is on the left side of the screen
        if mouse(2) < 300 % If the mouse is on the bottom half of the screen
            link1.xPos = link1.xPos - linkXSpeed; % Move the character left
            link1.yPos = link1.yPos - linkYSpeed; % Move the character down
            
            % Calculate the tiles the character now takes up
            xTileL = 1 + floor(link1.xPos * (xLength + 1)); % Calculate the x coordinate of the possibly new leftmost column the character takes up
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1)); % Same for the rightmost column
            yTileL = -1 + floor(link1.yPos * (yLength + 1)); % Same for the lowest y coordinate
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1)); % Same for the highest y coordinate
            
            % Determine if any collisions have occured based on the
            % collision array within the roomArray struct
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                % If there was a collision, reset the character's position
                link1.xPos = link1.xPos + linkXSpeed;
                link1.yPos = link1.yPos + linkYSpeed;
            end
            
            % Determine if the player has touched a door
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        elseif mouse(2) > 700
            link1.xPos = link1.xPos - linkXSpeed;
            link1.yPos = link1.yPos + linkYSpeed;
            if(link1.xPos < 0)
                link1.xPos = 0;
            end
            if(link1.yPos > 0.95)
                link1.yPos = 0.95;
            end
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.xPos = link1.xPos + linkXSpeed;
                link1.yPos = link1.yPos - linkYSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        else
            link1.xPos = link1.xPos - linkXSpeed;
            if(link1.xPos < 0)
                link1.xPos = 0;
            end
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.xPos = link1.xPos + linkXSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        end
        linkMove = true; % Set the flag that the charater moved in this loop iteration
    elseif (mouse(1) > 1160)
        if mouse(2) < 300
            link1.xPos = link1.xPos + linkXSpeed;
            link1.yPos = link1.yPos - linkYSpeed;
            if(link1.xPos > 0.95)
                link1.xPos = 0.95;
            end
            if(link1.yPos < 0)
                link1.yPos = 0;
            end
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.xPos = link1.xPos - linkXSpeed;
                link1.yPos = link1.yPos + linkYSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        elseif mouse(2) > 700
            link1.xPos = link1.xPos + linkXSpeed;
            link1.yPos = link1.yPos + linkYSpeed;
            if(link1.xPos > 0.95)
                link1.xPos = 0.95;
            end
            if(link1.yPos > 0.95)
                link1.yPos = 0.95;
            end
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.xPos = link1.xPos - linkXSpeed;
                link1.yPos = link1.yPos - linkYSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        else
            link1.xPos = link1.xPos + linkXSpeed;
            if(link1.xPos > 0.95)
                link1.xPos = 0.95;
            end
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.xPos = link1.xPos - linkXSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        end
        linkMove = true;
    else
        if mouse(2) < 300
            link1.yPos = link1.yPos - linkYSpeed;
            if(link1.yPos < 0)
                link1.yPos = 0;
            end
            linkMove = true;
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.yPos = link1.yPos + linkYSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        elseif mouse(2) > 700
            link1.yPos = link1.yPos + linkYSpeed;
            if(link1.yPos > 0.95)
                link1.yPos = 0.95;
            end
            linkMove = true;
            xTileL = 1 + floor(link1.xPos * (xLength + 1));
            xTileR = 1 +  floor((link1.xPos + playerLength) * (xLength + 1));
            yTileL = -1 + floor(link1.yPos * (yLength + 1));
            yTileH = -1 + floor((link1.yPos + playerHeight) * (yLength + 1));
            if roomClass.roomArray.Collision(yLength-yTileL,xTileL) || roomClass.roomArray.Collision(yLength-yTileH,xTileL) || roomClass.roomArray.Collision(yLength-yTileL,xTileR) || roomClass.roomArray.Collision(yLength-yTileH,xTileR)
                link1.yPos = link1.yPos - linkYSpeed;
            end
            if roomClass.roomArray.IsDoor(yLength-yTileL,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL) || roomClass.roomArray.IsDoor(yLength-yTileL,xTileR) || roomClass.roomArray.IsDoor(yLength-yTileH,xTileL)
                roomTransition = true;
            end
        end
    end
        
    % Actually move the image object
    linkImage.XData = [link1.xPos, link1.xPos + playerLength];
    linkImage.YData = [link1.yPos, link1.yPos + playerHeight];
    
    % Play a new frame of character animation every 3 loop cycles
    if mod(frame,3) == 0 % Every 3 cycles
        animation = animation + 1; % Increment animaion
        if animation > 2 % Loop back around if necessary
            animation = 1;
        end
        % Determine whetehr the character is facing left or right
        if mouse(1) < 960 % Left-facing, so left-facing sprites are used
            linkImage.CData = link1.spriteList(animation).cData;
            linkImage.AlphaData = link1.spriteList(animation).alphaMap;
            previousAnimation = true; % Set a flag indicating which frame of animation was used last
        elseif mouse(1) > 960 % Right-facing, so right-facing sprites are used
            linkImage.CData = link1.spriteList(animation + 2).cData;
            linkImage.AlphaData = link1.spriteList(animation + 2).alphaMap;
            previousAnimation = false;
        else
            % If the mouse is in the center of the screen, display the
            % first frame of animation in whichever direction the mouse is
            % pointing
            if previousAnimation
                linkImage.CData = link1.spriteList(1).cData;
                linkImage.AlphaData = link1.spriteList(1).alphaMap;
            else
                linkImage.CData = link1.spriteList(1 + 2).cData;
                linkImage.AlphaData = link1.spriteList(1 + 2).alphaMap;
            end
        end
    end
    
    % Play a new frame of water animation every 4 loop cycles
    if mod(frame,4) == 0
        wAnimation = wAnimation + 1; % Increment the current frame counter
        if wAnimation > 4
            wAnimation = 1; % Loop back if necessary
        end
        % Another nested for loop to iterate through the ImageIndex array
        for iXRoom = 1:xLength
            for iYRoom = 1:yLength
                if roomClass.roomArray.ImageIndex(iYRoom,iXRoom) == 3
                    switch wAnimation
                        case 1
                            displayImage(iXRoom,iYRoom).CData = roomClass.Images.Water.one;
                        case 2
                            displayImage(iXRoom,iYRoom).CData = roomClass.Images.Water.two;
                        case 3
                            displayImage(iXRoom,iYRoom).CData = roomClass.Images.Water.three;
                        case 4
                            displayImage(iXRoom,iYRoom).CData = roomClass.Images.Water.four;
                    end
                end
            end
        end
        uistack(linkImage,'top') % Make sure the character is still on top
    end
    
    if mouse(1) > 760 && mouse(1) < 1160 && mouse(2) > 300 && mouse(2) < 700
        if previousAnimation
            linkImage.CData = link1.spriteList(1).cData;
            linkImage.AlphaData = link1.spriteList(1).alphaMap;
        else
            linkImage.CData = link1.spriteList(1 + 2).cData;
            linkImage.AlphaData = link1.spriteList(1 + 2).alphaMap;
        end     
    end
    frame = frame + 1;
    if linkMove
%         moveCounter = moveCounter + 1;
%         if moveCounter > 30
%             if randi(25,1) == 1
%                 BSGUI;
%                 hGui = findobj('Tag','tformChoiceGui');
%                 waitfor(hGui);
%             end
%         end
    end
    pause(0.04);
end
close(figure1)