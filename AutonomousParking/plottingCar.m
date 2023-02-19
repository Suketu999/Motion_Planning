%plot(bicyclePose(:,1),bicyclePose(:,2))
%hold all
vizRate = rateControl(30/sampleTime);

sz=size(modelTranslations);
k=1;

frameSize = 2.7/0.6;

figure

while k<=sz(1)/2 
    show(map)
    hold on
    plotTransforms(modelTranslations(k,:),modelRot(k,:),'MeshFilePath','car1.stl',"MeshColor","b","View","2D","FrameSize", frameSize);
    hold off
    title('The Car')
    waitfor(vizRate);
    k=k+1;
end