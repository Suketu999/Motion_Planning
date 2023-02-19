%plot(bicyclePose(:,1),bicyclePose(:,2))
%hold all
vizRate = rateControl(30/sampleTime);

sz=size(modelTranslations);
k=15;
trailer = modelTranslations;
trot = modelRot;

while k<=175
trailer(k,1) = trailer(k,1)- 1.7*cos(modelPose(k-4,3)); 
trailer(k,2) = trailer(k,2)- 1.7*sin(modelPose(k-4,3));
trot(k,:) = modelRot(k-14,:);
% trailer(k,1) = trailer(k,1)- 1.7*cos(atan2(bicycleTranslations(k-2,2)-bicycleTranslations(k-2,2),bicycleTranslations(k-2,1)-bicycleTranslations(k-2,1))); 
% trailer(k,2) = trailer(k,2)- 1.7*sin(atan2(bicycleTranslations(k-2,2)-bicycleTranslations(k-2,2),bicycleTranslations(k-2,1)-bicycleTranslations(k-2,1)));
% trot(k,:) = atan2(bicycleTranslations(k-2,2)-bicycleTranslations(k-2,2),bicycleTranslations(k-2,1)-bicycleTranslations(k-2,1));
k=k+1;
end

frameSize = 2.7/1.5;

k=15;
figure

while k<=175
    show(map)
    hold on
    plotTransforms(modelTranslations(k,:),modelRot(k,:),'MeshFilePath','truck.stl',"MeshColor","b","View","2D","FrameSize", frameSize);
    plotTransforms(trailer(k,:),trot(k,:),'MeshFilePath','trailer.stl',"MeshColor","g","View","2D","FrameSize", frameSize);
    hold off
    title('The Truck')
    waitfor(vizRate);
    k=k+1;
end