function Snake

%--------------------------------------------------------------------------
%Snake
%Version 1.00
%Created by Stepen
%Created 26 November 2011
%Last modified 4 December 2012
%--------------------------------------------------------------------------
%Snake starts GUI game of classic snake.
%--------------------------------------------------------------------------
%How to play Snake:
%Player collects score by controlling the snake's movement using w-s-a-d
%button or directional arrow button to the food while avoid crashing the
%walls and its own tail. Use shift to speed up your snake, ctrl to slow
%down your snake, and p to pause your game.
%--------------------------------------------------------------------------

%CodeStart-----------------------------------------------------------------
%Reseting MATLAB environment
    close all
    clear all
%Declaring global variables
    playstat=0;
    pausestat=0;
    quitstat=0;
    field=zeros(28);
    arenaindex=1;
    snakepos=zeros(8,2);
    snakevel=1;
    snakedir='right';
    truedir='right';
    snakescore=0;
    foodpos=zeros(3,2);
    speedmultiplier=1;
%Defining variables for deffield
    deffield=cell(1,3);
    deffield{1}=zeros(28);
    deffield{2}=zeros(28);
    deffield{2}([1,28],:)=9;
    deffield{2}(:,[1,28])=9;
    deffield{3}=zeros(28);
    deffield{3}([1,28],:)=9;
    deffield{3}(:,[1,28])=9;
    deffield{3}(6:23,6:23)=9;
    deffield{4}=zeros(28);
    deffield{4}(2:6:28,1:20)=9;
    deffield{4}(29:-6:1,28:-1:9)=9;
%Generating GUI
    ScreenSize=get(0,'ScreenSize');
    mainwindow=figure('Name','Snake',...
                      'NumberTitle','Off',...
                      'Menubar','none',...
                      'Resize','off',...
                      'Units','pixels',...
                      'Position',[0.5*(ScreenSize(3)-384),...
                                  0.5*(ScreenSize(4)-400),...
                                  384,400],...
                      'WindowKeyPressFcn',@pressfcn,...
                      'WindowKeyReleaseFcn',@releasefcn,...
                      'DeleteFcn',@closegamefcn);
    axes('Parent',mainwindow,...
         'Units','pixel',...
         'Position',[52,100,280,280]);
    lscoretext=uicontrol('Parent',mainwindow,...
                         'Style','text',...
                         'String','0',...
                         'FontSize',15,...
                         'HorizontalAlignment','center',...
                         'BackgroundColor',[0.8,0.8,0.8],...
                         'Units','pixels',...
                         'Position',[10,220,40,40]);
    rscoretext=uicontrol('Parent',mainwindow,...
                         'Style','text',...
                         'String','0',...
                         'FontSize',15,...
                         'HorizontalAlignment','center',...
                         'BackgroundColor',[0.8,0.8,0.8],...
                         'Units','pixels',...
                         'Position',[334,220,40,40]);
    arenapopup=uicontrol('Parent',mainwindow,...
                         'Style','popup',...
                         'String',{'Infinite',...
                                   'Cage',...
                                   'Track Field',...
                                   'Puzzle'},...
                         'Units','normalized',...
                         'Position',[0.4,0.2,0.2,0.025],...
                         'Callback',@selectarenapopupfcn);
    speedslider=uicontrol('Parent',mainwindow,...
                          'Style','slider',...
                          'Value',1,...
                          'Min',1,...
                          'Max',100,...
                          'SliderStep',[1/99,2/99],...
                          'Units','normalized',...
                          'Position',[0.375,0.13,0.25,0.03],...
                          'Callback',@movespeedsliderfcn);
    speedtext=uicontrol('Parent',mainwindow,...
                        'Style','text',...
                        'String','1',...
                        'HorizontalAlignment','center',...
                        'BackgroundColor',[0.8,0.8,0.8],...
                        'Units','normalized',...
                        'Position',[0.475,0.1,0.05,0.03]);
    startbutton=uicontrol('Parent',mainwindow,...
                          'Style','pushbutton',...
                          'String','Start Game',...
                          'Visible','on',...
                          'Units','normalized',...
                          'Position',[0.15,0.15,0.2,0.05],...
                          'Callback',@startgamefcn);
    stopbutton=uicontrol('Parent',mainwindow,...
                         'Style','pushbutton',...
                         'String','Stop Game',...
                         'Visible','off',...
                         'Units','normalized',...
                         'Position',[0.15,0.15,0.2,0.05],...
                         'Callback',@stopgamefcn);
    uicontrol('Parent',mainwindow,...
              'Style','pushbutton',...
              'String','Close Game',...
              'Units','normalized',...
              'Position',[0.65,0.15,0.2,0.05],...
              'Callback',@closegamefcn);
    instructionbox=uicontrol('Parent',mainwindow,...
                             'Style','text',...
                             'String',['Click Start Game button to',...
                                       ' begin the game...'],...
                             'Units','normalized',...
                             'Position',[0.1,0.05,0.8,0.04]);
