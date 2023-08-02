function newFolderPath = createNewDirectory(originalPath, newFolderName)
    % Remove the last directory from the originalPath
    parentPath = fileparts(originalPath);
    
    % Create a new folder in the modified path
    newFolderPath = fullfile(parentPath, newFolderName);
    
    % Check if the directory already exists
    while exist(newFolderPath, 'dir') == 7
        disp('This directory already exists. Please select a new name:');
        newFolderName = input('', 's');
        newFolderPath = fullfile(parentPath, newFolderName);
    end
    
    % Create the new folder
    mkdir(newFolderPath);
end
