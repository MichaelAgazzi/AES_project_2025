clc
clear
close all
%%Define Parameters
Pnom = [50 100 120];
Popt = [45 90 105];
Pmml = [10 20 50];
copt = [50 50 60];
cmml = [80 120 90];
Pe = [30 60 90 120 150 180 210 240];

%% Pool G1

% Funzione obiettivo (cubica)
f = @(P) (copt(1)+(cmml(1)-copt(1))/((Popt(1)-Pmml(1))^2)*(P(1)-Popt(1))^2)*P(1);

% Vincoli di uguaglianza: Aeq * x = beq
P = 30;
P1_solutions = P;
f1_cost_vals = f(P);

%% Pool G2
P2_solutions = zeros(3, 1);
f2_cost_vals = zeros(3, 1);
for i = 1:3
    % Funzione obiettivo (cubica)
    f = @(P) (copt(2)+(cmml(2)-copt(2))/((Popt(2)-Pmml(2))^2)*(P(1)-Popt(2))^2)*P(1);

    % Vincoli di uguaglianza: Aeq * x = beq
    P = Pe(i);
    P2_solutions(i) = P;
    f2_cost_vals(i) = f(P);
end

%% Pool G3
P3_solutions = zeros(3, 1);
f3_cost_vals = zeros(3, 1);
for i = 1:3
    % Funzione obiettivo (cubica)
    f = @(P) (copt(3)+(cmml(3)-copt(3))/((Popt(3)-Pmml(3))^2)*(P(1)-Popt(3))^2)*P(1);

    % Vincoli di uguaglianza: Aeq * x = beq
    P = Pe(i+1);
    P3_solutions(i) = P;
    f3_cost_vals(i) = f(P);
end
%% Pool G1 G2
n=5;
P12_solutions = zeros(n, 2);
f12_cost_vals = zeros(n, 1);
for i = 1:n
    % Funzione obiettivo (cubica)
    alpha1 = (cmml(1) - copt(1)) / ((Popt(1) - Pmml(1))^2);
    alpha2 = (cmml(2) - copt(2)) / ((Popt(2) - Pmml(2))^2);

    f = @(P) (copt(1) + alpha1*(P(1) - Popt(1))^2)*P(1) + ...
         (copt(2) + alpha2*(P(2) - Popt(2))^2)*P(2);
    % Vincoli di uguaglianza: Aeq * x = beq
    Aeq = [1 1];
    beq = Pe(i);

    % Vincoli di disuguaglianza: x >= 0 (impostato come bounds)
    lb = [Pmml(1) Pmml(2)];  % lower bounds
    ub = [Pnom(1) Pnom(2)];     % no upper bounds

    % Punto iniziale
    x0 = [Pe(i) 0];

    % Nessun vincolo non lineare (li abbiamo già inclusi in Aeq e bounds)
    nonlcon = [];

    % Chiamata a fmincon
    [P_opt, fval, exitflag, output] = fmincon(f, x0, [], [], Aeq, beq, lb, ub, nonlcon);

    % Output dei risultati
    fprintf('Soluzione ottima: P1 = %.4f, P2 = %.4f\n', P_opt(1), P_opt(2));
    fprintf('Valore della funzione: f(x) = %.4f\n', fval);
    P12_solutions(i, :) = P_opt;
    f12_cost_vals(i) = fval;
end

%% Pool G1 G3
n=4;
P13_solutions = zeros(n, 2);
f13_cost_vals = zeros(n, 1);
for i = 1:n
    % Funzione obiettivo (cubica)
    alpha1 = (cmml(1) - copt(1)) / ((Popt(1) - Pmml(1))^2);
    alpha2 = (cmml(3) - copt(3)) / ((Popt(3) - Pmml(3))^2);

    f = @(P) (copt(1) + alpha1*(P(1) - Popt(1))^2)*P(1) + ...
         (copt(3) + alpha2*(P(2) - Popt(3))^2)*P(2);
    % Vincoli di uguaglianza: Aeq * x = beq
    Aeq = [1 1];
    beq = Pe(i+1);

    % Vincoli di disuguaglianza: x >= 0 (impostato come bounds)
    lb = [Pmml(1) Pmml(3)];  % lower bounds
    ub = [Pnom(1) Pnom(3)];     % no upper bounds

    % Punto iniziale
    x0 = [Pe(i+1) 0];

    % Nessun vincolo non lineare (li abbiamo già inclusi in Aeq e bounds)
    nonlcon = [];

    % Chiamata a fmincon
    [P_opt, fval, exitflag, output] = fmincon(f, x0, [], [], Aeq, beq, lb, ub, nonlcon);

    % Output dei risultati
    fprintf('Soluzione ottima: P1 = %.4f, P3 = %.4f\n', P_opt(1), P_opt(2));
    fprintf('Valore della funzione: f(x) = %.4f\n', fval);
    P13_solutions(i, :) = P_opt;
    f13_cost_vals(i) = fval;
