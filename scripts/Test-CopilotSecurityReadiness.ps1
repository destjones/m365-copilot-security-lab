<#
.SYNOPSIS
    Performs a fictional Microsoft 365 Copilot security readiness assessment.

.DESCRIPTION
    This script is part of the M365 Copilot Security Lab.

    It evaluates fictional users against four lab-defined readiness checks:

    1. MFA enabled
    2. Copilot access enabled
    3. AI training completed
    4. Security review completed

    A fictional user who passes all four checks receives a lab status
    of READY.

    A fictional user who does not pass one or more checks receives
    a lab status of REVIEW REQUIRED.

    IMPORTANT:
    READY and REVIEW REQUIRED are fictional lab classifications.

    They are NOT official Microsoft:
    - Security assessments
    - Compliance determinations
    - Copilot readiness scores
    - Licensing determinations

    This script does NOT connect to:
    - Microsoft 365
    - Microsoft Graph
    - Microsoft Entra ID
    - Any production environment

    All data used by this script is fictional.

.NOTES
    Project: M365 Copilot Security Lab
    Lab: Copilot Security Readiness Lab
    Environment: Fictional / Non-Production
    Author: Destiny Jones
#>


# ============================================================================
# 1. CONFIGURATION
# ============================================================================

# $PSScriptRoot represents the folder where this PowerShell script
# is physically stored.
#
# This script lives inside:
#
# m365-copilot-security-lab\scripts
#
# Split-Path -Parent moves up one level so that $ProjectRoot points to:
#
# m365-copilot-security-lab
#
# This means the script will be able to locate the sample-data and reports
# folders even if PowerShell is launched from a different directory.

$ProjectRoot = Split-Path -Parent $PSScriptRoot


# Build the full path to the fictional Lab 02 dataset.

$CsvPath = Join-Path `
    $ProjectRoot `
    "sample-data\fictional-copilot-users.csv"


# Build the full path to the reports folder.

$ReportFolder = Join-Path `
    $ProjectRoot `
    "reports"


# Build the full path where the Lab 02 report will be saved.

$ReportPath = Join-Path `
    $ReportFolder `
    "copilot-readiness-report.csv"



# ============================================================================
# 2. START THE ASSESSMENT
# ============================================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "        COPILOT SECURITY READINESS ASSESSMENT" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "M365 Copilot Security Lab" -ForegroundColor White
Write-Host "Fictional / Non-Production Environment" -ForegroundColor DarkGray
Write-Host ""

Write-Host "Starting fictional Copilot security review..." -ForegroundColor Yellow
Write-Host ""



# ============================================================================
# 3. VERIFY THAT THE DATASET EXISTS
# ============================================================================

# Before attempting to import anything, make sure the fictional CSV
# actually exists.

if (-not (Test-Path -Path $CsvPath)) {

    Write-Host "ERROR: The fictional Copilot dataset could not be found." `
        -ForegroundColor Red

    Write-Host ""
    Write-Host "Expected location:" -ForegroundColor Yellow
    Write-Host $CsvPath
    Write-Host ""

    Write-Host "Assessment stopped." -ForegroundColor Red

    exit
}


Write-Host "Dataset located successfully." -ForegroundColor Green
Write-Host ""



# ============================================================================
# 4. IMPORT THE CSV
# ============================================================================

Write-Host "Loading fictional Copilot user data..." -ForegroundColor Cyan


# Import-Csv turns every row in the CSV into a PowerShell object.
#
# @() ensures $users behaves like an array even if the CSV only
# contains one fictional user.

$users = @(
    Import-Csv -Path $CsvPath
)


# Make sure the dataset actually contains records.

if ($users.Count -eq 0) {

    Write-Host "ERROR: The dataset does not contain any users." `
        -ForegroundColor Red

    Write-Host ""

    exit
}


Write-Host "Dataset successfully loaded." -ForegroundColor Green
Write-Host "Fictional users loaded: $($users.Count)"
Write-Host ""



# ============================================================================
# 5. VERIFY REQUIRED CSV COLUMNS
# ============================================================================

# Define exactly which columns Lab 02 expects to find.

$RequiredColumns = @(
    "DisplayName",
    "Department",
    "MFAEnabled",
    "CopilotAccess",
    "AITrainingComplete",
    "SecurityReview"
)


# Read the column names from the first imported record.

$ActualColumns = @(
    $users[0].PSObject.Properties.Name
)


