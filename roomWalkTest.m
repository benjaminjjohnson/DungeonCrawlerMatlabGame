

function varargout = roomWalkTest(varargin)
% ROOMWALKTEST MATLAB code for roomWalkTest.fig
%      ROOMWALKTEST, by itself, creates a new ROOMWALKTEST or raises the existing
%      singleton*.
%
%      H = ROOMWALKTEST returns the handle to a new ROOMWALKTEST or the handle to
%      the existing singleton*.
%
%      ROOMWALKTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROOMWALKTEST.M with the given input arguments.
%
%      ROOMWALKTEST('Property','Value',...) creates a new ROOMWALKTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before roomWalkTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All  are passed to roomWalkTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help roomWalkTest

% Last Modified by GUIDE v2.5 02-Apr-2017 16:54:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @roomWalkTest_OpeningFcn, ...
                   'gui_OutputFcn',  @roomWalkTest_OutputFcn, ...
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

% --- Executes just before roomWalkTest is made visible.
function roomWalkTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to roomWalkTest (see VARARGIN)

% Choose default command line output for roomWalkTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes roomWalkTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = roomWalkTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key,'uparrow')
    handles.first.String = num2str(str2double(handles.first.String) + 1);
elseif strcmp(eventdata.Key,'downarrow')
    handles.first.String = num2str(str2double(handles.first.String) - 1);
elseif strcmp(eventdata.Key,'leftarrow')
    handles.Second.String = num2str(str2double(handles.Second.String) + 1);
elseif strcmp(eventdata.Key,'rightarrow')
    handles.Second.String = num2str(str2double(handles.Second.String) - 1);
end
drawLink(handles,[str2double(handles.first.String) str2double(handles.Second.String) 73 50])
