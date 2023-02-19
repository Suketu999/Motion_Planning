map(1:5,1:5)=1;
map(6:8,6:8)=0;
map(9:10,9:10)=1;
tic;
time=toc;
while(time<10)
    surf(map)
    hold on
    time=toc;
    if (mod(time,2)<=0.1)
        map(floor(10*rand)+1,floor(10*rand)+1)=3;
        surf(map)
        hold on
    end
    time=toc;
end