function BattleStatsF(pCharacter, eCharacter, handles)

%This function sets up the battle

%Fetches stats for each participant
[player,enemy]=whichClass(pCharacter,eCharacter);

%% Set Health Sliders

%Player
handles.pHealthSlider.Max=player.hmax;
handles.pHealthSlider.Value=player.health;
handles.pHealthSlider.UserData=player.health; %Anti-Cheat Measure
%Enemy
handles.eHealthSlider.Max=enemy.hmax;
handles.eHealthSlider.Value=enemy.health;
handles.eHealthSlider.UserData=enemy.health; %Anti-Cheat Measure

%% Set Health Boxes
handles.pHealthBox.String=num2str(handles.pHealthSlider.Value);
handles.eHealthBox.String=num2str(handles.eHealthSlider.Value);

%% Set Names
handles.pName.String=player.name;
handles.eName.String=enemy.name;

%% Display Portraits

%Read Images
pic1=imread(player.portrait1);
pic2=imread(enemy.portrait1);
%Show Images
imshow(pic1,'InitialMagnification','fit','Parent',handles.pPic);
imshow(pic2,'InitialMagnification','fit','Parent',handles.ePic);

%% Set List of Attacks - I HAVE CHANGED THIS!!! ~ Matthew Phelps
% NOW INCLUDES MODIFIERS ALONG WITH NAME 
 
% Add name and attack damage
attack1=[player.attack1n,' ~ Dam: ',num2str(player.attack1d),','];
% Add accuracy
if player.attack1a<player.accuracy
    attack1=[attack1,' Acc: ',num2str(player.attack1a-player.accuracy)];
else
    attack1=[attack1,' Acc: +',num2str(player.attack1a-player.accuracy)];
end; 
% Add name and attack damage
attack2=[player.attack2n,' ~ Dam: ',num2str(player.attack2d),','];
% Add accuracy
if player.attack2a<player.accuracy
    attack2=[attack2,' Acc: ',num2str(player.attack2a-player.accuracy)];
else
    attack2=[attack2,' Acc: +',num2str(player.attack2a-player.accuracy)];
end;
  
% Add name and attack damage
attack3=[player.attack3n,' ~ Dam: ',num2str(player.attack3d),','];
% Add accuracy
if player.attack3a<player.accuracy
    attack3=[attack3,' Acc: ',num2str(player.attack3a-player.accuracy)];
else
    attack3=[attack3,' Acc: +',num2str(player.attack3a-player.accuracy)];
end;
% ~~~~~~~~~~~~~~~~~~~~
attacks={attack1,attack2,attack3};
set(handles.attackList,'String',attacks);


%% DISPLAY DEFAULT PLAYER AND ENEMY STATS   -  SOMETHING NEW

handles.pStrengthBox.String=num2str(player.strength);
handles.pAccuracyBox.String=num2str(player.accuracy);
handles.pDodgeBox.String=num2str(player.dodge);
handles.pArmorBox.String=num2str(player.armor);

handles.eStrengthBox.String=num2str(enemy.strength);
handles.eAccuracyBox.String=num2str(enemy.accuracy);
handles.eDodgeBox.String=num2str(enemy.dodge);
handles.eArmorBox.String=num2str(enemy.armor);