end

%% Pool G2 G3
n=5;
P23_solutions = zeros(n, 2);
f23_cost_vals = zeros(n, 1);
for i = 1:n
    % Funzione obiettivo (cubica)
    alpha1 = (cmml(2) - copt(2)) / ((Popt(2) - Pmml(2))^2);
    alpha2 = (cmml(3) - copt(3)) / ((Popt(3) - Pmml(3))^2);
  
    f = @(P) (copt(2) + alpha1*(P(1) - Popt(2))^2)*P(1) + ...
         (copt(3) + alpha2*(P(2) - Popt(3))^2)*P(2);
    % Vincoli di uguaglianza: Aeq * x = beq
    Aeq = [1 1];
    beq = Pe(i+2);

    % Vincoli di disuguaglianza: x >= 0 (impostato come bounds)
    lb = [Pmml(2) Pmml(3)];  % lower bounds
    ub = [Pnom(2) Pnom(3)];     % no upper bounds

    % Punto iniziale
    x0 = [Pe(i+2) 0];

    % Nessun vincolo non lineare (li abbiamo già inclusi in Aeq e bounds)
    nonlcon = [];

    % Chiamata a fmincon
    [P_opt, fval, exitflag, output] = fmincon(f, x0, [], [], Aeq, beq, lb, ub, nonlcon);

    % Output dei risultati
    fprintf('Soluzione ottima: P2 = %.4f, P3 = %.4f\n', P_opt(1), P_opt(2));
    fprintf('Valore della funzione: f(x) = %.4f\n', fval);
    P23_solutions(i, :) = P_opt;
    f23_cost_vals(i) = fval;
end

%% Pool G1 G2 G3
n=6;
P123_solutions = zeros(n, 3);
f123_cost_vals = zeros(n, 1);
for i = 1:n
    % Funzione obiettivo (cubica)
    alpha1 = (cmml(1) - copt(1)) / ((Popt(1) - Pmml(1))^2);
    alpha2 = (cmml(2) - copt(2)) / ((Popt(2) - Pmml(2))^2);
    alpha3 = (cmml(3) - copt(3)) / ((Popt(3) - Pmml(3))^2);
    
    f = @(P) (copt(1) + alpha1*(P(1) - Popt(1))^2)*P(1) + ...
             (copt(2) + alpha2*(P(2) - Popt(2))^2)*P(2) + ...
             (copt(3) + alpha3*(P(3) - Popt(3))^2)*P(3);
    % Vincoli di uguaglianza: Aeq * x = beq
    Aeq = [1 1 1];
    beq = Pe(i+2);
    
    % Vincoli di disuguaglianza: x >= 0 (impostato come bounds)
    lb = [Pmml(1) Pmml(2) Pmml(3)];  % lower bounds
    ub = [Pnom(1) Pnom(2) Pnom(3)];     % no upper bounds
    
    % Punto iniziale
    x0 = [0 0 Pe(i+2)];
    
    % Nessun vincolo non lineare (li abbiamo già inclusi in Aeq e bounds)
    nonlcon = [];
    
    % Chiamata a fmincon
    [P_opt, fval, exitflag, output] = fmincon(f, x0, [], [], Aeq, beq, lb, ub, nonlcon);
    
    % Output dei risultati
    fprintf('Soluzione ottima: P1 = %.4f, P2 = %.4f, P3 = %.4f\n', P_opt(1), P_opt(2), P_opt(3));
    fprintf('Valore della funzione: f(x) = %.4f\n', fval);
    P123_solutions(i, :) = P_opt;
    f123_cost_vals(i) = fval;
end

