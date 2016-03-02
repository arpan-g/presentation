clear;
tick = 0.1;
%  load('cover_1ms_1_10ms_sr.mat');
load('anamoly_2.mat');
% load('cover_1ms_3_10ms_sr.mat');
% load('cover_1ms_4_10ms_sr.mat');
% load('cover_1ms_2_100ms_sr.mat');
% load('data_slots.mat');
freq = 94;
length = size(dataArray);
% min([dataArrat()])
count1 =1 ;
count2 = 1;

 for i = 1:length(2)

    element = dataArray(:,i);
    if(element(4)==6 && element(2)~=251)
        node1(:,count1)=element;
        transTime1(count1,:) = (bi2de(de2bi(node1(11,count1),16)+de2bi(bitsll(node1(12,count1),8),16))*tick);
         if(count1==1)
        tempPir1=de2bi(node1(7,count1),32)+de2bi(bitsll(node1(8,count1),8),32)+de2bi(bitsll(node1(9,count1),16),32)+de2bi(bitsll(node1(10,count1),24),32);
        pir1 =fliplr(tempPir1);
        else
        tempPir1=de2bi(node1(7,count1),32)+de2bi(bitsll(node1(8,count1),8),32)+de2bi(bitsll(node1(9,count1),16),32)+de2bi(bitsll(node1(10,count1),24),32);
        flipPir1 = fliplr(tempPir1);   
        pir1 = cat(32,pir1,flipPir1);
        end
        count1 = count1+1;
      elseif(element(4)==5 && element(2)~=251)
        node2(:,count2)=element;
              
        transTime2(count2,:) = (bi2de(de2bi(node2(11,count2),16)+de2bi(bitsll(node2(12,count2),8),16))*tick);
         if(count2==1)
            tempPir2 = de2bi(node2(7,count2),32)+de2bi(bitsll(node2(8,count2),8),32)+de2bi(bitsll(node2(9,count2),16),32)+de2bi(bitsll(node2(10,count2),24),32);
            pir2 = fliplr(tempPir2);
         else
             tempPir2 = de2bi(node2(7,count2),32)+de2bi(bitsll(node2(8,count2),8),32)+de2bi(bitsll(node2(9,count2),16),32)+de2bi(bitsll(node2(10,count2),24),32);
             flipPir2=fliplr(tempPir2);
            pir2 = cat(32,pir2,flipPir2);
         end
        count2 = count2+1;
    end
     
 end
 
  for i = 1:count1-1
     if(i==1)
     diff = transTime1(i+1,1)-transTime1(i,1);
     diffArray1(i) = diff;
     start = transTime1(i,1) - diff;
     tempTime1(:,1) = transpose(start:(diff/32):transTime1(i,1));
     end
     if(i<count1-1)
         
     diff = transTime1(i+1,1)-transTime1(i,1);
     diffArray1(i) = diff;
     tempTime1(:,i+1) = transpose(transTime1(i,1):(diff/32):transTime1(i+1,1));
     end
 end
  tempTime1(33,:) = [];
  time1 = tempTime1(:);
 
 for i = 1:count2-1
     if(i==1)
     diff = transTime2(i+1,1)-transTime2(i,1);
     diffArray2(i) = diff;
     start = transTime2(i,1) - diff;
     tempTime2(:,1) = transpose(start:(diff/32):transTime2(i,1));
     end
     if(i<count2-1)
     diff = transTime2(i+1,1)-transTime2(i,1);
     diffArray2(i) = diff;
     tempTime2(:,i+1) = transpose(transTime2(i,1):(diff/32):transTime2(i+1,1));
     end
 end
  tempTime2(33,:) = [];
  time2 = tempTime2(:);
  
 numElements = min([count1,count2]);
   tempPirA = pir1(:);
   tempPirB = pir2(:);
   
   pirA = tempPirA(1:(count1-1)*32);
 pirB = tempPirB(1:(count2-1)*32);
 
 
 