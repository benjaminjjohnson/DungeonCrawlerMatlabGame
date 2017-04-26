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

% Last Modified by GUIDE v2.5 25-Apr-2017 21:11:11

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
pCharacter=1;
eCharacter=7;
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
pHS=num2str(handles.pHealthSlider.Value);
handles.pHealthBox.String=pHS;

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
eHS=num2str(handles.eHealthSlider.Value);
handles.eHealthBox.String=eHS;

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
pCharacter=1;
eCharacter=7;
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
pHB=str2double(handles.pHealthBox.String);
handles.pHealthSlider.Value=pHB;

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
eHB=str2double(handles.eHealthBox.String);
handles.eHealthSlider.Value=eHB;

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