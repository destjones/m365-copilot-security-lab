# Lab 02: Copilot Security Readiness Assessment

## Overview

This lab demonstrates how PowerShell can evaluate fictional users against a set of lab-defined Microsoft 365 Copilot security and governance readiness criteria.

The assessment combines identity security, Copilot access, user training, and security review information into a structured readiness report.

All users, departments, configurations, and results used in this lab are fictional.

> **Important**
>
> `READY` and `REVIEW REQUIRED` are fictional classifications created specifically for this educational lab. They are not official Microsoft security, compliance, licensing, or Copilot-readiness determinations.

---

## Objective

The objective of this lab is to build a PowerShell-based readiness assessment that:

1. Imports fictional user information from a CSV file.
2. Validates that the required data is present.
3. Evaluates multiple readiness checks for each user.
4. Identifies the specific reasons a user requires review.
5. Calculates an overall fictional readiness percentage.
6. Summarizes results by department and review category.
7. Exports the completed assessment to a CSV report.

---

## Lab Scenario

A fictional organization is preparing a group of users for Microsoft 365 Copilot.

Before completing the fictional rollout, the organization wants to review four conditions:

- Is MFA enabled?
- Does the user have Copilot access?
- Has the user completed AI training?
- Has the user's security review been completed?

PowerShell is used to evaluate the fictional dataset and generate a repeatable readiness report.

---

## Readiness Criteria

This lab uses four fictional readiness checks.

### 1. MFA Enabled

The user's `MFAEnabled` value must be:

```text
True
```

This represents the identity-security portion of the lab.

### 2. Copilot Access

The user's `CopilotAccess` value must be:

```text
True
```

For this lab, this field indicates whether the fictional user has the Copilot access being evaluated.

It is not intended to represent a complete real-world Microsoft licensing assessment.

### 3. AI Training Completed

The user's `AITrainingComplete` value must be:

```text
True
```

This is a lab-defined governance and adoption requirement.

It represents completion of fictional training covering responsible AI use, data handling, security awareness, and human review.

### 4. Security Review Completed

The user's `SecurityReview` value must be:

```text
Complete
```

This is another lab-defined governance requirement.

It represents completion of a fictional security-readiness review before broader Copilot adoption.

---

## Overall Status Logic

A fictional user receives a status of `READY` only when all four checks pass:

```text
MFAEnabled = True
        AND
CopilotAccess = True
        AND
AITrainingComplete = True
        AND
SecurityReview = Complete
        ↓
READY
```

If one or more checks do not pass, the user receives:

```text
REVIEW REQUIRED
```

The script also records the checks requiring review.

Example:

```text
MFA; AI Training; Security Review
```

This makes the output more useful than a simple pass-or-fail result because it explains why the fictional user requires additional review.

---

## Lab Files

### Input

```text
sample-data/fictional-copilot-users.csv
```

The input file contains fictional user and readiness information.

### Processing

```text
scripts/Test-CopilotSecurityReadiness.ps1
```

The PowerShell script validates the dataset, evaluates each fictional user, calculates summary information, and exports the final report.

### Output

```text
reports/copilot-readiness-report.csv
```

The generated report contains the assessment results for each fictional user.

---

## Dataset Structure

The fictional dataset uses the following columns:

| Column | Purpose |
|---|---|
| `DisplayName` | Fictional user's display name |
| `Department` | Fictional department |
| `MFAEnabled` | Indicates whether MFA is enabled |
| `CopilotAccess` | Indicates whether the fictional user has the Copilot access being reviewed |
| `AITrainingComplete` | Indicates whether fictional AI training is complete |
| `SecurityReview` | Indicates whether the fictional security review is complete |

Example:

```csv
DisplayName,Department,MFAEnabled,CopilotAccess,AITrainingComplete,SecurityReview
Alex Carter,Accounting,True,True,True,Complete
Jordan Lee,Operations,True,True,False,Complete
Casey Rivera,HR,False,True,True,Pending
Taylor Morgan,IT,True,False,True,Complete
```

---

## Script Workflow

```text
Fictional Copilot User Dataset
              ↓
       Validate CSV File
              ↓
    Validate Required Columns
              ↓
      Evaluate Each User
              ↓
 ┌────────────┼─────────────┐
 ↓            ↓             ↓
MFA       Copilot Access  AI Training
              ↓
       Security Review
              ↓
      Determine Status
              ↓
 ┌────────────┴─────────────┐
 ↓                          ↓
READY                REVIEW REQUIRED
                             ↓
                    Record Review Reasons
                             ↓
                   Generate CSV Report
```

---

## What the Script Does

The PowerShell script:

1. Determines the project root using `$PSScriptRoot`.
2. Builds reliable paths to the input and output files.
3. Confirms that the fictional CSV exists.
4. Imports the CSV into PowerShell.
5. Confirms that records are present.
6. Verifies that all required columns exist.
7. Evaluates each readiness condition.
8. Records failed checks in a review-reasons list.
9. Assigns an overall fictional readiness status.
10. Creates structured PowerShell objects.
11. Calculates summary totals and percentages.
12. Groups readiness results by department.
13. Counts review items by category.
14. Creates the reports directory if needed.
15. Exports the results to CSV.
16. Verifies that the report was successfully created.

---

## Generated Report Fields

