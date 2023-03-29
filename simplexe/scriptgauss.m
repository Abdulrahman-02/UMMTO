%La m�thode de Gauss consiste � construire une matrice inversible M telle que MA = U soit une matrice
%triangulaire sup�rieure.
%Le syst�me initial Au = b est alors �quivalent par multiplication � gauche par M inversible au syst�me
%triangulaire MAu = M b c�est � dire au syst�me : U.u = bnew, de second membre bnew = M b.
%Il suffit donc d�appliquer � ce dernier syst�me la m�thode de remont�e.
clear;
close;
clc;
format compact
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%   Programmation de l''algorithme de Gauss         %%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%   par MATLAB pour n''importe quelle matrice carr�e    %%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('  ');
disp('---------------------------');
disp('----  Initialisation  -----');
disp('---------------------------');
%D�claration de la taille de la matrice A, les �l�ments seront inject�s un
%par un:
size=input('Donner la taille de la matrice: \n');
for ii=1:size
    for jj=1:size
        elmnt=sprintf('l''�l�ment a%d,%d de la matrice A est: ',ii,jj);
        a(ii,jj)=input(elmnt);
    end
end
%Ecrire la matrice A sous sa forme alg�brique:
A=zeros(size);
for ii=1:size
for jj=1:size
A(ii,jj)=a(ii,jj);
end
end
disp('    ')
disp(['La matrice � reduire par la m�thode de Gauss est A=',mat2str(A)])
disp('    ')
%Choisir la strat�gie a utilis�:
disp('Entrer 1 si c''est la m�thode de Gauss sans permutation, Entrer 2 si c''estla m�thode de Gauss avec la strat�gie du pivot partie, ')
disp('Entrer 3 si c''est la m�thode de Gauss avec la strat�gie du pivot total')
method=input('Choisir la m�thode a utlise�:  ');
disp(['Donc la matrice � reduire par la m�thode de Gauss est A=',mat2str(A)])
disp('---------------------------------------');
disp('------ r�sultat de chaque �tape -------');
disp('---------------------------------------');
B=A; %Changement de notation de la matrice de A pour ne pas l'ecraser lors des calculs
for k=1:size-1
    format rat
    disp('<><><><><><><><><><><><>');
    disp(['     Etape',num2str(k)]);
    disp('<><><><><><><><><><><><>');
    
    %Pivot Total
    if method==3 %|| max(abs(B(k:end,k)))<=1 %activer la m�thode du pivot total pour les petite valeur
        [pivot,ind]=max(abs(B(:)));
        [indrows,indcolumn]=ind2sub(size,ind);
        %Cette partie c'est pour les �tudiants, construire la permutation
        %necessaire pour avoir la nouvelle matrice � reduire par la m�thode
        %de Gauss
        
    %Pivot Partiel    
    elseif method==2 || B(k,k)==0 %||  abs(B(k,k))<=1  %activer la m�thode du pivot partiel pour les petite valeur
 
        [pivot,ind]=max(abs(B(:,k)));
        L1=B(k,:);
        L2=B(ind,:);
        B(k,:)=L2;
        B(ind,:)=L1;
        for i=k+1:size
        s=B(i,k)/B(k,k);
        for j=k:size
            B(i,j)=B(i,j)-s*B(k,j);
        end
        end
    else
    for i=k+1:size
        s=B(i,k)/B(k,k);
        for j=k:size
            B(i,j)=B(i,j)-s*B(k,j);
        end 
    end
    disp('  ')
    disp(['----> La matrice A^(',num2str(k),')= ',mat2str(B)])  
    disp('  ')
    end
end
disp('---------------------------------------');
disp('---------- r�sultat finale ------------');
disp('---------------------------------------');
disp('  ')
disp(['La matrice de triangularisation de A= ',mat2str(A),' par la m�thode de Gauss est T=',mat2str(B)]);  
disp('  ')



        
