<#
.SYNOPSIS
    Performs an MFA security audit against fictional user data.

.DESCRIPTION
    This script is part of the M365 Copilot Security Lab.

    It reads fictional Microsoft 365 user information from a CSV file,
    analyzes MFA adoption, identifies accounts that require review,
    summarizes results by department, and exports a security report.

    This script does NOT connect to Microsoft 365, Microsoft Graph,
    Entra ID, or any production environment.

    All information used by this script is fictional lab data.

.NOTES
    Project: M365 Copilot Security Lab
    Purpose: PowerShell and identity security learning
#>


# ============================================================================
# CONFIGURATION
# ============================================================================
# These variables define where the fictional dataset is located
# and where the finished security report will be saved.

$CsvPath = ".\sample-data\fictional-users.csv"
$ReportFolder = ".\reports"
$ReportPath = "$ReportFolder\mfa-audit-report.csv"


# ============================================================================
# START AUDIT
# ============================================================================

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "       M365 IDENTITY SECURITY AUDIT" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Starting MFA security review..." -ForegroundColor Yellow
Write-Host ""


# ============================================================================
# VALIDATE DATASET
# ============================================================================
# Before trying to analyze anything, Test-Path checks whether the
# fictional CSV actually exists.
#
# If the file cannot be found, the script stops instead of continuing
# and producing additional errors.

if (-not (Test-Path $CsvPath)) {

    Write-Host "ERROR: Fictional user dataset could not be found." -ForegroundColor Red
    Write-Host ""
    Write-Host "Expected location:" -ForegroundColor Yellow
    Write-Host $CsvPath
    Write-Host ""

    exit
}


# ============================================================================
# IMPORT USER DATA
# ============================================================================
# Import-Csv reads each row of the CSV and converts it into a PowerShell
# object. The collection of users is stored in the $users variable.

Write-Host "Loading fictional user data..." -ForegroundColor Cyan

$users = Import-Csv $CsvPath

Write-Host "Dataset successfully loaded." -ForegroundColor Green
Write-Host ""


# Make sure the CSV actually contains records.

if ($users.Count -eq 0) {

    Write-Host "ERROR: No users were found in the CSV." -ForegroundColor Red
    exit
}


# ============================================================================
# ANALYZE MFA STATUS
# ============================================================================
# First count the total number of fictional users.

$totalUsers = $users.Count


# Where-Object filters the dataset.
# This collection contains users whose MFAEnabled value is True.

$mfaEnabledUsers = @(
    $users | Where-Object {
        $_.MFAEnabled -eq "True"
    }
)


# Create another collection containing users without MFA.

$mfaDisabledUsers = @(
    $users | Where-Object {
        $_.MFAEnabled -eq "False"
    }
)


# Count both groups.

$totalEnabled = $mfaEnabledUsers.Count
$totalDisabled = $mfaDisabledUsers.Count


# ============================================================================
# CALCULATE MFA ADOPTION
# ============================================================================
# Calculate the percentage of fictional users who have MFA enabled.
#
# The formatting operation displays the percentage using two decimal places.
#
# The check for users greater than zero prevents division by zero.

if ($totalUsers -gt 0) {

    $mfaPercentage = ($totalEnabled / $totalUsers) * 100
    $mfaPercentage = "{0:N2}" -f $mfaPercentage

}
else {

    $mfaPercentage = "0.00"

}


# ============================================================================
# SECURITY SUMMARY
# ============================================================================

Write-Host "---------------------------------------------"
Write-Host "SECURITY SUMMARY" -ForegroundColor Cyan
Write-Host "---------------------------------------------"

Write-Host "Total fictional users:     $totalUsers"
Write-Host "MFA enabled:                $totalEnabled" -ForegroundColor Green
Write-Host "MFA review required:        $totalDisabled" -ForegroundColor Red
Write-Host "MFA adoption:               $mfaPercentage%"
Write-Host ""


# ============================================================================
# DETERMINE LAB STATUS
# ============================================================================
# This is a simple LAB assessment and is not an official Microsoft
# security or compliance determination.

