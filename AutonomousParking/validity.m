function valid = validity(Output,x,y)
    if x<=25 & x>=1 & y<=25 & y>=1
        if Output(x,y)==5 | Output(x,y)==1 | Output(x,y)==3
            valid = 0;
        elseif Output(x,y)==0
            valid = 1;
        end 
    else
        valid = 0;
    end
end    