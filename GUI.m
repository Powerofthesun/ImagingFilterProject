function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 07-Nov-2016 16:19:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
handles.mainImage=imread('default.jpg');
imshow(handles.mainImage);
guidata(hObject,handles);
% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ReadImageName_Callback(hObject, eventdata, handles)
% hObject    handle to ReadImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ReadImageName as text
%        str2double(get(hObject,'String')) returns contents of ReadImageName as a double
try
    handles.mainImage=imread(get(hObject,'String'));
    imshow(handles.mainImage);
    guidata(hObject,handles);
catch ME
    ME
    imshow(imread('notthere.jpg'));
end


% --- Executes during object creation, after setting all properties.
function ReadImageName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ReadImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ReadImage.
function ReadImage_Callback(hObject, eventdata, handles)
% hObject    handle to ReadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in Filters.
function Filters_Callback(hObject, eventdata, handles)
% hObject    handle to Filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Filters contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Filters
contents=cellstr(get(hObject,'String'));
switch contents{get(hObject,'Value')}
    case 'BadCamera'
        prompt = {'Enter bad level(0-1):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'0.25'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(BadCamera(handles.mainImage,str2double(answer(1))));
    case 'BadCamera2'
        prompt = {'Enter bad level(0-1):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'0.25'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(BadCamera2(handles.mainImage,str2double(answer(1))));
    case 'Default'
        imshow(handles.mainImage);
    case 'BinaryFilter'
        prompt = {'Enter threshold level(0-1):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'0.5'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(BinaryFilter(handles.mainImage,str2double(answer(1))));
    case 'BlackBorder'
        prompt = {'Enter Border Thickness (1+):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'10'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(BlackBorder(handles.mainImage,str2double(answer(1))));
    case 'BrightBWGradient'
        imshow(BrightBWGradient(handles.mainImage));
    case 'BrushStrokes'
        imshow(BrushStrokes(handles.mainImage));
    case 'BWHighContrast'
        imshow(BWHighContrast(handles.mainImage));
    case 'CenterTriangle'
        prompt = {'Color(1 For Black, 0 for White):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'1'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(CenterTriangle(handles.mainImage,str2double(answer(1))));
    case 'Circles'
        prompt = {'Enter Radius Size(small values will take a long time):','Color(0 For Black, 1 for White):'};
        dlg_title = 'Specifics';
        num_lines = 2;
        defaultans = {'10','0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(Circles(handles.mainImage,str2double(answer(1)),str2double(answer(2))));
    case 'EdgeGradient'
        imshow(EdgeGradient(handles.mainImage));
    case 'PointilismFilter'
        imshow(PointilismFilter(handles.mainImage));
    case 'Sepia'
        imshow(sepia(handles.mainImage));
    case 'SepiaGradient'
        imshow(SepiaGradient(handles.mainImage));
    case 'Lego'
        prompt = {'Brick Size(1-10):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'6'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(Sequin(handles.mainImage,str2double(answer(1))));
    case 'Torn'
        prompt = {'Color(0 for Black, 1 for White):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(Torn(handles.mainImage,str2double(answer(1))));
    case 'Vintage'
        imshow(Vintage(handles.mainImage));
    case 'WhiteBorder'
        prompt = {'Enter Border Thickness (1+):'};
        dlg_title = 'Specifics';
        num_lines = 1;
        defaultans = {'10'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        imshow(WhiteBorder(handles.mainImage,str2double(answer(1))));
    otherwise
end


% --- Executes during object creation, after setting all properties.
function Filters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
