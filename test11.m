function varargout = test11(varargin)
% TEST11 MATLAB code for test11.fig
%      TEST11, by itself, creates a new TEST11 or raises the existing
%      singleton*.
%
%      H = TEST11 returns the handle to a new TEST11 or the handle to
%      the existing singleton*.
%
%      TEST11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST11.M with the given input arguments.
%
%      TEST11('Property','Value',...) creates a new TEST11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help test11
% Last Modified by GUIDE v2.5 16-Nov-2017 16:29:05
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
'gui_Singleton',  gui_Singleton, ...
'gui_OpeningFcn', @test11_OpeningFcn, ...
'gui_OutputFcn',  @test11_OutputFcn, ...
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
% --- Executes just before test11 is made visible.
function test11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test11 (see VARARGIN)
% Choose default command line output for test11
handles.output = hObject; 
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes test11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = test11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in pushbutton1. ................. Get
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global excel;
excel = '/Users/punny/Desktop/Digital Image Processing/GUI_6288102.xlsx';
[filename pathname]=uigetfile({'*.jpg'},'file select');
image=strcat(pathname,filename);
pic=imread(image);
axes(handles.axes3); imshow(pic);
axes(handles.axes4); cla;
set (handles.edit1, 'string',filename);
% --- Executes on button press in pushbutton2. .................. Clear
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3); cla;
axes(handles.axes4); cla;
set (handles.edit1, 'string','                         ');
set (handles.edit2, 'string','                         ');
% --- Executes on button press in pushbutton3. .............. Red
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
red=pic;
red(:,:,2)=0;
red(:,:,3)=0;
axes(handles.axes4); imshow(red);
mred=mean(mean(red(:,:,1)));
set (handles.edit2, 'string', num2str(mred));
% --- Executes on button press in pushbutton4. ............... Green
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
green=pic;
green(:,:,1)=0;
green(:,:,3)=0;
axes(handles.axes4); imshow(green);
mgreen=mean(mean(green(:,:,2)));
set (handles.edit2, 'string', num2str(mgreen));
% --- Executes on button press in pushbutton5. ................. Blue
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
blue=pic;
blue(:,:,1)=0;
blue(:,:,2)=0;
axes(handles.axes4); imshow(blue);
mblue=mean(mean(blue(:,:,3)));
set (handles.edit2, 'string', num2str(mblue));
% --- Executes on button press in pushbutton6. ................  Gray
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
gray=rgb2gray(pic);
axes(handles.axes4); imshow(gray);
mgray=mean(mean(gray));
set (handles.edit2, 'string', num2str(mgray));
% --- Executes on button press in pushbutton7. ......... black & white
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
gray=rgb2gray(pic);
bw=im2bw(gray,0.5);
bw2=~im2bw(gray); 
bw_area=bwarea(bw2)/10;
axes(handles.axes4); imshow(bw);
set (handles.edit2, 'string', num2str(bw_area));
% --- Executes on button press in pushbutton8. ................ Sobel
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
SobelEdge=edge(im2bw(pic),'sobel', 0.05); 
axes(handles.axes4);imshow (SobelEdge); 
Sobel_area=bwarea(SobelEdge)/10;
set (handles.edit2, 'string',num2str(Sobel_area));
% --- Executes on button press in pushbutton9. ............ Canny
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic
CannyEdge=edge(im2bw(pic),'canny', 0.05); 
axes(handles.axes4);imshow (CannyEdge); 
Canny_area=bwarea(CannyEdge)/10;
set (handles.edit2, 'string',num2str(Canny_area));
% --- Executes on button press in pushbutton10. ............... entropy
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
rngfil=rangefilt(pic);  
entro=entropy(rngfil)*100; 
axes(handles.axes4); cla; imshow (rngfil);
set (handles.edit2, 'string',num2str(entro));
% --- Executes on button press in pushbutton11. .... Recognize Euclidean 
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global excel;
tab=xlsread('/Users/punny/Desktop/Digital Image Processing/GUI_6288102.xlsx');
[rr,cc]=size(tab)
% ............................ Calculate Features
data(12)=0;
gray=rgb2gray(pic);
data(1)=mean(mean(gray));
data(2)=mean(mean(pic(:,:,1)));
data(3)=mean(mean(pic(:,:,2)));
data(4)=mean(mean(pic(:,:,3)));
bw=im2bw(gray,0.5);
bw2=~im2bw(gray); 
data(5)=bwarea(bw2)/100;
% rngfil=rangefilt(pic);  
% data(6)=entropy(rngfil)*100; 
% glcm=graycomatrix(gray,'O', [0,1]);
% S=graycoprops(glcm);
% data(7)=S.Energy*100;
% data(8)=S.Contrast*100;
% data(9)=S.Correlation*100;
% data(10)=S.Homogeneity*100;
SobelEdge=edge(im2bw(pic),'sobel', 0.05); 
data(6)=bwarea(SobelEdge)/10;
CannyEdge=edge(im2bw(pic),'canny', 0.05); 
data(7)=bwarea(CannyEdge)/10;
% ............................ Matching 
min=999;
rec=0;
for i = 1 : rr
diff=0;    
for j=1 : cc
diff=diff+sqrt((tab(i,j)-data(j)) * (tab(i,j)-data(j))); 
end
if (diff <= 0 ) 
min=diff;
rec=i;
end
end
if (rec ~= 0)
cellx=cat(2,'A',num2str(rec+2));
[~,ff]=xlsread(excel,1,cellx);
file=ff{1};
result=imread(file);
axes(handles.axes4); imshow(result);
set (handles.edit2, 'string',file);
else
fig=zeros(250,300);
axes(handles.axes4); imshow(fig);
set (handles.edit2, 'string','*** image Not Found ***');
end
% --- Executes on button press in pushbutton12. ............... train
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global excel; 
tab=xlsread(excel);
[rr,cc]=size(tab);
% ............................ Calculate Features
mred=mean(mean(pic(:,:,1)));
mgreen=mean(mean(pic(:,:,2)));
mblue=mean(mean(pic(:,:,3)));
gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
homo=S.Homogeneity*100;
cont=S.Contrast*100;
energy=S.Energy*100;
corr=S.Correlation*100;
mgray=mean(mean(gray));
bw=im2bw(gray,0.5);
bw2=~im2bw(gray); 
bw_area=bwarea(bw2)/100;
SobelEdge=edge(im2bw(pic),'sobel', 0.05); 
Sobel_area=bwarea(SobelEdge)/10;
CannyEdge=edge(im2bw(pic),'canny', 0.05); 
Canny_area=bwarea(CannyEdge)/10;
rngfil=rangefilt(pic);  
entro=entropy(rngfil)*100; 
% ............................... calculate Excel Cell
cell1=cat(2,'A',num2str(rr+1));
cell2=cat(2,'B',num2str(rr+1));
cell3=cat(2,'C',num2str(rr+1));
cell4=cat(2,'D',num2str(rr+1));
cell5=cat(2,'E',num2str(rr+1));
cell6=cat(2,'F',num2str(rr+1));
cell7=cat(2,'G',num2str(rr+1));
cell8=cat(2,'H',num2str(rr+1));
cell9=cat(2,'I',num2str(rr+1));
cell10=cat(2,'J',num2str(rr+1));
cell11=cat(2,'K',num2str(rr+1));
cell12=cat(2,'L',num2str(rr+1));
cell13=cat(2,'M',num2str(rr+1));
% .................................. Write Excel Data
xlswrite(excel,[{filename}],1,cell1);
xlswrite(excel,[mred],1,cell2);
xlswrite(excel,[mgreen],1,cell3);
xlswrite(excel,[mblue],1,cell4);
xlswrite(excel,[mgray],1,cell5);
xlswrite(excel,[bw_area],1,cell6);
xlswrite(excel,[entro],1,cell7);
xlswrite(excel,[energy],1,cell8);
xlswrite(excel,[cont],1,cell9);
xlswrite(excel,[corr],1,cell10);
xlswrite(excel,[homo],1,cell11);
xlswrite(excel,[Sobel_area],1,cell12);
xlswrite(excel,[Canny_area],1,cell13);
system('taskkill /F /IM EXCEL.EXE');
% --- Executes on button press in pushbutton13......... neural network
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global excel;

