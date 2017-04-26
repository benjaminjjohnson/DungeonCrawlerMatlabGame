function BattleStatsF(pCharacter, eCharacter, handles)

%This function sets up the battle

%Fetches stats for each participant
[player,enemy]=whichClass(pCharacter,eCharacter);

%% Set Information

%Set Health Sliders
handles.pHealthSlider.Max=player.hmax;
handles.pHealthSlider.Value=player.health;
handles.eHealthSlider.Max=enemy.hmax;
handles.eHealthSlider.Value=enemy.health;
%Set Health Boxes
handles.pHealthBox.String=num2str(handles.pHealthSlider.Value);
handles.eHealthBox.String=num2str(handles.eHealthSlider.Value);
%Set Names
handles.pName.String=player.name;
handles.eName.String=enemy.name;

%% Display Portraits

%Read Images
pic1=imread(player.portrait);
pic2=imread(enemy.portrait);
%Show Images
imshow(pic1,'InitialMagnification','fit','Parent',handles.pPic);
imshow(pic2,'InitialMagnification','fit','Parent',handles.ePic);

%% Set List of Attacks
attack1=player.attack1n;
attack2=player.attack2n;
attack3=player.attack3n;
attacks={attack1,attack2,attack3};
set(handles.attackList,'string',attacks);