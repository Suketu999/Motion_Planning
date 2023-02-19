prompt = 'Enter Occupancy from 0 to 1:'; %of occupied cells in the grid
ip = input(prompt);

Output = Grid(ip); %%Function that gives the Obstacle Grid

oPos = [1,1]; %%Initial/Old Robot Position
nPos = [1,1]; %%New Robot Position
Output(oPos(1),oPos(2))=5; %%Marks already visited cell

Goal = [128,128];

i = 1;

while i <= 1000

    nPos = randDir(oPos,nPos); %%function for traversing to a new random neighbouring cell
    
        while Output(nPos)==5 | Output(nPos)==1
            nPos = randDir(oPos,nPos); %%checking for obstacle or already visited cell
        end
    
    oPos = nPos;
    
    if oPos==Goal
        break;
    end
    
    Output(oPos(1),oPos(2))=5;
    
    i = i + 1;
    
end