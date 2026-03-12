function solverName = select_yalmip_solver(preferredSolvers)
if ischar(preferredSolvers) || isstring(preferredSolvers)
    preferredSolvers = cellstr(preferredSolvers);
end

solverName = '';
for i = 1:numel(preferredSolvers)
    candidate = char(preferredSolvers{i});
    switch lower(candidate)
        case 'mosek'
            isAvailable = exist('mosekopt', 'file') ~= 0;
        case 'gurobi'
            isAvailable = exist('gurobi', 'file') ~= 0;
        case 'ipopt'
            isAvailable = exist('ipopt', 'file') ~= 0;
        otherwise
            isAvailable = exist(candidate, 'file') ~= 0;
    end

    if isAvailable
        solverName = candidate;
        return
    end
end
end
