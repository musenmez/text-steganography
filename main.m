function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 17-Dec-2019 17:06:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clear global filename;
delete(get(handles.axes1,'children'));
delete(get(handles.axes2,'children'));
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit4,'String','');
set(handles.orjinal,'String','');
set(handles.encrypted,'String','');

%This option is for adding Turkish characters.
%We need 9 bits to define extra characters.
%If English characters are enough for you, set bitnum to 8.
slCharacterEncoding('windows-1254');
global bit_num;
bit_num = 9;


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_encrypted.
function select_encrypted_Callback(hObject, eventdata, handles)
% hObject    handle to select_encrypted (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This button allows you to load your encrypted image without encryption process.
[temp_filename,filepath] = uigetfile({'*.jpg;*.png;*.bmp;*.oct;*.png'}, 'Select Image to Open');
if isequal(temp_filename,0)
   disp('User selected Cancel');
   return;
else
    filename = temp_filename;
    fullName = fullfile(filepath,filename);
    img = imread(fullName);   
    axes(handles.axes2);
    imshow(img);    
    set(handles.encrypted, 'String', 'Encrypted Image');
    disp(['User selected ', fullName]);    
end


% --- Executes on button press in select_key.
function select_key_Callback(hObject, eventdata, handles)
% hObject    handle to select_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This section allows you to select a key for decryption on your computer
[temp_filename,filepath] = uigetfile({'*.txt;'}, 'Select Key File to Open');
if isequal(temp_filename,0)
   disp('User selected Cancel');   
   return;
else
    filename = temp_filename;
    fullName = fullfile(filepath,filename);   
    set(handles.edit4, 'String', fullName);     
    disp(['User selected ', fullName]);    
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in encode.
function encode_Callback(hObject, eventdata, handles)
% hObject    handle to encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global bit_num;
global filename;

%This block allows to read multi line text from gui and get the message.
msg_str = get(handles.edit2, 'String');
temp_msg = string(msg_str);
str = join(temp_msg,"\n",1);
msg_str=compose(str);
msg_str = char(msg_str);

%Get image
img = getimage(handles.axes1);
temp_img = img;
%Get image size
[row_img, col_img, numberOfColorChannels] = size(img);

%Check if image and text are loaded.
if isempty(msg_str)
    msgbox('Please write a message.','Error','error');    
    return;    
elseif isempty(img)
    msgbox('Please select an image.','Error','error');    
    return;       
else
    disp(msg_str);   
end
rgb = false;


%Check if image is RGB
%If the image is RGB, we will use the red channel
if numberOfColorChannels > 1
    redChannel = img(:,:,1);
    greenChannel = img(:,:,2);
    blueChannel = img(:,:,3);
    temp_img = redChannel;
    rgb = true;
end

%Convert image and text data to binary
img_bin = de2bi(temp_img,bit_num,'left-msb');
msg_bin = de2bi(uint16(msg_str),bit_num,'left-msb');

[msg_row, msg_col] = size(msg_bin);
encrypted_msg = msg_bin ;
msg_length = length(msg_str);

%Check if the message fits into the image.
msg_Pxlength = msg_length*bit_num;
img_l = length(img_bin);
if (msg_Pxlength > img_l)
    message = sprintf('Message cant fit this image.\nImage Size = %d pixels.\nMessage Size = %d pixels.', img_l, msg_Pxlength);
    msgbox(message,'Error','error');    
    return;
end

%Create a matrix for key system and set first data to message length
%This matrix will hold information about how the message queue should be.
order = zeros(msg_row+1,msg_col);
order(1,1) = msg_length;

%Shuffle the order of the message
%And save this shuffled order into the matrix 
for i=1:msg_row
    temp_order = randperm(msg_col); 
    encrypted_msg(i,temp_order) = msg_bin(i,:);   
    order(i+1,:)= temp_order;    
end

%Create table with this matrix and save as a .txt file
if ~exist('keys', 'dir')
       mkdir('keys')
end
T = table(order);
key_name = strcat(extractBefore(filename, '.'),'_key.txt');
fullNameKey = ['keys\', key_name];
writetable(T,fullNameKey,'WriteVariableNames',false);


%Create encrypted image with LSB method
k=1;
for i=1:msg_length
    for m=1:bit_num
        img_bin(k,bit_num) = encrypted_msg(i,m);
        k = k+1;
    end   
end
dec_a = bi2de(img_bin,'left-msb');
matrx = vec2mat(dec_a,row_img);
encrypted_img = matrx.';

%If the image is RGB, merge all color channels to get RGB image
if rgb
    encrypted_img = cat(3, encrypted_img, greenChannel, blueChannel);
end

%Save encrypted image on the computer and imshow on axes
if ~exist('encrypted_images', 'dir')
       mkdir('encrypted_images')
end
name = strcat(extractBefore(filename, '.'),'_encrypted.png');
fullName = ['encrypted_images\', name];
imwrite(encrypted_img,fullName);
axes(handles.axes2);
imshow(encrypted_img);
set(handles.encrypted, 'String', 'Encrypted Image');
msgbox('Encryption completed.','Success','help');


% --- Executes on button press in decode.
function decode_Callback(hObject, eventdata, handles)
% hObject    handle to decode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global bit_num;

de_img=getimage(handles.axes2);

%Check if encrypted image is loaded
if isempty(de_img)
    msgbox('Select an image!!','Error','error');
    return;
end

%Try to read key file
path = get(handles.edit4, 'String');
try
    key = readtable(path);
catch
    msgbox('Unable to open key file','Error','error');
    return;
end

[key_row, key_col] = size(key);
bin_msg = zeros(1,bit_num);
msgCorrect_order = zeros(key_row, bit_num);
[de_row, de_col, numberOfColorChannels] = size(de_img);

%Check if image is RGB
%If the image is RGB, get red channel data
if numberOfColorChannels > 1
    redChannel = de_img(:,:,1);    
    de_img = redChannel;
end

k = 1;
msg_result = "";
msg_length = key(1,:).(1);
msg_pixel_length = msg_length*bit_num;
de_bin = de2bi(de_img,bit_num,'left-msb');

%Check if the message length is longer than the image length.
if length(de_bin) < msg_pixel_length
    msgbox('Wrong Key!!','Error','error');  
    return;
end

%Get shuffled message from image
for i=1:msg_pixel_length
    temp_mod = mod(i,bit_num);
    if temp_mod==0
        temp_mod = bit_num;
    end
    bin_msg(k, temp_mod) = de_bin(i,bit_num);    
    if(mod(i,bit_num)==0)
        k = k+1;        
    end       
end

%Create waitbar
f = waitbar(0.01,'1 / 100','Name','Decoding...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);

%Sorting the message in the right order
for i=2:key_row  
    num_order = key{i,:};
    temp_binMsg = bin_msg(i-1,:);
    msgCorrect_order(i-1,:) = temp_binMsg(num_order); 
        if getappdata(f,'canceling')            
            delete(f);             
            return;         
         elseif i==key_row*0.25 || i==key_row*0.5 || i==key_row*0.75 || i==key_row
            waitbar(i/key_row,f,sprintf('%d / 100', 100*i/key_row));            
        end
end

%Convert the message from binary to char.
for i=1:msg_length
	dec_msg = bin2dec(num2str(msgCorrect_order(i,:),'%d'));    
	msg_result = msg_result + char(dec_msg);
end
delete(f);
set(handles.edit3, 'String', msg_result);
fileID = fopen('decrypted_text.txt','w');
fprintf(fileID, msg_result);
fclose(fileID);
msgbox('Decryption completed.','Success','help');


% --- Executes on button press in select_image.
function select_image_Callback(hObject, eventdata, handles)
% hObject    handle to select_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This section allows you to load a image on your computer to the program.
global filename;
[temp_filename,filepath] = uigetfile({'*.tif;*.jpeg;*.jpg;*.png;*.bmp;*.oct;*.png'}, 'Select Image to Open');
if isequal(temp_filename,0)
   disp('User selected Cancel');
   return;
else
    filename = temp_filename;
    fullName = fullfile(filepath,filename);
    img = imread(fullName);   
    axes(handles.axes1);    
    imshow(img);    
    set(handles.orjinal, 'String', 'Orjinal Image');
    disp(['User selected ', fullName]);    
end


% --- Executes on button press in load_text.
function load_text_Callback(hObject, eventdata, handles)
% hObject    handle to load_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This section allows you to load a text on your computer to the program.
[temp_filename,filepath] = uigetfile({'*.txt;'}, 'Select Text File to Open');
if isequal(temp_filename,0)
   disp('User selected Cancel');   
   return;
else
    filename = temp_filename;
    fullName = fullfile(filepath,filename);
    fileID = fopen(fullName,'r');
    text = fscanf(fileID,'%c');     
    set(handles.edit2, 'String', text);
    fclose(fileID);
    disp(['User selected ', fullName]);    
end
