function valid = validity(Output,x,y)
    if x<=128 & x>=1 & y<=128 & y>=1
        if Output(x,y)==5 | Output(x,y)==1 | Output(x,y)==3
            valid = 0;
        elseif Output(x,y)==0
            valid = 1;
        end
        
    else
        valid = 0;
    end

%     if x < 1 | x > 128 | y < 1 | y > 128 | Output(x,y)==5 | Output(x,y)==3 | Output(x,y)==1
%         valid = 0;
%     else
%         valid = 1;
%     end
    
end    