%Inititiating graphics
    field=generatefieldarray(deffield,snakepos,foodpos);
    drawfield(field)
%Declaring LocalFunction
    %Start of generatefieldarray
    function field=generatefieldarray(deffield,snakepos,foodpos)
        field=deffield{arenaindex};
        for count=1:length(snakepos)
            if ~((snakepos(count,1)==0)||(snakepos(count,2)==0))
                field(snakepos(count,1),snakepos(count,2))=1;
                if count==1
                    field(snakepos(1,1),snakepos(1,2))=2;
                end
            end
        end
        for count=1:length(foodpos)
            if ~((foodpos(count,1)==0)||(foodpos(count,2)==0))
                field(foodpos(count,1),foodpos(count,2))=5;
            end
        end
    end
    %End of generatefieldarray
    %Start of drawfield
    function drawfield(field)
        %Preparing array for field graphic
        graphics=uint8(zeros(280,280,3));
        %Calculating field graphic array
        for row=1:28
        for col=1:28
            %Drawing wall
            if field(row,col)==9
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,1)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,2)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,3)=0;
            end
            %Drawing snake
            if field(row,col)==1
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,1)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,2)=128;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,3)=0;
            end
            %Drawing snake's head
            if field(row,col)==2
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,1)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,2)=64;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,3)=0;
            end
            %Drawing food
            if field(row,col)==5
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,1)=255;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,2)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,3)=0;
            end
            %Drawing ground
            if field(row,col)==0
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,1)=0;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,2)=255;
                graphics(((row-1)*10)+1:((row-1)*10)+10,...
                         ((col-1)*10)+1:((col-1)*10)+10,3)=0;
            end
        end
        end
        %Drawing graphic
        imshow(graphics)
    end
    %End of drawfield
