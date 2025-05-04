# This script automates the installation of selected software system-wide using winget.

# Definition of the applications to be installed in a clear list.
$applicationsToInstall = @(
    "Discord.Discord"      # Discord - Popular communication platform
    "Spotify.Spotify"      # Spotify - Music and podcast streaming service
    "OBSProject.OBSStudio" # OBS Studio - Software for screen recording and streaming
    "Ghisler.TotalCommander" # Total Commander - Powerful file manager
    "TeamViewer.TeamViewer"  # TeamViewer - Software for remote maintenance and access
    "Valve.Steam"          # Steam - Digital distribution platform for PC games
    "KeePassXCTeam.KeePassXC" # KeePassXC - Free password manager
)

# Loop through the list of applications.
foreach ($appId in $applicationsToInstall) {
    # Output indicating which application is about to be installed.
    Write-Host "Starting the installation of '$appId'..."

    # winget command to install the current application:
    # - install: Command to install an application.
    # --id:     Specifies the unique ID of the application.
    # -e:       Ensures that only an exact match of the ID is installed.
    # -h:       Performs a silent installation (no user interface).
    # --scope "machine": Installs the application system-wide (for all users).
    winget install --id="$appId" -e -h --scope "machine"

    # Check the exit code of the previous command.
    if ($LASTEXITCODE -eq 0) {
        # If the exit code is 0, the installation was successful.
        Write-Host "'$appId' was installed successfully."
    } else {
        # Otherwise, an error occurred.
        Write-Warning "The installation of '$appId' failed. Check for any error messages."
    }

    # A short pause to make the output more readable (optional).
    Start-Sleep -Seconds 2
}

# Final message indicating that all installation attempts have been completed.
Write-Host "All installation operations have been completed."
