function varargout = r2vGUI(varargin)
% R2VGUI MATLAB code for r2vGUI.fig
%      R2VGUI, by itself, creates a new R2VGUI or raises the existing
%      singleton*.
%
%      H = R2VGUI returns the handle to a new R2VGUI or the handle to
%      the existing singleton*.
%
%      R2VGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in R2VGUI.M with the given input arguments.
%
%      R2VGUI('Property','Value',...) creates a new R2VGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before r2vGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to r2vGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help r2vGUI

% Last Modified by GUIDE v2.5 22-Jul-2011 09:59:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @r2vGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @r2vGUI_OutputFcn, ...
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


% --- Executes just before r2vGUI is made visible.
function r2vGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to r2vGUI (see VARARGIN)

% Choose default command line output for r2vGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes r2vGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global mImage;
global mInfo;

% --- Outputs from this function are returned to the command line.
function varargout = r2vGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in polybutton.
% hObject    handle to polybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function polybutton_Callback( hObject, eventdata, handles )
global mImage;
ToPolys( mImage, 4, 100 );

% --- Executes on button press in lineButton.
% hObject    handle to lineButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function lineButton_Callback( hObject, eventdata, handles )

% --- Executes on button press in curveButton.
% hObject    handle to curveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function curveButton_Callback( hObject, eventdata, handles )

% --------------------------------------------------------------------
% hObject    handle to fileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function fileMenu_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function open_Callback( hObject, eventdata, handles )
global mImage;
global mInfo;
[name, path] = uigetfile( { '*.bmp; *.png'; '*.*' }, 'Open Image' );
pathAndName = strcat( path, name );
if( ( length( name ) ~= 1 ) & ( length( path ) ~= 1 ) );
    mInfo = imfinfo( pathAndName );
    mImage = imread( pathAndName );
    imshow( mImage, 'Parent', handles.axes1 );
    % Console Output   
    msg = strcat( 'Open Image: ', pathAndName );
    msg = strcat( msg, ' height = ' );
    msg = strcat( msg, num2str( mInfo.Height ) );
    msg = strcat( msg, ' width = ' );
    msg = strcat( msg, num2str( mInfo.Width ) );
    set( handles.console, 'String', msg );
end;