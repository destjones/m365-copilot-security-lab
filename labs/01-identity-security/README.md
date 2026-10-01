# Lab 01: Identity Security Foundation

## Objective

This lab demonstrates how PowerShell can be used to analyze
fictional Microsoft 365 identity data and identify accounts
that require MFA review.

## Connection to Microsoft Copilot Security

Microsoft Copilot honors Microsoft Entra Conditional Access
policies and multifactor authentication (MFA).

Because Copilot relies on the authenticated user's identity
and existing Microsoft 365 access controls, identity security
is part of the broader security foundation surrounding a
Copilot deployment.

This lab focuses specifically on the MFA component of that
security foundation.

## Lab Environment

This lab uses fictional data only.

It does not connect to:
- A production Microsoft 365 tenant
- Microsoft Graph
- Microsoft Entra ID
- Employer systems

## Files

- `Get-MFAStatus.ps1` - analyzes fictional MFA data
- `fictional-users.csv` - fictional source dataset
- `mfa-audit-report.csv` - generated audit results

## What the Script Does

1. Imports fictional user data from CSV.
2. Identifies users with and without MFA.
3. Calculates MFA adoption percentage.
4. Groups results by department.
5. Flags fictional accounts requiring review.
6. Generates a CSV security report.

## PowerShell Concepts Practiced

- Variables
- Import-Csv
- Test-Path
- Where-Object
- If/Else conditions
- Foreach loops
- Group-Object
- PSCustomObject
- Export-Csv

## Disclaimer

The "PASS" and "REVIEW REQUIRED" statuses used in this lab
are fictional lab classifications and should not be interpreted
as official Microsoft security, compliance, or Copilot
readiness assessments.