%Declaring CallbackFunction
    %Start of pressfcn
    function pressfcn(~,event)
        switch event.Key
            case 'w'
                if ~strcmpi(truedir,'down')
                    snakedir='up';
                end
            case 'uparrow'
                if ~strcmpi(truedir,'down')
                    snakedir='up';
                end
            case 's'
                if ~strcmpi(truedir,'up')
                    snakedir='down';
                end
            case 'downarrow'
                if ~strcmpi(truedir,'up')
                    snakedir='down';
                end
            case 'a'
                if ~strcmpi(truedir,'right')
                    snakedir='left';
                end
            case 'leftarrow'
                if ~strcmpi(truedir,'right')
                    snakedir='left';
                end
            case 'd'
                if ~strcmpi(truedir,'left')
                    snakedir='right';
                end
            case 'rightarrow'
                if ~strcmpi(truedir,'left')
                    snakedir='right';
                end
            case 'shift'
                speedmultiplier=10;
            case 'control'
                speedmultiplier=0.5;
            case 'p'
                pausestat=1-pausestat;
        end
    end
    %End of pressfcn
    %Start of releasefcn
    function releasefcn(~,event)
        switch event.Key
            case 'shift'
                speedmultiplier=1;
            case 'control'
                speedmultiplier=1;
        end
    end
    %End of releasefcn
    %Start of selectarenapopup
    function selectarenapopupfcn(~,~)
        arenaindex=get(arenapopup,'Value');
        field=generatefieldarray(deffield,snakepos,foodpos);
        drawfield(field)
        set(instructionbox,'String',['Arena was set to ',...
                                     num2str(arenaindex)])
    end
    %End of selectarenapopup
    %Start of speedsliderfcn
    function movespeedsliderfcn(~,~)
        snakevel=get(speedslider,'Value');
        snakevel=round(snakevel);
        set(speedtext,'String',num2str(snakevel))
        set(instructionbox,'String',['Snake speed was set to ',...
                                     num2str(snakevel)])
    end
    %End of speedsliderfcn
    %Start of startgamefcn
    function startgamefcn(~,~)
        %Locking user interface
        set(startbutton,'Visible','off')
        set(stopbutton,'Visible','on')
        set(arenapopup,'Enable','off')
        set(speedslider,'Enable','off')
        %Resetting variables
        playstat=1;
        snakepos=zeros(8,2);
        snakepos(:,1)=25;
        snakepos(:,2)=15:-1:8;
        snakevel=get(speedslider,'Value');
        snakedir='right';
        snakescore=0;
        %Initiating graphics
        field=generatefieldarray(deffield,snakepos,foodpos);
        drawfield(field)
        %Placing initial food
        count=1;
        while count<4
            foodpos(count,1)=1+round(27*rand);
            foodpos(count,2)=1+round(27*rand);
            if field(foodpos(count,1),foodpos(count,2))==0
                count=count+1;
            end
        end
        %Redrawing graphics
        field=generatefieldarray(deffield,snakepos,foodpos);
        drawfield(field)
        %Performing loop for the game
        while playstat==1
            %Creating loop for game pause
            while pausestat
                pause(0.01)
                set(instructionbox,'String','Game paused!')
            end
            %Calculating snake's forward movement
            if strcmpi(snakedir,'left')
                nextmovepos=[snakepos(1,1),snakepos(1,2)-1];
                truedir='left';
                if nextmovepos(2)==0
                    nextmovepos(2)=28;
                end
            elseif strcmpi(snakedir,'right')
                nextmovepos=[snakepos(1,1),snakepos(1,2)+1];
                truedir='right';
                if nextmovepos(2)==29
                    nextmovepos(2)=1;
                end
            elseif strcmpi(snakedir,'up')
                nextmovepos=[snakepos(1,1)-1,snakepos(1,2)];
                truedir='up';
                if nextmovepos(1)==0
                    nextmovepos(1)=28;
                end
            elseif strcmpi(snakedir,'down')
                nextmovepos=[snakepos(1,1)+1,snakepos(1,2)];
                truedir='down';
                if nextmovepos(1)==29
                    nextmovepos(1)=1;
                end
            end
            %Checking snake's forward movement position for food
            if field(nextmovepos(1),nextmovepos(2))==5
                growstat=1;
                %Deleting eaten food
                for count=1:3
                    if isequal(nextmovepos,foodpos(count,:))
                        foodpos(count,:)=[];
                        break
                    end
                end
                %Adding new food
                addstat=1;
                while addstat==1
                    foodpos(3,1)=1+round(27*rand);
                    foodpos(3,2)=1+round(27*rand);
                    if field(foodpos(3,1),foodpos(3,2))==0
                        addstat=0;
                    end
                end
            else
                growstat=0;
            end
            %Checking snake's forward movement for wall
            if (field(nextmovepos(1),nextmovepos(2))==1)||...
               (field(nextmovepos(1),nextmovepos(2))==9)
                set(instructionbox,'String','Ouch! Game over!')
                playstat=0;
                break
            end
            %Moving snake forward
            if growstat==1
                snakepos=[nextmovepos;snakepos(1:length(snakepos),:)];
                snakescore=snakescore+1;
                set(instructionbox,'String','Yummy!')
            else
                snakepos=[nextmovepos;snakepos(1:length(snakepos)-1,:)];
                set(instructionbox,'String','Watch out for walls!')
            end
            %Updating graphics
            field=generatefieldarray(deffield,snakepos,foodpos);
            drawfield(field)
            %Performing delay
            set(lscoretext,'String',num2str(snakescore))
            set(rscoretext,'String',num2str(snakescore))
            pause(0.1/(speedmultiplier*snakevel))
        end
        %Unlocking user interface
        if quitstat==0
            set(startbutton,'Visible','on')
            set(stopbutton,'Visible','off')
            set(arenapopup,'Enable','on')
            set(speedslider,'Enable','on')
        end
    end
    %End of startgamefcn
    %Start of stopgamefcn
    function stopgamefcn(~,~)
        %Stopping game loop
        playstat=0;
        %Displaying instruction
        set(instructionbox,...
            'String','Game stopped! Press start to begin new game...')
    end
    %End of stopgamefcn
    %Start of closegamefcn
    function closegamefcn(~,~)
        %Stopping game loop
        playstat=0;
        quitstat=1;
        pause(0.5)
        %Closing all windows
        delete(mainwindow)
    end
    %End of closegamefcn
%CodeEnd-------------------------------------------------------------------
end
