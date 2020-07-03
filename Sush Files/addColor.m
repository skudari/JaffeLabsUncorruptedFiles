function [colorMat] = addColor(mat)
A = mat(:,3); 

normA = A - min(A(:)); 
normA = normA ./ max(normA(:)); 

%b n w 
%colorMat = [normA(:) normA(:) normA(:)]; 

zer = zeros(size(normA(:))); 
%r n b
colorMat = [normA(:) zer 1-normA(:)]; 

end

