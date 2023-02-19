clear v
% sz = size(timeline);
for i=1:8
    v(:,:) = timeline(i,:,:);
    surf(v);
    xlim([1,50])
    ylim([1,50])
    view(2)
    pause(2)
end