if ($totalDisabled -eq 0) {

    $SecurityStatus = "PASS"

    Write-Host "LAB STATUS: $SecurityStatus" -ForegroundColor Green
    Write-Host "All fictional users have MFA enabled." -ForegroundColor Green

}
else {

    $SecurityStatus = "REVIEW REQUIRED"

    Write-Host "LAB STATUS: $SecurityStatus" -ForegroundColor Yellow
    Write-Host "$totalDisabled fictional account(s) require MFA review." -ForegroundColor Yellow

}

Write-Host ""


# ============================================================================
# DISPLAY ACCOUNTS REQUIRING REVIEW
# ============================================================================

Write-Host "---------------------------------------------"
Write-Host "USERS REQUIRING MFA REVIEW" -ForegroundColor Cyan
Write-Host "---------------------------------------------"
Write-Host ""

if ($totalDisabled -gt 0) {

    $mfaDisabledUsers |
        Select-Object DisplayName, Department, License, MFAEnabled |
        Format-Table -AutoSize

}
else {

    Write-Host "No users require review." -ForegroundColor Green

}


# ============================================================================
# DEPARTMENT SUMMARY
# ============================================================================
# Group-Object groups user records based on their Department value.
# This gives us a basic breakdown of the fictional environment.

Write-Host ""
Write-Host "---------------------------------------------"
Write-Host "DEPARTMENT SUMMARY" -ForegroundColor Cyan
Write-Host "---------------------------------------------"
Write-Host ""

$departmentSummary = $users |
    Group-Object Department |
    Sort-Object Name


foreach ($department in $departmentSummary) {

    Write-Host "$($department.Name): $($department.Count) fictional user(s)"

}


# ============================================================================
# MFA REVIEW BY DEPARTMENT
# ============================================================================
# Instead of grouping every user, this section only groups accounts
# that do not have MFA enabled.

Write-Host ""
Write-Host "---------------------------------------------"
Write-Host "MFA REVIEW BY DEPARTMENT" -ForegroundColor Cyan
Write-Host "---------------------------------------------"
Write-Host ""

if ($totalDisabled -gt 0) {

    $mfaDisabledUsers |
        Group-Object Department |
        Sort-Object Count -Descending |
        Select-Object @{
            Name = "Department"
            Expression = { $_.Name }
        },
        @{
            Name = "UsersRequiringReview"
            Expression = { $_.Count }
        } |
        Format-Table -AutoSize

}
else {

    Write-Host "No departments require MFA review." -ForegroundColor Green

}


# ============================================================================
# PREPARE REPORT FOLDER
# ============================================================================
# If the reports folder does not already exist, PowerShell creates it.

if (-not (Test-Path $ReportFolder)) {

    New-Item `
        -ItemType Directory `
        -Path $ReportFolder |
        Out-Null

    Write-Host ""
    Write-Host "Created report directory: $ReportFolder" -ForegroundColor Cyan

}


# ============================================================================
# BUILD SECURITY REPORT
# ============================================================================
# Create a new PowerShell object for each fictional user.
#
# The exported report includes the original user information plus a new
# ReviewStatus value generated by the script.

$securityReport = foreach ($user in $users) {

    if ($user.MFAEnabled -eq "True") {

        $ReviewStatus = "No Review Required"

    }
    else {

        $ReviewStatus = "MFA Review Required"

    }


    [PSCustomObject]@{

        DisplayName  = $user.DisplayName
        Department   = $user.Department
        License      = $user.License
        MFAEnabled   = $user.MFAEnabled
        ReviewStatus = $ReviewStatus

    }

}


# ============================================================================
# EXPORT SECURITY REPORT
# ============================================================================
# Export-Csv writes the newly created security report to another CSV.
#
# -NoTypeInformation prevents PowerShell type metadata from being added
# to the exported file.

$securityReport |
    Export-Csv `
        -Path $ReportPath `
        -NoTypeInformation


# ============================================================================
# AUDIT COMPLETE
# ============================================================================

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "              AUDIT COMPLETE" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Security Status: $SecurityStatus"
Write-Host "MFA Adoption:    $mfaPercentage%"
Write-Host ""
Write-Host "Report exported to:" -ForegroundColor Cyan
Write-Host $ReportPath
Write-Host ""
