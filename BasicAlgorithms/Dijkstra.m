prompt = 'Enter Occupancy from 0 to 1: '; %of occupied cells in the grid
ip = input(prompt);

Output = Grid(ip); %%Function that gives the Obstacle Grid
Pos = [1,1];
Output(Pos)=5;
Goal = [128,128];
Cost = Inf(128);
Que = Pos;
Parent = Pos;
i=1;
j=0;

while Pos(1)<[128] | Pos(2)<[128]    
    
    j=0;
    
    if validity(Output,(Pos(1)+1),Pos(2))==1
        Que(end+1,:) = [Pos(1)+1,Pos(2)];
        Output((Pos(1)+1),Pos(2))=5;
        Parent(end+1,:)=Pos;
        j=1;
    end
    
    if validity(Output,Pos(1),Pos(2)+1)==1
        Que(end+1,:) = [Pos(1),Pos(2)+1];
        Output(Pos(1),(Pos(2)+1))=5;
        Parent(end+1,:)=Pos;
        j=1;
    end
    
    if validity(Output,Pos(1)-1,Pos(2))==1
        Que(end+1,:) = [Pos(1)-1,Pos(2)];
        Output((Pos(1)-1),Pos(2))=5;
        Parent(end+1,:)=Pos;
        j=1;
    end
    
    
    if validity(Output,Pos(1),Pos(2)-1)==1
        Que(end+1,:) = [Pos(1),Pos(2)-1];
        Output(Pos(1),(Pos(2)-1))=5;
        Parent(end+1,:)=Pos;
        j=1;
    end
    
    if j~=1
        Output(Pos(1),Pos(2))=3;
    end
    
    Cost(Pos) = i;
    Pos = Que(i+1,:);
    i = i+1;
end

Ind=i;
Path=[128,128];

while Ind>1
    Hunt=Parent(Ind,:);
    Ind=indx(Que,Hunt,i);
    Path(end+1,:)=Que(Ind,:);
end

[r,s]=size(Path);

while r>0
    aux=Path(r,:);
    Output(aux(1),aux(2))=11;
    r=r-1;
end