The generated report contains:

| Field | Description |
|---|---|
| `DisplayName` | Fictional user's name |
| `Department` | Fictional department |
| `MFAStatus` | `PASS` or `REVIEW` |
| `CopilotAccessStatus` | `PASS` or `REVIEW` |
| `TrainingStatus` | `PASS` or `REVIEW` |
| `SecurityReviewStatus` | `PASS` or `REVIEW` |
| `OverallStatus` | `READY` or `REVIEW REQUIRED` |
| `ReviewReasons` | Specific checks requiring review |

Example result:

```csv
DisplayName,Department,MFAStatus,CopilotAccessStatus,TrainingStatus,SecurityReviewStatus,OverallStatus,ReviewReasons
Alex Carter,Accounting,PASS,PASS,PASS,PASS,READY,None
Casey Rivera,HR,REVIEW,PASS,PASS,REVIEW,REVIEW REQUIRED,MFA; Security Review
```

---

## How to Run the Lab

Open PowerShell and run the script from the project repository:

```powershell
.\scripts\Test-CopilotSecurityReadiness.ps1
```

The script uses its own location to determine the project root, so it can locate the input dataset and reports directory without depending entirely on the current PowerShell location.

A successful run should display:

```text
Report successfully created.
```

followed by the full report location.

---

## Expected Output

The PowerShell console displays:

- Total fictional users assessed
- Number of users marked ready
- Number of users requiring review
- Fictional readiness percentage
- List of ready users
- List of users requiring review
- Reasons users require review
- Review counts by category
- Readiness totals by department
- Generated report location

The final CSV is saved as:

```text
reports/copilot-readiness-report.csv
```

---

## PowerShell Concepts Practiced

This lab provides practice with:

- Variables
- Arrays
- `Test-Path`
- `Join-Path`
- `$PSScriptRoot`
- `Split-Path`
- `Import-Csv`
- `Export-Csv`
- `Where-Object`
- `Select-Object`
- `Group-Object`
- `Sort-Object`
- `foreach` loops
- `if` and `else` conditions
- Comparison operators
- Array joining
- `[PSCustomObject]`
- Error handling with `try` and `catch`
- File and directory validation
- Report verification

---

## Connection to Lab 01

Lab 01 focused on one identity-security control:

```text
Fictional Identity Data
          ↓
      MFA Analysis
          ↓
    MFA Audit Report
```

Lab 02 expands the assessment to include multiple fictional readiness conditions:

```text
Identity
    +
Copilot Access
    +
AI Training
    +
Security Review
          ↓
Copilot Security Readiness Report
```

This progression demonstrates how an initial identity-security exercise can be expanded into a broader governance and readiness workflow.

---

## Connection to Project Governance

This lab supports concepts documented elsewhere in the repository.

### AI Acceptable Use Policy

```text
governance/ai-acceptable-use-policy.md
```

Defines appropriate AI use, user responsibilities, human review, and security expectations.

### AI Data Handling Standard

```text
governance/data-handling-standard.md
```

Defines fictional data-handling, data-minimization, credential-protection, and information-review practices.

### Adoption Strategy

```text
docs/adoption-strategy.md
```

Describes how practical training, security awareness, and user education can support responsible Copilot adoption.

The `AITrainingComplete` and `SecurityReview` fields allow the technical lab to represent these governance concepts in a fictional assessment workflow.

---

## Security and Privacy Controls

This lab follows the repository's security and privacy principles:

- Only fictional identities are used.
- No production Microsoft 365 tenant is accessed.
- No employer information is included.
- No employee records are included.
- No credentials are stored.
- No access tokens or API secrets are used.
- No internal tenant identifiers are included.
- No Microsoft Graph connection is established.
- No production configurations are modified.

---

## Limitations

This is a simulated assessment based on static CSV data.

The lab does not:

- Confirm actual MFA registration.
- Confirm actual Copilot licensing.
- Query Microsoft Entra ID.
- Query Microsoft Graph.
- Inspect Microsoft 365 permissions.
- Evaluate SharePoint or OneDrive oversharing.
- Validate sensitivity labels.
- Evaluate data loss prevention policies.
- Analyze audit logs.
- Change user accounts or security settings.

These limitations are intentional because the lab is designed to demonstrate PowerShell logic, security documentation, and fictional readiness analysis without using organizational data.

---

## Key Takeaways

This lab demonstrates that PowerShell can be used to:

- Evaluate multiple control conditions.
- Explain why a record requires review.
- Turn governance concepts into repeatable checks.
- Summarize results across departments.
- Generate structured security reports.
- Validate input data before processing it.
- Keep technical exercises separated from production environments.

It also demonstrates that security readiness involves more than one technical setting. Identity, access, governance, training, and review processes can be represented together as part of a broader educational assessment.

---

## Lab Disclaimer

This lab is an independent educational exercise created for the **M365 Copilot Security Lab**.

All users, departments, configurations, criteria, and results are fictional.

The lab does not provide:

- An official Microsoft Copilot readiness assessment
- A Microsoft security score
- A licensing determination
- A compliance determination
- Legal or regulatory guidance
- A production deployment recommendation

Organizations should evaluate Microsoft 365 Copilot using security, privacy, compliance, licensing, governance, data, and operational requirements appropriate to their own environments.
