A(26:27,:)=0;
A(:,26:27)=0;
Output = A;
Pos = [3,23];
%Pos = [2,2];
Output(Pos) = 5;
Goal = [13,2];
Que = Pos;
Parent = Pos;
i=1;
j=0;

while Pos(1)<[13] | Pos(2)<[2]    
    
    j=0;
    
    if validity(Output,Pos(1),Pos(2)+1)==1
        Que(end+1,:) = [Pos(1),Pos(2)+1];
        Output(Pos(1),(Pos(2)+1))=5;
        Parent(end+1,:)=Pos;
        j=1;
    end
    
    
    if validity(Output,(Pos(1)+1),Pos(2))==1
        Que(end+1,:) = [Pos(1)+1,Pos(2)];
        Output((Pos(1)+1),Pos(2))=5;
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
    
    Pos = Que(i+1,:);
    i = i+1;

end

Ind=i;
Path=Goal;

while Ind>1
    Hunt=Parent(Ind,:);
    Ind=indx(Que,Hunt,i);
    %if Ind<=i
    Path(end+1,:)=Que(Ind,:);
    %end
end

[r,s]=size(Path);

while r>0
    aux=Path(r,:);
    Output(aux(1),aux(2))=11;
    r=r-1;
end   

u=1;
sz=size(Path);
fpath(1,1)=2;
fpath(1,2)=2;
while u<=sz(1)
    fpath(u,1)=Path(end+1-u,1);
    fpath(u,2)=Path(end+1-u,2);
    u=u+1;
end

Path = fpath;