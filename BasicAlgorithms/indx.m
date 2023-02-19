function fnd_in = indx(Que, Hunt, i)
k=1;

while k<=i
    if Hunt==Que(k,:)
        break;
    else
        k=k+1;
    end
end
% % while Hunt(1,1)~=Que(k,1)
% %     k=k+1;
% % end
% % 
% % if Hunt(1,2)~=Que(k,2)
    
% while k<=i
%     if Hunt(1,1)~=Que(k,1) 
%         if Hunt(1,2)~=Que(k,2)
%             k=k+1;
%         end
%     else
%         if Hunt(1,2)~=Que(k,2)
%             k=k+1;
%         else
%             break;
%         end
%     end
%while Hunt~=(Que(k,1),Que(k,2))
% while Hunt(1,1)~=Que(k,1) 
%     while Hunt(1,2)~=Que(k,2)
%         k=k+1;
%     end
% end

fnd_in = k;

end