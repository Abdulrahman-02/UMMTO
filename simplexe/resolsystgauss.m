clear;
close;
clc;
tic;
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%   Programmation de l''algorithme de Gauss         %%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%   par MATLAB pour n''importe quelle matrice carrée    %%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('  ');
disp('---------------------------');
disp('----  Initialisation  -----');
disp('---------------------------');
%Déclaration de la taille de la matrice A, les éléments seront injectés un
%par un:
size=input('Donner la taille de la matrice: \n');
for ii=1:size
    for jj=1:size
        elmnt=sprintf('l''élément a%d,%d de la matrice A est: ',ii,jj);
        a(ii,jj)=input(elmnt);
    end
end
%Ecrire la matrice A sous sa forme algébrique:
A=zeros(size);
for ii=1:size
for jj=1:size
A(ii,jj)=a(ii,jj);
end
end
disp('    ')
disp(['Donc la matrice à reduire par la méthode de Gauss est A=',mat2str(A)])
disp('---------------------------------------');
disp('------ résultat de chaque étape -------');
disp('---------------------------------------');
B=A; %Changement de notation de la matrice de A pour ne pas l'ecraser lors des calculs
for k=1:size-1
    format rat
    disp('<><><><><><><><><><><><>');
    disp(['     Etape',num2str(k)]);
    disp('<><><><><><><><><><><><>');
    if B(k,k)==0
    %if B(k,k)==0 ||  abs(B(k,k))<=1 %activer la méthode du pivot partiel pour les petite valeur  
    %if B(k,k)==0 || % abs(B(k,k))<=1 %activer la méthode du pivot partiel pour les petite valeur
        [pivot,ind]=max(abs(B(:,k)));
        L1=B(k,:);
        L2=B(ind,:);
        B(k,:)=L2;
        B(ind,:)=L1;
    end
    for i=k+1:size
        s=B(i,k)/B(k,k);
        for j=k:size
            B(i,j)=B(i,j)-s*B(k,j);
        end 
    end
    disp('  ')
    disp(['----> La matrice A^(',num2str(k),')= ',mat2str(B)]);  
    disp('  ')
end
toc;
tps=toc;
disp('---------------------------------------');
disp('---------- résultat finale ------------');
disp('---------------------------------------');
disp('  ')
disp(['La matrice de triangularisation de A= ',mat2str(A),' par la méthode de Gauss est T=',mat2str(B)]);
disp(['le temps de calcul est de ',num2str(tps),' secondes']);
disp('  ')
