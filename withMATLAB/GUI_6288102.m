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

% Last Modified by GUIDE v2.5 11-Sep-2022 22:46:33

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
if isequal(filename,0)
    disp('User is cancel');
else
    image=strcat(pathname,filename);
    pic=imread(image);
    axes(handles.axes1); imshow(pic);
    set (handles.edit1, 'string',filename);
end
    
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
bw_area = bwarea(bw2)/10;
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

sb = edge(im2bw(pic), 'sobel', 0.05);
sb_area = bwarea(sb);
axes(handles.axes2); imshow(sb);
set(handles.edit2, 'string', num2str(sb_area));


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

cn = edge(im2bw(pic), 'canny', 0.05);
cn_area = bwarea(cn);
axes(handles.axes2); imshow(cn);
set(handles.edit2, 'string', num2str(cn_area));

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global excel;

excel = '/Users/punny/Documents/GitHub/Digital Image Processing/GUI_6288102.xlsx';

table = xlsread(excel);
[rr,cc]=size(table);

global pic;
global pathname;

gray = rgb2gray(pic);
data(1) = mean(mean(gray));
data(2) = mean(mean(pic(:,:,1)));
data(3) = mean(mean(pic(:,:,2)));
data(4) = mean(mean(pic(:,:,3)));
bw = im2bw(gray, 0.5);
bw2 =~ im2bw(gray);
data(5) = bwarea(bw2)/10;
SobelEdge=edge(im2bw(pic),'sobel',0.05); 
data(6)=bwarea(SobelEdge);
CannyEdge=edge(im2bw(pic),'canny',0.05); 
data(7)=bwarea(CannyEdge);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
data(8)=S.Energy*100;
data(9)=S.Contrast*100;
data(10)=S.Correlation*100;
data(11)=S.Homogeneity*100;
rngfil=rangefilt(pic);  
data(12)=entropy(rngfil)*100;

min = 999;
rec = 0;
for i = 1 : rr
    diff = 0;
    for j = 1 : cc
%         disp(table(i,j)); disp(data(j));
        diff = diff+sqrt((table(i,j)-data(j)) * (table(i,j)-data(j)));
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
    [~,ff]=xlsread(excel,1,cellx);
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
    


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global excel;
global pic;
global filename;

excel = '/Users/punny/Documents/GitHub/Digital Image Processing/GUI_6288102.xlsx';

table = xlsread(excel);
[rr,cc]=size(table);


gray = rgb2gray(pic);
data(1) = mean(mean(gray));
data(2) = mean(mean(pic(:,:,1)));
data(3) = mean(mean(pic(:,:,2)));
data(4) = mean(mean(pic(:,:,3)));
bw = im2bw(gray, 0.5);
bw2 =~ im2bw(gray);
data(5) = bwarea(bw2)/10;
SobelEdge=edge(im2bw(pic),'sobel',0.05); 
data(6)=bwarea(SobelEdge);
CannyEdge=edge(im2bw(pic),'canny',0.05); 
data(7)=bwarea(CannyEdge);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
data(8)=S.Energy*100;
data(9)=S.Contrast*100;
data(10)=S.Correlation*100;
data(11)=S.Homogeneity*100;
rngfil=rangefilt(pic);  
data(12)=entropy(rngfil)*100;
 
cell1=cat(2,'A',num2str(rr+3));
cell2=cat(2,'B',num2str(rr+3));
cell3=cat(2,'C',num2str(rr+3));
cell4=cat(2,'D',num2str(rr+3));
cell5=cat(2,'E',num2str(rr+3));
cell6=cat(2,'F',num2str(rr+3));
cell7=cat(2,'G',num2str(rr+3));
cell8=cat(2,'H',num2str(rr+3));
cell9=cat(2,'I',num2str(rr+3));
cell10=cat(2,'J',num2str(rr+3));
cell11=cat(2,'K',num2str(rr+3));
cell12=cat(2,'L',num2str(rr+3));
cell13=cat(2,'M',num2str(rr+3));


writecell({filename}, excel, 'Sheet', 1, 'Range', cell1);
writematrix(data(1), excel, 'Sheet', 1, 'Range', cell2);
writematrix(data(2), excel, 'Sheet', 1, 'Range', cell3);
writematrix(data(3), excel, 'Sheet', 1, 'Range', cell4);
writematrix(data(4), excel, 'Sheet', 1, 'Range', cell5);
writematrix(data(5), excel, 'Sheet', 1, 'Range', cell6);
writematrix(data(6), excel, 'Sheet', 1, 'Range', cell7);
writematrix(data(7), excel, 'Sheet', 1, 'Range', cell8);
writematrix(data(8), excel, 'Sheet', 1, 'Range', cell9);
writematrix(data(9), excel, 'Sheet', 1, 'Range', cell10);
writematrix(data(10), excel, 'Sheet', 1, 'Range', cell11);
writematrix(data(11), excel, 'Sheet', 1, 'Range', cell12);
writematrix(data(12), excel, 'Sheet', 1, 'Range', cell13);

disp(filename);
disp('Train data finished');


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes2); cla; imshow (gray);
energy=S.Energy*1000;
set (handles.edit2, 'string',num2str(energy));


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes2); cla; imshow (gray);
cont=S.Contrast*100;
set (handles.edit2, 'string',num2str(cont));

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes2); cla; imshow (gray);
corr=S.Correlation*100;
set (handles.edit2, 'string',num2str(corr));

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

rngfil=rangefilt(pic);  
entro=entropy(rngfil)*100; 
axes(handles.axes2); cla; imshow (rngfil);
set (handles.edit2, 'string',num2str(entro));

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;

gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes2); cla; imshow (gray);
homo=S.Homogeneity*100;
set (handles.edit2, 'string',num2str(homo));
