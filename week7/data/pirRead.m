count = 1;
% string "IxxxxRxLxx\r\n"
%           I 73   R 114 L 108 
%           \r 13
%           \n 10
delete(instrfindall);
dataArray = zeros(18,10);
sensor = serial('COM5');
set(sensor, 'BaudRate', 9600, 'DataBits', 8,'InputBufferSize', 512, 'Timeout', 30)
fopen(sensor);
 fprintf(sensor, '#');
readasync(sensor);

 while count <= 500
   % incl. hand-shake
%     fprintf(sensor, '#');
   
   rawdata = fread(sensor,18);
   dataArray(:,count)= rawdata;
   count = count + 1
 
end