% ............................ Calculate Features
data(12)=0;
data(1)=mean(mean(pic(:,:,1)));
data(2)=mean(mean(pic(:,:,2)));
data(3)=mean(mean(pic(:,:,3)));
gray=rgb2gray(pic);
data(4)=mean(mean(gray));
bw=im2bw(gray,0.5);
bw2=~im2bw(gray); 
data(5)=bwarea(bw2)/100;
rngfil=rangefilt(pic);  
data(6)=entropy(rngfil)*100; 
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
data(7)=S.Energy*100;
data(8)=S.Contrast*100;
data(9)=S.Correlation*100;
data(10)=S.Homogeneity*100;
SobelEdge=edge(im2bw(pic),'sobel', 0.05); 
data(11)=bwarea(SobelEdge)/10;
CannyEdge=edge(im2bw(pic),'canny', 0.05); 
data(12)=bwarea(CannyEdge)/10;
% ............................ Matching 
in=xlsread(excel,'training');
output=xlsread(excel,'target');

input=in'
size(input)
size(output)

net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);
net.trainParam.epochs = 100;
net.trainParam.goal = 1e-10;
% net.performFcn = 'sse';  % Mean squared error
[net1,tr] = train(net,input,output);
test=[data(1);data(2);data(3);data(4);data(5);data(6);
      data(7);data(8);data(9);data(10);data(11);data(12)];
ans=sim(net1,test);
[rr,cc]=size(ans)

MAX=0;
rec=1;
for i=1:rr
if MAX<= ans(i,cc);
MAX=ans(i,cc);
rec=i;
end
end
rec+1

cellx=cat(2,'A',num2str(rec+1));
[~,ff]=xlsread(excel,1,cellx);
file=cat(2,'h:\itcs-476\',ff{1});
%file=ff{1};
result=imread(file);
axes(handles.axes4); imshow(result);
set (handles.edit2, 'string',file);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
% --- Executes on button press in pushbutton15.  .............. Exit
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
exit
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
% --- Executes on button press in pushbutton16......... correlation
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes4); cla; imshow (gray);
corr=S.Correlation*100;
set (handles.edit2, 'string',num2str(corr));
% --- Executes on button press in pushbutton17. ............. energy
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes4); cla; imshow (gray);
energy=S.Energy*1000;
set (handles.edit2, 'string',num2str(energy));
% --- Executes on button press in pushbutton18. ........contrast
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes4); cla; imshow (gray);
cont=S.Contrast*100;
set (handles.edit2, 'string',num2str(cont));
% --- Executes on button press in pushbutton19. ........... Homogineity
function pushbutton19_Callback(~, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray=rgb2gray(pic);
glcm=graycomatrix(gray,'O', [0,1]);
S=graycoprops(glcm);
axes(handles.axes4); cla; imshow (gray);
homo=S.Homogeneity*100;
set (handles.edit2, 'string',num2str(homo));
% --- Executes on button press in pushbutton20.  ............ histogram
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
gray=rgb2gray(pic);
%bw=im2bw(gray);
%bw2=~im2bw(gray); 
%Histo_area=bwarea(bw2)/100;
axes(handles.axes4); cla; imhist(gray)
set (handles.edit2, 'string', 'histogram');
