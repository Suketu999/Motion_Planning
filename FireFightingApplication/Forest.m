clear list start intrm time frst timeline

frst = OCPD;
timeline(1,:,:) = OCPD;

list(1,1)=0;
list(1,2)=0;

for i=1:50
    for j=1:50
        if frst(i,j)==1
            list(end+1,:)=[i,j];
        end
    end
end

list(1,:) = [];

init = floor(length(list)*rand);
initr = list(init,1);
initc = list(init,2);

% start=tic;
%
% time=toc(start);
%
%     while (time<6)
%         time=toc(start);
%     end
%
%     if (time>6 && time<6.1)
frst(initr,initc)=3; % burning state
%     end

timeline(2,:,:) = frst;
%     surf(frst)
%     view(2)
%     pause(1)
%     dur=toc(start);

%     while(dur<=20)
%         if(mod(dur,2)<=0.0001)
% spread fire to radius of 30m
n=1;
while(n>0)
    frst = spreadFire(frst,list);
    % mod(dur,2)
    timeline(end+1,:,:)=frst;
    pause(2)
    %             surf(frst)
    %             view(2)
    %             pause(1.75);
    %         end
    %         dur=toc(start);
end