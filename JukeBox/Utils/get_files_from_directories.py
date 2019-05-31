from PyQt4 import QtCore, QtGui
import os
import sys
import shutil

# Function for getting files from a folder
def fetchFiles(pathToFolder, flag, keyWord):
    '''	fetchFiles() requires three arguments: pathToFolder, flag and keyWord

    flag must be 'STARTS_WITH' or 'ENDS_WITH'
    keyWord is a string to search the file's name

    Be careful, the keyWord is case sensitive and must be exact

    Example: fetchFiles('/Documents/Photos/','ENDS_WITH','.jpg')

    returns: _pathToFiles and _fileNames '''

    _pathToFiles = []
    _fileNames = []

    for dirPath, dirNames, fileNames in os.walk(pathToFolder):
        if flag == 'ENDS_WITH':
            selected_path = [os.path.join(dirPath, item) for item in fileNames if item.endswith(keyWord)]
            _pathToFiles.extend(selected_path)

            selectedFile = [item for item in fileNames if item.endswith(keyWord)]
            _fileNames.extend(selectedFile)

        elif flag == 'STARTS_WITH':
            selected_path = [os.path.join(dirPath, item) for item in fileNames if item.startswith(keyWord)]
            _pathToFiles.extend(selected_path)

            selectedFile = [item for item in fileNames if item.startswith(keyWord)]
            _fileNames.extend(selectedFile)

        else:
            print
            fetchFiles.__doc__
            break

        # Try to remove empty entries if none of the required files are in directory
        try:
            _pathToFiles.remove('')
            _imageFiles.remove('')
        except ValueError:
            pass

        # Warn if nothing was found in the given path
        if selectedFile == []:
            print
            'No files with given parameters were found in:\n', dirPath, '\n'

    print
    len(_fileNames), 'files were found is searched folder(s)'

    return _pathToFiles, _fileNames


def browse_for_file(recent_path):
    file_path = QtGui.QFileDialog.getOpenFileName(None, "Select File", recent_path)
    return file_path

def make_sure_folder_exists(folder_path):
    folder_parts = folder_path.split("\\")
    folder_to_check = folder_parts[0] + "\\" + folder_parts[1]
    i = 1
    while i < len(folder_parts) - 1:
        if not os.path.exists(folder_to_check):
            os.makedirs(folder_to_check)
        i += 1
        folder_to_check = folder_to_check + "\\" + folder_parts[i]

def copy_single_folder_to_tree(folder_path, tree_root_path):
    print("copying files from folder " + folder_path + "to tree root " + tree_root_path)
    path_to_Files, filenames = fetchFiles(folder_path, 'ENDS_WITH', "wav")
    for file_path in path_to_Files:
        destination_path = file_path.replace(folder_path, tree_root_path).replace("__","\\")
        make_sure_folder_exists(destination_path)

        shutil.copy(file_path, destination_path)



def copy_tree_to_single_foler(tree_path, folder_path):
    print("copying tree content from" + tree_path + " to folder " + folder_path)
    path_to_Files, filenames = fetchFiles(tree_path, 'ENDS_WITH', "wav")
    for file_path in path_to_Files:
        if not ("-15db.wav" in file_path or "-27db.wav" in file_path or "_9db.wav" in file_path):
            filename = file_path.replace(tree_path,"").replace("\\","__").replace("____","__")

            shutil.copy(file_path, folder_path + "\\" + filename)


def rename_files_in_folder(folder_paths):
    print("Renameing files")
    i=0
    for folder_path in folder_paths:
        path_parts = folder_path.split("\\")
        filename = path_parts[len(path_parts)-1]
        newfilename = filename.replace("23LUFS-RMS","-23LUFS-EBU")
        os.rename(folder_path, folder_path.replace(filename, newfilename))
        # length_of_file = len(filename)
        # if length_of_file > 9:
        #     newfilename = "Alexa_" + str(i) + ".wav" # filename[length_of_file - 9:]
        #     os.rename(folder_path,folder_path.replace(filename,newfilename))
        i += 1
    print("Found " + str(i) +" files")


def multiply_lines(source_list,multiply_tims):
    results = []
    f = open(source_list, 'rb')
    lines = f.readlines()
    f.close()
    for line in lines:
        if line != "":
            i=0
            while i < int(multiply_tims):
                results.append(line.strip("\r\n"))
                i+=1
    path_length = len(source_list)
    result_file_path = source_list[0:path_length-4] + "_X4_" + source_list[path_length-4:]
    if not os.path.exists(result_file_path):
        f = open(result_file_path, 'w+')
        #f.write("\n".join(results))
        f.writelines(["%s\n" % result for result in results])
        f.close()
    else:
        print("Destination File exists: " + result_file_path)


def main():
    if len(sys.argv) > 2:
        # copy_single_folder_to_tree(sys.argv[1],sys.argv[2])
        # copy_tree_to_single_foler(sys.argv[1],sys.argv[2])
        multiply_lines(sys.argv[1],sys.argv[2])
    elif len(sys.argv) > 1:
        path_to_Files, filenames= fetchFiles(sys.argv[1],'ENDS_WITH',"wav")
        rename_files_in_folder(path_to_Files)
    else:
        print("NO PRAMETERS GIVEN")


#
#
if __name__ == "__main__":
	main()


