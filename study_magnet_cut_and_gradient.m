clear; close all; clc;

beta = linspace(-44,44,100) ;
Bgrad = linspace(0,10,20) ;

for i = 1:length(beta)
    for j = 1:length(Bgrad)
        [alpha1(i,j), alpha2(i,j), total_alpha(i,j)] = dipersion_with_magnet_cut_and_gradient( beta(i), Bgrad(j), 'n' ) ;
        if total_alpha(i,j) <= 0
            disp('total angle <= 0')
            total_alpha(i,j) = 0 ;
        end
%         if alpha1(i,j) >= 90
%             total_alpha(i,j) = 0 ;
%         end
    end
end

%% Plotting

figure
meshc(beta,Bgrad,total_alpha')
colorbar

xlabel('\beta [degrees]')
ylabel('B_{grad} [T/m]')
zlabel('\alpha [degrees]')