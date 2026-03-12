script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

defaultMosekRoot = fullfile('C:\', 'Program Files', 'Mosek');
if exist(defaultMosekRoot, 'dir')
    mosekFolders = dir(defaultMosekRoot);
    for iFolder = 1:numel(mosekFolders)
        if ~mosekFolders(iFolder).isdir || any(strcmp(mosekFolders(iFolder).name, {'.', '..'}))
            continue
        end

        toolboxCandidates = {
            fullfile(defaultMosekRoot, mosekFolders(iFolder).name, 'toolbox', 'r2019b')
            fullfile(defaultMosekRoot, mosekFolders(iFolder).name, 'toolbox', 'r2019bom')
        };

        for iCandidate = 1:numel(toolboxCandidates)
            if exist(toolboxCandidates{iCandidate}, 'dir')
                addpath(toolboxCandidates{iCandidate});
                break
            end
        end
    end
end

matpower_dirs = {
    fullfile(project_root, "external", "matpower", "lib")
    fullfile(project_root, "external", "matpower", "mips", "lib")
    fullfile(project_root, "external", "matpower", "most", "lib")
    fullfile(project_root, "external", "matpower", "mptest", "lib")
};

for i = 1:numel(matpower_dirs)
    if exist(matpower_dirs{i}, "dir")
        addpath(matpower_dirs{i});
    end
end

addpath(genpath(fullfile(project_root, "src")));
addpath(script_dir);
