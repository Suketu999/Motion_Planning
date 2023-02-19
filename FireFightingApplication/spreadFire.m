function sf = spreadFire(OCPD,list)
n=0;
for i=1:length(list)
    if OCPD(list(i,1),list(i,2))==3
        (list(i,1),list(i,2))
        for j=list(i,1)-5:list(i,1)+5
            for k=list(i,2)-5:list(i,2)+5
                if k<51 & k>0 & j<51 & j>0 & OCPD(j,k)==1
                    OCPD(j,k)=3;
                    n=1;
                end
            end
        end
    end
end

sf = OCPD;
% n = n;
% for i = cntr(1)-n:cntr(1)+n
%     for j = cntr(2)-n:cntr(2)+n
%         if i<51 & i>0 & j<51 & j>0 & OCPD(i,j)==1
%             OCPD(i,j)=3;
%         end
%     end
% end

end