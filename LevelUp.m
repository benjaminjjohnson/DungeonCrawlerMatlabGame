function varargout = LevelUp(varargin)
% LEVELUP MATLAB code for LevelUp.fig
%      LEVELUP, by itself, creates a new LEVELUP or raises the existing
%      singleton*.
%
%      H = LEVELUP returns the handle to a new LEVELUP or the handle to
%      the existing singleton*.
%
%      LEVELUP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEVELUP.M with the given input arguments.
%
%      LEVELUP('Property','Value',...) creates a new LEVELUP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LevelUp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LevelUp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LevelUp

% Last Modified by GUIDE v2.5 26-Apr-2017 21:36:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LevelUp_OpeningFcn, ...
                   'gui_OutputFcn',  @LevelUp_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LevelUp is made visible.
function LevelUp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LevelUp (see VARARGIN)

% Choose default command line output for LevelUp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LevelUp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LevelUp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in damButton.
function damButton_Callback(hObject, eventdata, handles)
% hObject    handle to damButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pCharacter=2;
switch pCharacter
    case 1
        knight=load('knightStats');
        variables=fields(knight);
        knight=knight.(variables{1});
        knight.strength=knight.strength+0.2;
        knight.hmax=knight.hmax+2;
        knight.health=knight.health+2;
        knight.level=knight.level+1;
        save('knightStats','knight');
        close(LevelUp);
    case 2
        sorcerer=load('sorcererStats');
        variables=fields(sorcerer);
        sorcerer=sorcerer.(variables{1});
        sorcerer.strength=sorcerer.strength+0.2;
        sorcerer.hmax=sorcerer.hmax+2;
        sorcerer.health=sorcerer.health+2;        
        sorcerer.level=sorcerer.level+1;
        save('sorcererStats','sorcerer');
        close(LevelUp);
    case 3
        thief=load('thiefStats');
        variables=fields(thief);
        thief=thief.(variables{1});
        thief.strength=thief.strength+0.2;
        thief.hmax=thief.hmax+2;
        thief.health=thief.health+2;
        thief.level=thief.level+1;
        save('thiefStats','thief');
        close(LevelUp);
end

% --- Executes on button press in dodButton.
function dodButton_Callback(hObject, eventdata, handles)
% hObject    handle to dodButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pCharacter=2;
switch pCharacter
    case 1
        knight=load('knightStats');
        variables=fields(knight);
        knight=knight.(variables{1});
        knight.dodge=knight.dodge+1;
        knight.hmax=knight.hmax+2;
        knight.health=knight.health+2;
        knight.level=knight.level+1;
        save('knightStats','knight');
        close(LevelUp);
    case 2
        sorcerer=load('sorcererStats');
        variables=fields(sorcerer);
        sorcerer=sorcerer.(variables{1});
        sorcerer.dodge=sorcerer.dodge+1;
        sorcerer.hmax=sorcerer.hmax+2;
        sorcerer.health=sorcerer.health+2;
        sorcerer.level=sorcerer.level+1;
        save('sorcererStats','sorcerer');
        close(LevelUp);
    case 3
        thief=load('thiefStats');
        variables=fields(thief);
        thief=thief.(variables{1});
        thief.dodge=thief.dodge+1;
        thief.hmax=thief.hmax+2;
        thief.health=thief.health+2;
        thief.level=thief.level+1;
        save('thiefStats','thief');
        close(LevelUp);
end

% --- Executes on button press in accButton.
function accButton_Callback(hObject, eventdata, handles)
% hObject    handle to accButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Figure out how to 
pCharacter=2;
switch pCharacter
    case 1
        knight=load('knightStats');
        variables=fields(knight);
        knight=knight.(variables{1});
        knight.accuracy=knight.accuracy+1;
        knight.hmax=knight.hmax+2;
        knight.health=knight.health+2;
        knight.attack1a=weaponAccuracies(knight.accuracy,knight.accmod1);
        knight.attack2a=weaponAccuracies(knight.accuracy,knight.accmod2);
        knight.attack3a=weaponAccuracies(knight.accuracy,knight.accmod3);
        save('knightStats','knight');
        close(LevelUp);
    case 2
        sorcerer=load('sorcererStats');
        variables=fields(sorcerer);
        sorcerer=sorcerer.(variables{1});
        sorcerer.accuracy=sorcerer.accuracy+1;
        sorcerer.hmax=sorcerer.hmax+2;
        sorcerer.health=sorcerer.health+2;
        sorcerer.attack1a=weaponAccuracies(sorcerer.accuracy,sorcerer.accmod1);
        sorcerer.attack2a=weaponAccuracies(sorcerer.accuracy,sorcerer.accmod2);
        sorcerer.attack3a=weaponAccuracies(sorcerer.accuracy,sorcerer.accmod3);
        save('sorcererStats','sorcerer');
        close(LevelUp);
    case 3
        thief=load('thiefStats');
        variables=fields(thief);
        thief=thief.(variables{1});
        thief.accuracy=thief.accuracy+1;
        thief.hmax=thief.hmax+2;
        thief.health=thief.health+2;
        thief.attack1a=weaponAccuracies(thief.accuracy,thief.accmod1);
        thief.attack2a=weaponAccuracies(thief.accuracy,thief.accmod2);
        thief.attack3a=weaponAccuracies(thief.accuracy,thief.accmod3);
        save('thiefStats','thief');
        close(LevelUp);
end


% --- Executes on button press in armButton.
function armButton_Callback(hObject, eventdata, handles)
% hObject    handle to armButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pCharacter=2;
switch pCharacter
    case 1
        knight=load('knightStats');
        variables=fields(knight);
        knight=knight.(variables{1});
        knight.armor=knight.armor-0.05;
        knight.hmax=knight.hmax+2;
        knight.health=knight.health+2;
        knight.level=knight.level+1;
        save('knightStats','knight');
        close(LevelUp);
    case 2
        sorcerer=load('sorcererStats');
        variables=fields(sorcerer);
        sorcerer=sorcerer.(variables{1});
        sorcerer.armor=sorcerer.armor-0.05;
        sorcerer.hmax=sorcerer.hmax+2;
        sorcerer.health=sorcerer.health+2;
        sorcerer.level=sorcerer.level+1;
        save('sorcererStats','sorcerer');
        close(LevelUp);
    case 3
        thief=load('thiefStats');
        variables=fields(thief);
        thief=thief.(variables{1});
        thief.armor=thief.armor-0.05;
        thief.hmax=thief.hmax+2;
        thief.health=thief.health+2;
        thief.level=thief.level+1;
        save('thiefStats','thief');
        close(LevelUp);
end