% subplot(2,1,1)
stem(time1,pirA)
% subplot(2,1,2)
hold on;
stem(time2,pirB);
xlabel('time(s)');
ylabel('pir output');
legend('node1','node2');
ax=gca;
ax.YTick = [0,1,1.1];
plottools


 
plot(transTime1);
hold on;
plot(transTime2);