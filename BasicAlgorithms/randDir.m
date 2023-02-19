function move = randDir(oPos,nPos)
    Dir = floor(9*rand);

    if oPos(1)==1 & oPos(2)==1                  %%Checking for 'edge' cases
        while Dir==1 | Dir==2 | Dir==3 | Dir==4 | Dir==6
            Dir = floor(9*rand);
        end
    elseif oPos(1)==1
        while Dir==1 | Dir==2 | Dir==3
            Dir = floor(9*rand);
        end
    elseif oPos(2)==1
        while Dir==1 | Dir==4 | Dir==6
            Dir = floor(9*rand);
        end
    elseif oPos(1)==128
        while Dir==6 | Dir==7 | Dir==8
            Dir = floor(9*rand);
        end
    elseif oPos(2)==128
        while Dir==3 | Dir==5 | Dir==8
            Dir = floor(9*rand);
        end
    end

    %%Traversing to new cell as per direction
    switch Dir
        case 1                    
            nPos = [oPos(1)-1,oPos(2)-1];
        case 2
            nPos = [oPos(1)-1,oPos(2)];
        case 3
            nPos = [oPos(1)-1,oPos(2)+1];
        case 4
            nPos = [oPos(1),oPos(2)-1];
        case 5
            nPos = [oPos(1),oPos(2)+1];
        case 6
            nPos = [oPos(1)+1,oPos(2)-1];
        case 7
            nPos = [oPos(1)+1,oPos(2)];
        otherwise
            nPos = [oPos(1)+1,oPos(2)+1];
    end

    move = nPos;
end