%% Finals Optimals Solutions
[P30_val, P30_idx] = min([f1_cost_vals(1) f2_cost_vals(1) f12_cost_vals(1)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx =%.4f\n ', P30_val, P30_idx);

[P60_val, P60_idx] = min([f2_cost_vals(2) f3_cost_vals(1) f12_cost_vals(2) f13_cost_vals(1)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P60_val, P60_idx);

[P90_val, P90_idx] = min([f2_cost_vals(3) f3_cost_vals(2) f12_cost_vals(3) f13_cost_vals(1) f23_cost_vals(1) f123_cost_vals(1)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P90_val, P90_idx);

[P120_val, P120_idx] = min([f3_cost_vals(3) f12_cost_vals(4) f13_cost_vals(3) f23_cost_vals(2) f123_cost_vals(2)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P120_val, P120_idx);

[P150_val, P150_idx] = min([f12_cost_vals(5) f13_cost_vals(4) f23_cost_vals(3) f123_cost_vals(3)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P150_val, P150_idx);

[P180_val, P180_idx] = min([f23_cost_vals(4) f123_cost_vals(4)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P180_val, P180_idx);

[P210_val, P210_idx] = min([f23_cost_vals(5) f123_cost_vals(5)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P210_val, P210_idx);

[P240_val, P240_idx] = min([f123_cost_vals(6)]);
fprintf('Valore della funzione: f(x) = %.4f\n with idx = %.4f\n', P240_val, P240_idx);
%%
%% Risultati finali dettagliati con info sulla funzione migliore e bilancio ottimo

fprintf('\n--- RISULTATI FINALI ---\n');

% Array delle potenze
powers = [30 60 90 120 150 180 210 240];

% Array delle funzioni costi per ciascun valore di potenza
cost_vals = {
    [f1_cost_vals(1), f2_cost_vals(1), f12_cost_vals(1)];
    [f2_cost_vals(2), f3_cost_vals(1), f12_cost_vals(2), f13_cost_vals(1)];
    [f2_cost_vals(3), f3_cost_vals(2), f12_cost_vals(3), f13_cost_vals(1), f23_cost_vals(1), f123_cost_vals(1)];
    [f3_cost_vals(3), f12_cost_vals(4), f13_cost_vals(3), f23_cost_vals(2), f123_cost_vals(2)];
    [f12_cost_vals(5), f13_cost_vals(4), f23_cost_vals(3), f123_cost_vals(3)];
    [f23_cost_vals(4), f123_cost_vals(4)];
    [f23_cost_vals(5), f123_cost_vals(5)];
    [f123_cost_vals(6)]
};

% Array dei nomi delle funzioni
cost_names = {
    {'f1', 'f2', 'f12'};
    {'f2', 'f3', 'f12', 'f13'};
    {'f2', 'f3', 'f12', 'f13', 'f23', 'f123'};
    {'f3', 'f12', 'f13', 'f23', 'f123'};
    {'f12', 'f13', 'f23', 'f123'};
    {'f23', 'f123'};
    {'f23', 'f123'};
    {'f123'}
};

% Array delle soluzioni corrispondenti (per ottenere il bilancio ottimo)
solutions = {
    {P1_solutions(1), P2_solutions(1), P12_solutions(1,:)};
    {P2_solutions(2), P3_solutions(1), P12_solutions(2,:), P13_solutions(1,:)};
    {P2_solutions(3), P3_solutions(2), P12_solutions(3,:), P13_solutions(1,:), P23_solutions(1,:), P123_solutions(1,:)};
    {P3_solutions(3), P12_solutions(4,:), P13_solutions(3,:), P23_solutions(2,:), P123_solutions(2,:)};
    {P12_solutions(5,:), P13_solutions(4,:), P23_solutions(3,:), P123_solutions(3,:)};
    {P23_solutions(4,:), P123_solutions(4,:)};
    {P23_solutions(5,:), P123_solutions(5,:)};
    {P123_solutions(6,:)}
};

% Ciclo per stampare i risultati
for i = 1:length(powers)
    [val_min, idx_min] = min(cost_vals{i});
    name_best = cost_names{i}{idx_min};
    sol_best = solutions{i}{idx_min};

    fprintf('\n>> Potenza richiesta: %d MW\n', powers(i));
    fprintf('   Valore minimo della funzione: %.4f\n', val_min);
    fprintf('   Funzione più efficiente: %s\n', name_best);
    
    % Gestione stampa del bilancio ottimo
    if isscalar(sol_best)
        fprintf('   Bilancio ottimo: P = %.4f\n', sol_best);
    else
        for j = 1:length(sol_best)
            fprintf('   P%d = %.4f\n', j, sol_best(j));
        end
    end
end

%% Define parameters
Pnom = [50 100 120];
Popt = [45 90 105];
Pmml = [10 20 50];
copt = [50 50 60];
cmml = [80 120 90];
Pe   = [30 60 90 120 150 180 210 240];

% Funzione costo (uguale all’originale)
cost_fun = @(P) ...
    (copt(1)+(cmml(1)-copt(1))/((Popt(1)-Pmml(1))^2)*(P(1)-Popt(1))^2).*P(1) + ...
    (copt(2)+(cmml(2)-copt(2))/((Popt(2)-Pmml(2))^2)*(P(2)-Popt(2))^2).*P(2) + ...
    (copt(3)+(cmml(3)-copt(3))/((Popt(3)-Pmml(3))^2)*(P(3)-Popt(3))^2).*P(3);

P_all   = NaN(3,length(Pe));   % soluzione migliore per ogni Pe
cost_all = NaN(1,length(Pe));  % costo minimo per ogni Pe
u_all   = NaN(3,length(Pe));   % stato on/off migliore (facoltativo)

options = optimoptions('fmincon','Display','off','Algorithm','sqp');

for k = 1:length(Pe)
    demand = Pe(k);
    best_cost = inf;                
    
    % --- 8 combinazioni di generatori ----
    for mask = 0:7                   % 000 … 111 in binario
        u = bitget(mask,1:3);        % u(1)=LSB => G1, u(2)=>G2, u(3)=>G3
        
        % limiti inferiori/superiori per questa combinazione
        lb = Pmml .* u;              % se u=0 -> 0, se u=1 -> Pmml
        ub = Pnom .* u;              % se u=0 -> 0, se u=1 -> Pnom
        
        % verifica fattibilità rapida
        if demand < sum(lb) || demand > sum(ub)
            continue                 % combinazione impossibile
        end
        
        % iniziale dentro i limiti
        P0 = max(min(demand/3*ones(3,1), ub'), lb');
        
        % vincolo di uguaglianza: somma P = Pe
        Aeq = [1 1 1];  beq = demand;
        
        % risolvi
        [P_opt,fval,exitflag] = fmincon(cost_fun,P0,[],[],Aeq,beq,lb',ub',[],options);
        
        if exitflag>0 && fval < best_cost
            best_cost = fval;
            P_best    = P_opt;
            u_best    = u';
        end
    end
    
    % salva la migliore (se trovata)
    if isfinite(best_cost)
        P_all(:,k)   = P_best;
        cost_all(k)  = best_cost;
        u_all(:,k)   = u_best;   % commenta se non serve
    else
        warning('Nessuna combinazione fattibile per Pe = %g', demand);
    end
end

disp('Potenza ottima per ciascun Pe (colonne):');
disp(P_all);

disp('Costo minimo per ciascun Pe:');
disp(cost_all);

disp('Generators state (1=ON, 0=OFF) for Pe:');
disp(u_all);


%% --- Plot 1: Total cost vs Pe ---
figure;
plot(Pe, cost_all, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Total power demand Pe [MW]');
ylabel('Total cost [€]');
title('Optimal cost vs total demand');
grid on;

%% --- Plot 2: Optimal power for each generator vs Pe ---
figure;
hold on;
plot(Pe, P_all(1,:), '-o', 'LineWidth', 2, 'DisplayName', 'Generator 1');
plot(Pe, P_all(2,:), '-s', 'LineWidth', 2, 'DisplayName', 'Generator 2');
plot(Pe, P_all(3,:), '-^', 'LineWidth', 2, 'DisplayName', 'Generator 3');
xlabel('Total power demand Pe [MW]');
ylabel('Optimal power output [MW]');
title('Optimal power distribution among generators');
legend('Location','northwest');
grid on;

%% --- Plot 3: ON/OFF status of generators (binary table style) ---
figure('Name', 'Power Output Table', 'Color', 'w');

% Color based on ON/OFF, text shows actual power
imagesc(Pe, 1:3, u_all);           % color = ON/OFF status
colormap(flipud(gray));           % black = ON, white = OFF

% Axis labels and title
xlabel('Total Power Demand Pe [MW]', 'FontWeight', 'bold');
ylabel('Generator', 'FontWeight', 'bold');
title('Power Output per Generator for each Pe', 'FontSize', 14, 'FontWeight', 'bold');

% Tick configuration
yticks(1:3);
yticklabels({'G1','G2','G3'});
xticks(Pe);
xticklabels(string(Pe));
colorbar('Ticks',[0 1], 'TickLabels',{'OFF','ON'});
grid on;

% Overlay power values in MW
for i = 1:3
    for j = 1:length(Pe)
        val = P_all(i,j);
        if ~isnan(val) && val > 0
            txt = sprintf('%.1f', val);
        else
            txt = 'OFF';
        end
        text(Pe(j), i, txt, ...
            'HorizontalAlignment','center', ...
            'VerticalAlignment','middle', ...
            'FontWeight','bold', ...
            'Color','r', ...
            'FontSize', 12);
    end
end

% Style cleanup
set(gca, 'TickLength', [0 0]);
axis tight;
ax = gca;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.LineWidth = 1.2;