# Compare our required fields against the actual CSV.

$MissingColumns = @(
    $RequiredColumns |
        Where-Object {
            $_ -notin $ActualColumns
        }
)


# Stop the lab if one or more required fields are missing.

if ($MissingColumns.Count -gt 0) {

    Write-Host "ERROR: Required CSV columns are missing." `
        -ForegroundColor Red

    Write-Host ""

    Write-Host "Missing column(s):" -ForegroundColor Yellow

    foreach ($column in $MissingColumns) {

        Write-Host "  - $column" -ForegroundColor Red

    }


    Write-Host ""
    Write-Host "Expected columns:" -ForegroundColor Yellow

    foreach ($column in $RequiredColumns) {

        Write-Host "  - $column"

    }


    Write-Host ""
    Write-Host "Assessment stopped." -ForegroundColor Red

    exit
}


Write-Host "Required CSV columns validated." -ForegroundColor Green
Write-Host ""



# ============================================================================
# 6. CREATE THE READINESS ASSESSMENT
# ============================================================================

Write-Host "Evaluating fictional readiness controls..." -ForegroundColor Cyan
Write-Host ""


# Process every fictional user individually.
#
# Each user's results are converted into a new custom PowerShell object.
# Those objects collectively become our readiness report.

$readinessReport = @(
    foreach ($user in $users) {


        # --------------------------------------------------------------------
        # CREATE AN EMPTY REVIEW-REASONS LIST
        # --------------------------------------------------------------------

        # Any readiness check that fails will add its name to this list.

        $ReviewReasons = @()



        # --------------------------------------------------------------------
        # MFA CHECK
        # --------------------------------------------------------------------

        if ($user.MFAEnabled -eq "True") {

            $MFAStatus = "PASS"

        }
        else {

            $MFAStatus = "REVIEW"

            $ReviewReasons += "MFA"

        }



        # --------------------------------------------------------------------
        # COPILOT ACCESS CHECK
        # --------------------------------------------------------------------

        if ($user.CopilotAccess -eq "True") {

            $CopilotAccessStatus = "PASS"

        }
        else {

            $CopilotAccessStatus = "REVIEW"

            $ReviewReasons += "Copilot Access"

        }



        # --------------------------------------------------------------------
        # AI TRAINING CHECK
        # --------------------------------------------------------------------

        if ($user.AITrainingComplete -eq "True") {

            $TrainingStatus = "PASS"

        }
        else {

            $TrainingStatus = "REVIEW"

            $ReviewReasons += "AI Training"

        }



        # --------------------------------------------------------------------
        # SECURITY REVIEW CHECK
        # --------------------------------------------------------------------

        if ($user.SecurityReview -eq "Complete") {

            $SecurityReviewStatus = "PASS"

        }
        else {

            $SecurityReviewStatus = "REVIEW"

            $ReviewReasons += "Security Review"

        }



        # --------------------------------------------------------------------
        # DETERMINE OVERALL LAB STATUS
        # --------------------------------------------------------------------

        # If there are zero review reasons, this fictional user has
        # passed every criterion used by this lab.

        if ($ReviewReasons.Count -eq 0) {

            $OverallStatus = "READY"

            $ReviewReasonText = "None"

        }
        else {

            $OverallStatus = "REVIEW REQUIRED"


            # Convert the array into a readable string.
            #
            # Example:
            #
            # MFA; AI Training; Security Review

            $ReviewReasonText = $ReviewReasons -join "; "

        }



        # --------------------------------------------------------------------
        # CREATE REPORT RECORD
        # --------------------------------------------------------------------

        # PSCustomObject lets us build our own structured result.
        #
        # This is what will ultimately be exported into the final CSV.

        [PSCustomObject]@{

            DisplayName          = $user.DisplayName
            Department           = $user.Department
            MFAStatus            = $MFAStatus
            CopilotAccessStatus  = $CopilotAccessStatus
            TrainingStatus       = $TrainingStatus
            SecurityReviewStatus = $SecurityReviewStatus
            OverallStatus        = $OverallStatus
            ReviewReasons        = $ReviewReasonText

        }

    }
)


Write-Host "Fictional readiness evaluation complete." -ForegroundColor Green
Write-Host ""



# ============================================================================
# 7. CALCULATE ENVIRONMENT TOTALS
# ============================================================================

# Count all assessed fictional users.

$totalUsers = $readinessReport.Count


# Create a collection containing only READY users.

$readyUsers = @(
    $readinessReport |
        Where-Object {
            $_.OverallStatus -eq "READY"
        }
)


# Create a collection containing users requiring review.

$reviewUsers = @(
    $readinessReport |
        Where-Object {
            $_.OverallStatus -eq "REVIEW REQUIRED"
        }
)


# Count each collection.

$totalReady = $readyUsers.Count
$totalReview = $reviewUsers.Count



# ============================================================================
# 8. CALCULATE READINESS PERCENTAGE
# ============================================================================

# First make sure there is at least one user.
#
# This protects the calculation from division-by-zero errors.

if ($totalUsers -gt 0) {

    $readinessPercentage = ($totalReady / $totalUsers) * 100


    # Format the percentage to two decimal places.
    #
    # We're deliberately using the same approach that worked successfully
    # in Lab 01.

    $readinessPercentage = "{0:N2}" -f $readinessPercentage

}
else {

    $readinessPercentage = "0.00"

}



# ============================================================================
# 9. DISPLAY OVERALL SUMMARY
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "LAB READINESS SUMMARY" -ForegroundColor Cyan
Write-Host "------------------------------------------------------------"
Write-Host ""

Write-Host "Total fictional users:   $totalUsers"

Write-Host "Ready:                    $totalReady" `
    -ForegroundColor Green

Write-Host "Review required:          $totalReview" `
    -ForegroundColor Yellow

Write-Host "Lab readiness:            $readinessPercentage%"

Write-Host ""



# ============================================================================
# 10. DISPLAY READY USERS
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "READY USERS" -ForegroundColor Green
Write-Host "------------------------------------------------------------"
Write-Host ""


if ($totalReady -gt 0) {

    $readyUsers |
        Select-Object `
            DisplayName,
            Department,
            OverallStatus |
        Format-Table -AutoSize

}
else {

    Write-Host "No fictional users currently meet all lab criteria." `
        -ForegroundColor Yellow

}


Write-Host ""



# ============================================================================
# 11. DISPLAY USERS REQUIRING REVIEW
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "USERS REQUIRING REVIEW" -ForegroundColor Yellow
Write-Host "------------------------------------------------------------"
Write-Host ""


if ($totalReview -gt 0) {

    $reviewUsers |
        Select-Object `
            DisplayName,
            Department,
            ReviewReasons |
        Format-Table -AutoSize

}
else {

    Write-Host "No fictional users require review." `
        -ForegroundColor Green

}


Write-Host ""



# ============================================================================
# 12. COUNT REVIEW CATEGORIES
# ============================================================================

# Count how many users require MFA review.

$mfaReviewCount = @(
    $readinessReport |
        Where-Object {
            $_.MFAStatus -eq "REVIEW"
        }
).Count


# Count how many users require Copilot access review.

$copilotAccessReviewCount = @(
    $readinessReport |
        Where-Object {
            $_.CopilotAccessStatus -eq "REVIEW"
        }
).Count


# Count how many users require AI training review.

$trainingReviewCount = @(
    $readinessReport |
        Where-Object {
            $_.TrainingStatus -eq "REVIEW"
        }
).Count


# Count how many users have an incomplete security review.

$securityReviewCount = @(
    $readinessReport |
        Where-Object {
            $_.SecurityReviewStatus -eq "REVIEW"
        }
).Count



# ============================================================================
# 13. DISPLAY REVIEW CATEGORY SUMMARY
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "REVIEW CATEGORY SUMMARY" -ForegroundColor Cyan
Write-Host "------------------------------------------------------------"
Write-Host ""

Write-Host "MFA review required:              $mfaReviewCount"
Write-Host "Copilot access review required:   $copilotAccessReviewCount"
Write-Host "AI training review required:      $trainingReviewCount"
Write-Host "Security review required:         $securityReviewCount"

Write-Host ""



# ============================================================================
# 14. DISPLAY READINESS BY DEPARTMENT
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "READINESS BY DEPARTMENT" -ForegroundColor Cyan
Write-Host "------------------------------------------------------------"
Write-Host ""


# Group the completed assessment records by department.

$departmentSummary = @(
    $readinessReport |
        Group-Object Department |
        Sort-Object Name
)


foreach ($department in $departmentSummary) {


    # Count READY users in this specific department.

    $departmentReady = @(
        $department.Group |
            Where-Object {
                $_.OverallStatus -eq "READY"
            }
    ).Count


    # Count users requiring review in this department.

    $departmentReview = @(
        $department.Group |
            Where-Object {
                $_.OverallStatus -eq "REVIEW REQUIRED"
            }
    ).Count


    Write-Host "$($department.Name)" -ForegroundColor White

    Write-Host "  Total:            $($department.Count)"
    Write-Host "  Ready:            $departmentReady"
    Write-Host "  Review Required:  $departmentReview"

    Write-Host ""

}



# ============================================================================
# 15. DETERMINE OVERALL LAB RESULT
# ============================================================================

# Our fictional lab only receives ALL USERS READY when every fictional
# user passes every control included in this exercise.

if ($totalReview -eq 0) {

    $LabStatus = "ALL USERS READY"

}
else {

    $LabStatus = "REVIEW REQUIRED"

}



# ============================================================================
# 16. CREATE REPORT DIRECTORY
# ============================================================================

# The report is supposed to live inside the main project's reports folder.
#
# If that folder is missing, create it automatically.

if (-not (Test-Path -Path $ReportFolder)) {

    Write-Host "Reports directory does not exist." -ForegroundColor Yellow
    Write-Host "Creating reports directory..." -ForegroundColor Cyan


    try {

        New-Item `
            -ItemType Directory `
            -Path $ReportFolder `
            -Force `
            -ErrorAction Stop |
            Out-Null


        Write-Host "Reports directory created successfully." `
            -ForegroundColor Green

        Write-Host ""

    }
    catch {

        Write-Host ""
        Write-Host "ERROR: The reports directory could not be created." `
            -ForegroundColor Red

        Write-Host $_.Exception.Message
        Write-Host ""

        exit
    }

}



# ============================================================================
# 17. EXPORT AND VERIFY REPORT
# ============================================================================

Write-Host "------------------------------------------------------------"
Write-Host "REPORT GENERATION" -ForegroundColor Cyan
Write-Host "------------------------------------------------------------"
Write-Host ""

Write-Host "Creating Copilot readiness report..." -ForegroundColor Cyan
Write-Host ""


try {

    # Export the completed readiness objects to CSV.

    $readinessReport |
        Export-Csv `
            -Path $ReportPath `
            -NoTypeInformation `
            -Encoding UTF8 `
            -Force `
            -ErrorAction Stop


    # Do not simply assume Export-Csv succeeded.
    # Test that the expected file now exists.

    if (Test-Path -Path $ReportPath) {

        Write-Host "Report successfully created." `
            -ForegroundColor Green

        Write-Host ""

        Write-Host "Report location:" `
            -ForegroundColor Cyan

        Write-Host $ReportPath
        Write-Host ""

    }
    else {

        Write-Host "ERROR: Export completed but the report file could not be verified." `
            -ForegroundColor Red

        Write-Host ""
        Write-Host "Expected report location:" `
            -ForegroundColor Yellow

        Write-Host $ReportPath
        Write-Host ""

        exit

    }

}
catch {

    Write-Host ""
    Write-Host "ERROR: The readiness report could not be created." `
        -ForegroundColor Red

    Write-Host ""
    Write-Host "PowerShell error:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message

    Write-Host ""
    Write-Host "Expected report location:" -ForegroundColor Yellow
    Write-Host $ReportPath

    Write-Host ""

    exit

}



# ============================================================================
# 18. DISPLAY COMPLETION SUMMARY
# ============================================================================

Write-Host "============================================================" `
    -ForegroundColor Cyan

Write-Host "                 READINESS LAB COMPLETE" `
    -ForegroundColor Green

Write-Host "============================================================" `
    -ForegroundColor Cyan

Write-Host ""

Write-Host "Overall Lab Status:  $LabStatus"
Write-Host "Lab Readiness:       $readinessPercentage%"
Write-Host "Users Assessed:      $totalUsers"
Write-Host "Users Ready:         $totalReady"
Write-Host "Users for Review:    $totalReview"

Write-Host ""

Write-Host "Generated Report:" -ForegroundColor Cyan
Write-Host $ReportPath

Write-Host ""

Write-Host "IMPORTANT:" -ForegroundColor Yellow
Write-Host "READY and REVIEW REQUIRED are fictional lab classifications."
Write-Host "They are not official Microsoft Copilot security, compliance,"
Write-Host "licensing, or readiness determinations."

Write-Host ""

Write-Host "Lab completed successfully." -ForegroundColor Green
Write-Host ""