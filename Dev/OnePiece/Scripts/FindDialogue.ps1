Get-ChildItem -Recurse -File | Select-String -Pattern "dialogue" | Select-Object -ExpandProperty Path

# Define the path to search in (assume running from Stardew dir)
$searchPath = Join-Path -Path (Get-Location) -ChildPath "\Content (unpacked)"

# Create the destination directory Results if it doesn't exist
$destinationDir = Join-Path -Path (Get-Location) -ChildPath "\Mods\OnePiece\Scripts\Results"

if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir
}

# Loop through files containing the word "Harvey" in their names and copy them to the Results directory
Get-ChildItem -Path $searchPath -Filter "*Harvey*" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $destinationDir
}