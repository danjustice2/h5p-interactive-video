# H5P Interactive Video Package Script
# This script creates an H5P package from the project files

# Error handling
$ErrorActionPreference = "Stop"

try {
    # Clean up from last time if directory exists
    if (Test-Path "temp-h5p-package") {
        Remove-Item "temp-h5p-package" -Recurse -Force
        Write-Host "Cleaned up previous temp directory" -ForegroundColor Green
    }

    # Create a temporary folder for the package
    New-Item -ItemType Directory -Name "temp-h5p-package" | Out-Null
    Set-Location "temp-h5p-package"
    Write-Host "Created temporary package directory" -ForegroundColor Green

    # Copy the main H5P library files to root of package
    Copy-Item "..\library.json" .
    Copy-Item "..\semantics.json" .
    Copy-Item "..\presave.js" .
    Copy-Item "..\upgrades.js" .
    Copy-Item "..\icon.svg" .
    Write-Host "Copied core library files" -ForegroundColor Green

    # Copy directories for the library
    Copy-Item "..\dist" -Destination "dist" -Recurse
    Copy-Item "..\language" -Destination "language" -Recurse
    Write-Host "Copied library directories" -ForegroundColor Green

    # Copy H5P package metadata (required for H5P packages)
    Copy-Item "..\h5p.json" .
    Write-Host "Copied h5p.json metadata" -ForegroundColor Green

    # Copy content directory (required for H5P packages)
    Copy-Item "..\content" -Destination "content" -Recurse
    Write-Host "Copied content directory" -ForegroundColor Green# Create the ZIP file first (H5P files are just renamed ZIP files)
    $zipFile = "..\h5p-interactive-video-enhanced.zip"
    $h5pFile = "..\h5p-interactive-video-enhanced.h5p"
    
    Compress-Archive -Path * -DestinationPath $zipFile -Force
    Write-Host "Created ZIP archive" -ForegroundColor Green
    
    # Go back to parent directory to handle file operations
    Set-Location ".."
    
    # Remove existing H5P file if it exists
    if (Test-Path "h5p-interactive-video-enhanced.h5p") {
        Remove-Item "h5p-interactive-video-enhanced.h5p" -Force
    }
    
    # Copy and rename ZIP to H5P
    Copy-Item "h5p-interactive-video-enhanced.zip" "h5p-interactive-video-enhanced.h5p"
    Remove-Item "h5p-interactive-video-enhanced.zip" -Force
    Write-Host "Created H5P package: h5p-interactive-video-enhanced.h5p" -ForegroundColor Green    # Clean up temp directory
    Remove-Item "temp-h5p-package" -Recurse -Force
    Write-Host "Cleanup completed" -ForegroundColor Green

    Write-Host "Package creation completed successfully!" -ForegroundColor Yellow
}
catch {
    Write-Host "Error occurred during package creation:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    
    # Ensure we're back in the original directory
    if (Get-Location | Select-Object -ExpandProperty Path | Select-String "temp-h5p-package") {
        Set-Location ".."
    }
    
    # Clean up temp directory if it exists
    if (Test-Path "temp-h5p-package") {
        Remove-Item "temp-h5p-package" -Recurse -Force
        Write-Host "Cleaned up temp directory after error" -ForegroundColor Yellow
    }
    
    exit 1
}
