function varargout = BSGUI(varargin)
% BSGUI MATLAB code for BSGUI.fig
%      BSGUI, by itself, creates a new BSGUI or raises the existing
%      singleton*.
%
%      H = BSGUI returns the handle to a new BSGUI or the handle to
%      the existing singleton*.
%
%      BSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BSGUI.M with the given input arguments.
%
%      BSGUI('Property','Value',...) creates a new BSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BSGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BSGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BSGUI

% Last Modified by GUIDE v2.5 26-Apr-2017 14:09:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BSGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BSGUI_OutputFcn, ...
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


% --- Executes just before BSGUI is made visible.
function BSGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BSGUI (see VARARGIN)

% Choose default command line output for BSGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BSGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%TIMER
handles.timer=timer(...
    'ExecutionMode','fixedRate',...
    'Period',0.6,...
    'Timerfcn',{@update_display,hObject});

% ~~~~~~~~~~~~~~~~~~

% START TIMER
start(handles.timer);

%Chooses Characters
pCharacter=2;
eCharacter=4;
BattleStatsF(pCharacter,eCharacter,handles);

% --- Outputs from this function are returned to the command line.
function varargout = BSGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function pHealthSlider_Callback(hObject, eventdata, handles)
% hObject    handle to pHealthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.pHealthSlider.Value=handles.pHealthSlider.UserData;

% --- Executes during object creation, after setting all properties.
function pHealthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pHealthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function eHealthSlider_Callback(hObject, eventdata, handles)
% hObject    handle to eHealthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.eHealthSlider.Value=handles.eHealthSlider.UserData;

% --- Executes during object creation, after setting all properties.
function eHealthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eHealthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on selection change in attackList.
function attackList_Callback(hObject, eventdata, handles)
% hObject    handle to attackList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns attackList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from attackList

%Choosing Characters
pCharacter=2;
eCharacter=4;
combatF(pCharacter,eCharacter,handles);

% --- Executes during object creation, after setting all properties.
function attackList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to attackList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pHealthBox_Callback(hObject, eventdata, handles)
% hObject    handle to pHealthBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pHealthBox as text
%        str2double(get(hObject,'String')) returns contents of pHealthBox as a double
handles.pHealthBox.String=num2str(handles.pHealthSlider.UserData);

% --- Executes during object creation, after setting all properties.
function pHealthBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pHealthBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eHealthBox_Callback(hObject, eventdata, handles)
% hObject    handle to eHealthBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eHealthBox as text
%        str2double(get(hObject,'String')) returns contents of eHealthBox as a double
handles.eHealthBox.String=num2str(handles.eHealthSlider.UserData);

% --- Executes during object creation, after setting all properties.
function eHealthBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eHealthBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pName_Callback(hObject, eventdata, handles)
% hObject    handle to pName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pName as text
%        str2double(get(hObject,'String')) returns contents of pName as a double


% --- Executes during object creation, after setting all properties.
function pName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eName_Callback(hObject, eventdata, handles)
% hObject    handle to eName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eName as text
%        str2double(get(hObject,'String')) returns contents of eName as a double


% --- Executes during object creation, after setting all properties.
function eName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function announceTBox_Callback(hObject, eventdata, handles)
% hObject    handle to announceTBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of announceTBox as text
%        str2double(get(hObject,'String')) returns contents of announceTBox as a double


% --- Executes during object creation, after setting all properties.
function announceTBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to announceTBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on attackList and none of its controls.
function attackList_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to attackList (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

function update_display(hObject,eventdata,hfigure)

pCharacter=2;
eCharacter=4;
[player,enemy]=whichClass(pCharacter,eCharacter);

handles=guidata(hfigure);
%image1=get(handles.pPic,'Children');
%image2=get(handles.ePic,'Children');

if handles.currentFrameBool.Value
    image1=imshow(imread(player.portrait1),'InitialMagnification','fit','Parent',handles.pPic);
    image2=imshow(imread(enemy.portrait1),'InitialMagnification','fit','Parent',handles.ePic);
else
    image1=imshow(imread(player.portrait2),'InitialMagnification','fit','Parent',handles.pPic);
    image2=imshow(imread(enemy.portrait2),'InitialMagnification','fit','Parent',handles.ePic);
end;

handles.currentFrameBool.Value=~handles.currentFrameBool.Value;


function figure1_CloseRequestFcn(hObject,eventdata,handles)

delete(handles.timer);
delete(hObject);
delete(timerfind);


%% NOTES

% Date: 4/25/2017 after midnight

% Code that was added was added to prevent changing health stats on
% player/enemy.
% Player and enemy health is now stored in the ListboxTop of their sliders.

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Lines of code added to opening functions above and callbacks. 
% Last bits:
%   : Two lines added to BattleStatsF to ensure correct stats on
% slider and ListboxTop during setup. (in first couple lines)
%   : lines added to combatF to update both enemy and player health by
%   changing ListboxTop amount in addition to already changing slider value
%  (lines 69,90,121)


%% NOTES

% Date: 4/26/2017    2:14 pm

% Trying to add visible stats on screen and on attackList.
% Going to add code to BattleStatsF at "Set List of Attacks" so that the
% string cell array added includes the modifiers of each weapon!

% ~ Matthew Phelps

% Okay. That's done. It now shows how much damage it can possibly deal and
% how accurate it is (via accuracy modifier).

% Now I want to have player stats displayed.