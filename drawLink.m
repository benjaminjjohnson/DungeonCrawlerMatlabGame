function drawLink(handles,position)
[linkSprite,linkMap] = imread('Generic character.png','png');
linkSpriteFlipped = flip(linkSprite);
colormap(handles.roomAxes,linkMap);

axes(handles.roomAxes)
handles.roomAxes.YLim = [0 10];
handles.roomAxes.XLim = [0 10];
handles.roomAxes.Position = position;

image('XData',[0 10],'YData',[0 10],'CData',linkSpriteFlipped);