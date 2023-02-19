prompt = 'Enter Occupancy from 0 to 1: '; %of occupied cells in the grid
ip = input(prompt);

Output = Grid(ip); %%Function that gives the Obstacle Grid
Pos = [1,1];
Output(Pos)=5;
Goal = [128,128];
Visited = Pos;
i=0;

%while Pos(1,1)<[128] | Pos(1,2)<[128]
while Pos(1)<[128] | Pos(2)<[128]    
    i=i+1;
    if validity(Output,(Pos(1)+1),Pos(2))==1
        Pos = [Pos(1)+1,Pos(2)];
        Visited(end+1,:)=Pos;
        %disp('1');
        %disp(Pos);
    
    elseif validity(Output,Pos(1),Pos(2)+1)==1
        Pos = [Pos(1),Pos(2)+1];
        Visited(end+1,:)=Pos;
        %disp('2');
        %disp(Pos);
        
    elseif validity(Output,Pos(1)-1,Pos(2))==1
        Pos = [Pos(1)-1,Pos(2)];
        Visited(end+1,:)=Pos;
        %disp('3');
        %disp(Pos);

    elseif validity(Output,Pos(1),Pos(2)-1)==1
        Pos = [Pos(1),Pos(2)-1];
        Visited(end+1,:)=Pos;
        %disp('4');
        %disp(Pos);
        
    else
        disp('Pos1');
        disp(Pos);
        Output(Pos(1),Pos(2))=3;
        Pos = Visited(end-1,:);
        disp('Pos2');
        disp(Pos);
        Visited(end,:) = [];
        if Output(Pos(1),Pos(2))~=5
            Visited(end+1,:)=Pos;
        end
        Output(Pos(1),Pos(2))=0;
        disp('5');
        disp(Pos);
        
    end
    
    Output(Pos(1),Pos(2))=5;
    %Visited(end+1,:)=Pos;

end