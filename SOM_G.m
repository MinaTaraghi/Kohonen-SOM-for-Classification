function varargout = SOM_G(varargin)
% SOM_G MATLAB code for SOM_G.fig
%      SOM_G, by itself, creates a new SOM_G or raises the existing
%      singleton*.
%
%      H = SOM_G returns the handle to a new SOM_G or the handle to
%      the existing singleton*.
%
%      SOM_G('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOM_G.M with the given input arguments.
%
%      SOM_G('Property','Value',...) creates a new SOM_G or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SOM_G_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SOM_G_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SOM_G

% Last Modified by GUIDE v2.5 30-Jan-2016 03:45:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SOM_G_OpeningFcn, ...
                   'gui_OutputFcn',  @SOM_G_OutputFcn, ...
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


% --- Executes just before SOM_G is made visible.
function SOM_G_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SOM_G (see VARARGIN)

% Choose default command line output for SOM_G
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SOM_G wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SOM_G_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in neighbouring.
function neighbouring_Callback(hObject, eventdata, handles)
% hObject    handle to neighbouring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns neighbouring contents as cell array
%        contents{get(hObject,'Value')} returns selected item from neighbouring
handles.neighbouring_=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function neighbouring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neighbouring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_epoch_no_Callback(hObject, eventdata, handles)
% hObject    handle to max_epoch_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_epoch_no as text
%        str2double(get(hObject,'String')) returns contents of max_epoch_no as a double
handles.max_epoch_no_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function max_epoch_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_epoch_no (see GCBO)
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



function load_name_Callback(hObject, eventdata, handles)
% hObject    handle to load_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of load_name as text
%        str2double(get(hObject,'String')) returns contents of load_name as a double
handles.load_name_=(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function load_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to load_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function train_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to train_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of train_ratio as text
%        str2double(get(hObject,'String')) returns contents of train_ratio as a double
handles.train_ratio_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function train_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_btn.
function save_btn_Callback(hObject, eventdata, handles)
% hObject    handle to save_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function save_name_Callback(hObject, eventdata, handles)
% hObject    handle to save_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of save_name as text
%        str2double(get(hObject,'String')) returns contents of save_name as a double


% --- Executes during object creation, after setting all properties.
function save_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to save_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_Callback(hObject, eventdata, handles)
% hObject    handle to eta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta as text
%        str2double(get(hObject,'String')) returns contents of eta as a double
handles.eta_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function eta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start_btn.
function Start_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Start_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Preparing Data
data=importdata('Shuffled_wine.data');
TotalNo=size(data,1);
ys=data(:,1);
xs_first=data(:,2:end);
xs=zeros(TotalNo,13);
for i=1:13
xs(:,i)=(1/(max(xs_first(:,i))-min(xs_first(:,i))))*(xs_first(:,i)-min(xs_first(:,i)));
end
try
    train_R=handles.train_ratio_;
catch e
    train_R=0.8;
end

trainNo=floor(TotalNo*train_R);
TestNo=TotalNo-trainNo;

train_x=xs(1:trainNo,1:13);
train_y=data(1:trainNo,1);

test_x=xs(trainNo+1:end,1:13);
test_y=data(1:trainNo+1,1);

try
    MaxEpochNo=handles.max_epoch_no_;
catch e
    MaxEpochNo=1000;
end

try
    MaxEpochNo_c=handles.max_epoch_no_2_;
catch e
    MaxEpochNo_c=50;
end

try
    distance=handles.distance_;
catch e
    distance=1;
end

try
    Neighbouring=handles.neighbouring_;
catch e
    Neighbouring=4;
end

% DeSieno Update Rule Parameters
try
    beta=handles.beta_;
catch e
    beta=0.0001;
end

try
    gamma=handles.gamma_;
catch e
    gamma=10;
end

% Learning Parameters
try
    eta=handles.eta_;
catch e
    eta0=0.1;
end
%eta1=0.01;

try
    T2=handles.t2_;
catch e
    T2=1000;
end


% T1=1000/log(sigma0);

% Setting the dimensionality
try
    k=handles.k_;
catch e
    k=2;
end

try
    n1=handles.d1_;
catch e
    n1=11;
end

try
    n2=handles.d2_;
catch e
    n2=11;
end

try
n3=handles.d3_;
catch e
    n3=3;
end

% Neighborhood Parameters
try
    sigma0=handles.sigma_;
catch e
    sigma0=n1;
end
T1=MaxEpochNo/log(sigma0);

try
    radius=handles.radius_;
catch e
    radius=10;
end


MaxEpochNo2=MaxEpochNo_c*n1;
if (k==2)
    MaxEpochNo2=MaxEpochNo2*n2;
elseif (k==3)
    MaxEpochNo2=MaxEpochNo2*n2*n3;
end
%% Initializing
if (k==1)
    Ws=zeros(n1,13);
    for i=1:n1
        Ws(i,:)=rand(1,13);
    end
else if(k==2)
        Ws=zeros(n1,n2,13);
        for i=1:n1
            for j=1:n2
                Ws(i,j,:)=rand(1,13);
            end
        end
    else
        Ws=zeros(n1,n2,n3,13);
        for i=1:n1
            for j=1:n2
                for m=1:n3
                    Ws(i,j,m,:)=rand(1,13);
                end
            end
        end
    end
end

%% Training
%% Ordering Phase

[Ws,WinMat,TheDead,clusters]=Ordering_Phase(trainNo,n1,n2,n3,MaxEpochNo,eta0,sigma0,radius,T1,T2,beta,gamma,Ws,train_x,k,distance,Neighbouring,handles);

%% Convergence Phase

Ws=Convergence_Phase(trainNo,n1,n2,n3,MaxEpochNo2,eta0,sigma0,1,beta,gamma,Ws,train_x,k,distance,Neighbouring,WinMat);

%% U-Matrix
if(k==1)
    UMat=UMatOneD(Ws,n1,distance);
else if(k==2)
       UMat= UMatTwoD(Ws,n1,n2,distance,Neighbouring);
    else
        %UMat=UMatThreeD(Ws,n1,n2,n3,test528,Neighbouring);
    end
end
axes(handles.LPlot);
colormap('hot');
        %         figure;
        imagesc(UMat);
        title(strcat('UMatrix- ',int2str(k),'-D'));
        drawnow;
        hold
        if(k==2)
            y=ones(n1,n2);
            x=1:2:2*n2-1;
        for i=1:n1
        y(i,:)=2*i-1;
        scatter(x,y(i,:),'s','filled');
        end
        else if(k==1)
                x=ones(1,n1);
                y=1:2:2*n1-1;
                scatter(x,y,'s','filled');
            end
        end
%% Plotting Hits        
        
figure
colormap('jet');
hold
imagesc(WinMat);
if(k==2)
for i=1:n1
    for j=1:n2
        text(j,i,int2str(WinMat(i,j)));
    end
end
else
    if(k==1)
        for j=1:n1
            text(1,j,int2str(WinMat(j)));
        end        
    end
end
colorbar
%% Clustering
if(k==1)
    
% centroids=findpeaks(UMat);
%numOfcluster = size(findpeaks(UMat),2)
        [v,l]=findpeaks(UMat);
        numOfcluster=size(l,2);
        distances=zeros(n1,numOfcluster);
        centroids=zeros(numOfcluster,13);
        if(size(l,1)~=0)
        for i= 1:numOfcluster
            centroids(i,:) = Ws(floor((l(i)+1)/2),:);
            %cluster(i)= find(v(i)== UMat)
        end
        else
            centroids(1,:)=Ws(1,:);
        %centroids = Ws(:,cluster);
        
        end 
        for j=1:  numOfcluster
            diffs = bsxfun(@minus, Ws, centroids(j,:));
            sqrdDiffs = diffs .^ 2;
            distances(:,j) = sum(sqrdDiffs, 2);
        end
        [minVals memberships] = min(distances, [], 2);
        for i = 1: numOfcluster
            d=find(memberships == i);
            newC (i,:) = mean(Ws(d,:),1);
        end
else if(k==2) %% 2-D Map
       
        hLocalMax = vision.LocalMaximaFinder;
        hLocalMax.MaximumNumLocalMaxima = 20;
        hLocalMax.NeighborhoodSize = [n1 n2];%[nei nei];
        hLocalMax.Threshold = 0.1;
        
        numOfcluster= size(step(hLocalMax, UMat),1);
        distances=zeros(n1,n2,numOfcluster);
        
        v=step(hLocalMax, UMat);
        for index= 1:numOfcluster
%             for j=1:numOfcluster
%                 centroids(:,i) = Ws(:,v(i),v(j));
%                 % cluster(i)=  UMap(v(i),v(j));
%             end
            i=floor((v(index,1)+1)/2);
            j=floor((v(index,2)+1)/2);
            centroids(index,:)=reshape(Ws(i,j,:),1,13);
        end
        
        
        
        for j=1:  numOfcluster
            diffs = bsxfun(@minus, Ws, reshape(centroids(j,:),1,1,13));
            sqrdDiffs = diffs .^ 2;
            distances(:,:, j) = sum(sqrdDiffs,3);
        end
        [minVals,memberships] = min(distances, [], 3);
        
              newC=zeros(numOfcluster,13);      
        for i = 1: numOfcluster
            d=find(memberships == i);
            for j=1:size(d,1)
                indexi=mod(d(j),n1);
                indexj=ceil(d(j)/n1);
                if(indexi==0)
                    indexi=n1;
                end
                newC (i,:) = newC(i,:)+reshape(Ws(indexi,indexj,:),1,13);
            end
            newC(i,:)=newC(i,:)/d(j);
            
        end
    end
end
%figure
axes(handles.RPlot);
plot(handles.RPlot,TheDead);
handles.RPlot.Title.String='Dead Nodes Number';


%%
% handles.TrainError=TrainError;
% guidata(hObject,handles);
% handles.TestError=TestError;
% guidata(hObject,handles);
% handles.Weights=Ws;
% guidata(hObject,handles);
set(handles.cluster_no,'String',num2str(clusters(end)));
set(handles.min_dead_no,'String',num2str(min(TheDead)));
%% Plottinf Cluster No.
figure
plot(clusters);
title('Number of CLusters');
%% Plotting Weights for each dimension
if(k==1)
        figure
    colormap('hot');
for i=1:13
subplot(5,3,i);
    imagesc(Ws(:,i));
    title(strcat('Weights for Input',int2str(i)));
end
else if(k==2)
    figure
    colormap('hot');
for i=1:13
%     figure
%     colormap('hot');
subplot(5,3,i);
    imagesc(Ws(:,:,i));
    title(strcat('Weights for Input',int2str(i)));
end        
    end
end



% --- Executes on button press in load_btn.
function load_btn_Callback(hObject, eventdata, handles)
% hObject    handle to load_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in test528.
function distance_Callback(hObject, eventdata, handles)
% hObject    handle to test528 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns test528 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from test528
handles.distance_=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test528 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in k.
function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns k contents as cell array
%        contents{get(hObject,'Value')} returns selected item from k
handles.k_=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function beta_Callback(hObject, eventdata, handles)
% hObject    handle to beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beta as text
%        str2double(get(hObject,'String')) returns contents of beta as a double
handles.beta_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma_Callback(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma as text
%        str2double(get(hObject,'String')) returns contents of sigma as a double
handles.sigma_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma as text
%        str2double(get(hObject,'String')) returns contents of gamma as a double
handles.gamma_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function radius_Callback(hObject, eventdata, handles)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of radius as text
%        str2double(get(hObject,'String')) returns contents of radius as a double
handles.radius_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d2_Callback(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d2 as text
%        str2double(get(hObject,'String')) returns contents of d2 as a double
handles.d2_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function d2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_Callback(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1 as text
%        str2double(get(hObject,'String')) returns contents of d1 as a double
handles.d1_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function d1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d3 as text
%        str2double(get(hObject,'String')) returns contents of d3 as a double
handles.d3_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double
handles.t2_=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function LPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate LPlot


% --- Executes during object creation, after setting all properties.
function RPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate RPlot



function max_epoch_no_2_Callback(hObject, eventdata, handles)
% hObject    handle to max_epoch_no_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_epoch_no_2 as text
%        str2double(get(hObject,'String')) returns contents of max_epoch_no_2 as a double
handles.max_epoch_no_2_=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function max_epoch_no_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_epoch_no_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
