#List of filenames to be moved
$file_list = Get-Content D:\ListofFiles.txt

#Source Folder
$search_folder = "D:\source"

#Destination Folder
$destination_folder = "D:\destination"

foreach ($file in $file_list) {
    $file_to_move = Get-ChildItem -Path $search_folder -Filter $file -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName}
    if ($file_to_move) {
        Move-Item $file_to_move $destination_folder
    }
}