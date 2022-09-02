function varargout = GUI_6288102(varargin)
% GUI_6288102 MATLAB code for GUI_6288102.fig
%      GUI_6288102, by itself, creates a new GUI_6288102 or raises the existing
%      singleton*.
%
%      H = GUI_6288102 returns the handle to a new GUI_6288102 or the handle to
%      the existing singleton*.
%
%      GUI_6288102('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_6288102.M with the given input arguments.
%
%      GUI_6288102('Property','Value',...) creates a new GUI_6288102 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_6288102_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_6288102_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_6288102

% Last Modified by GUIDE v2.5 29-Aug-2022 09:43:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_6288102_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_6288102_OutputFcn, ...
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


% --- Executes just before GUI_6288102 is made visible.
function GUI_6288102_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_6288102 (see VARARGIN)

% Choose default command line output for GUI_6288102
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_6288102 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_6288102_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global pathname;
[filename, pathname]=uigetfile({'*.jpg'},'file select');
image=strcat(pathname,filename);
pic=imread(image);
axes(handles.axes1); imshow(pic);
set (handles.edit1, 'string',filename);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray = rgb2gray(pic);
axes(handles.axes2); imshow(gray);
mgray = mean(mean(gray));
set(handles.edit2, 'string', num2str(mgray));


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

red = pic;
red(:,:,2) = 0; red(:,:,3) = 0;
axes(handles.axes2); imshow(red);
mred = mean(mean(red));
set(handles.edit2, 'string', num2str(mred));


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

green = pic;
green(:,:,1) = 0; green(:,:,3) = 0;
axes(handles.axes2); imshow(green);
mgreen = mean(mean(green));
set(handles.edit2, 'string', num2str(mgreen));


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

blue = pic;
blue(:,:,1) = 0; blue(:,:,2) = 0;
axes(handles.axes2); imshow(blue);
mblue = mean(mean(blue));
set(handles.edit2, 'string', num2str(mblue));



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray = rgb2gray(pic);
bw = im2bw(gray, 0.5);
bw2 =~ im2bw(gray);
bw_area = bwarea(bw);
axes(handles.axes2); imshow(bw);
set(handles.edit2, 'string', num2str(bw_area));

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1); cla reset;
axes(handles.axes2); cla reset;
set(handles.edit1, 'string', '                  ');
set(handles.edit2, 'string', '                  ');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray = rgb2gray(pic);
sb = edge(gray, 'Sobel');
sb_area = bwarea(sb);
axes(handles.axes2); imshow(sb);
set(handles.edit2, 'string', num2str(sb_area));


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray = rgb2gray(pic);
cn = edge(gray, 'Canny');
cn_area = bwarea(cn);
axes(handles.axes2); imshow(cn);
set(handles.edit2, 'string', num2str(cn_area));

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


table = xlsread('/Users/punny/Desktop/Digital Image Processing/GUI_6288102.xlsx');
[rr,cc]=size(table);

global pic;
global pathname;

gray = rgb2gray(pic);
data(1) = mean(mean(gray));
data(2) = mean(mean(pic(:,:,1)));
data(3) = mean(mean(pic(:,:,2)));
data(4) = mean(mean(pic(:,:,3)));
bw = im2bw(gray, 0.5);
data(5) = bwarea(bw);
SobelEdge=edge(gray,'sobel'); 
data(6)=bwarea(SobelEdge);
CannyEdge=edge(gray,'canny'); 
data(7)=bwarea(CannyEdge);

min = 999;
rec = 0;
for i = 1 : rr
    diff = 0;
    for j = 1 : cc
%         disp(table(i,j)); disp(data(j));
        diff = diff+sqrt((round(table(i,j),2)-round(data(j),2)) * (round(table(i,j),2)-round(data(j),2)));
    end
    if (diff <= 0)
        min = diff;
        rec = i;
    end
end
disp(rec);

% disp(rec);

if(rec ~= 0)
    cellx = cat(2, 'A', num2str(rec+2));
    [~,ff]=xlsread('/Users/punny/Desktop/Digital Image Processing/GUI_6288102.xlsx',1,cellx);
    file=ff{1};
    disp(file);
    fullfile = strcat(pathname, file);
    disp(fullfile);
    result=imread(fullfile);
    axes(handles.axes2); imshow(result);
    set (handles.edit2, 'string',file);
else
    fig=zeros(250,300);
    axes(handles.axes2); imshow(fig);
    set (handles.edit2, 'string','*** image Not Found ***');
end
    




