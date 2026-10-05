# M365 Copilot Security Lab

A hands-on Microsoft 365 Copilot security, governance, adoption, and administration lab built with fictional data and non-production resources.

This project explores how Microsoft 365 Copilot can be approached from both an **IT administration** and **cybersecurity/governance** perspective, including identity security, responsible AI use, data handling, user adoption, security readiness, and PowerShell automation.

> **Lab Environment**
>
> This repository is an independent educational project. It does not contain employer data, production tenant information, real employee information, credentials, or proprietary organizational configurations.

---

## Project Overview

Deploying generative AI in an organization involves more than enabling a tool.

A responsible Microsoft 365 Copilot deployment should consider areas such as:

- Identity and access security
- AI governance
- Data handling
- User permissions
- Responsible AI use
- Security awareness
- User training and adoption
- Administrative automation
- Ongoing security review

The purpose of this lab is to explore those areas through a combination of documentation, fictional security scenarios, sample datasets, PowerShell automation, and hands-on labs.

---

## Project Goals

This lab is designed to help develop practical experience with:

- Microsoft 365 Copilot deployment planning
- AI governance
- Identity security
- Multifactor authentication concepts
- Data protection
- Secure AI adoption
- PowerShell automation
- Security reporting
- User training
- Responsible AI practices
- Technical documentation

The project will continue to evolve as additional security and governance scenarios are explored.

---

## Repository Structure

```text
m365-copilot-security-lab/
│
├── README.md
│
├── docs/
│   ├── rollout-plan.md
│   ├── architecture.md
│   └── adoption-strategy.md
│
├── governance/
│   ├── ai-acceptable-use-policy.md
│   ├── data-handling-standard.md
│   └── security-checklist.md
│
├── labs/
│ ├── 01-identity-security/
│ │ └── README.md
│ │
│ └── 02-copilot-security-readiness/
│ └── README.md
│
├── prompts/
│   ├── accounting.md
│   ├── hr.md
│   ├── operations.md
│   └── it.md
│
├── scripts/
│   ├── Get-MFAStatus.ps1
│   └── Test-CopilotSecurityReadiness.ps1
│
├── sample-data/
│   ├── fictional-users.csv
│   └── fictional-copilot-users.csv
│
└── reports/
    ├── mfa-audit-report.csv
    └── copilot-readiness-report.csv
```

---

# Documentation

The `docs/` directory contains the strategic portion of the project.

### Rollout Plan

`docs/rollout-plan.md`

Explores a fictional Microsoft 365 Copilot rollout approach covering planning, security readiness, governance, pilot deployment, training, and broader adoption.

### Architecture

`docs/architecture.md`

Documents the conceptual relationship between users, identity, Microsoft 365 access, Copilot, organizational data, and security controls.

### Adoption Strategy

`docs/adoption-strategy.md`

Explores how practical use cases, department-specific training, security awareness, and continuous improvement can support responsible Copilot adoption.

---

# Governance

The `governance/` directory contains fictional governance artifacts created specifically for this lab.

### AI Acceptable Use Policy

`governance/ai-acceptable-use-policy.md`

Defines a fictional framework for:

- Appropriate AI use
- Prohibited activities
- User responsibilities
- Human review
- Security reporting
- Responsible AI practices

### AI Data Handling Standard

`governance/data-handling-standard.md`

Explores:

- Authorized data use
- Data minimization
- Information sensitivity
- Credential protection
- File handling
- AI-generated output
- Unexpected data exposure

### Security Readiness Checklist

`governance/security-checklist.md`

Provides a structured review framework covering identity, data security, AI governance, output validation, training, and incident readiness.

---

# Hands-On Security Labs

The `labs/` directory contains technical exercises that connect
Microsoft 365 Copilot security and governance concepts with
PowerShell automation and fictional data.

## Lab 01: Identity Security Foundation

Lab 01 explores identity security by using PowerShell to analyze
fictional MFA information.

### Lab Workflow

```text
Fictional Identity Dataset
          ↓
      PowerShell
          ↓
      MFA Analysis
          ↓
  Generated MFA Report
```

### Key Concepts

- CSV data processing
- PowerShell variables
- File validation
- Data filtering
- Conditional logic
- MFA adoption calculations
- Department grouping
- Custom PowerShell objects
- Security report generation

### Lab Components

```text
labs/01-identity-security/README.md
            ↓
sample-data/fictional-users.csv
            ↓
scripts/Get-MFAStatus.ps1
            ↓
reports/mfa-audit-report.csv
```
## Lab 02: Copilot Security Readiness Assessment

Lab 02 expands the project from a single identity-security check into a multi-control fictional Copilot readiness assessment.

The lab evaluates four criteria:

- MFA enabled
- Copilot access
- AI training completed
- Security review completed

### Lab Workflow 
```
Fictional Copilot Dataset
          ↓
      PowerShell
          ↓
 ┌────────┼────────┐
 ↓        ↓        ↓
MFA    Copilot   Training
        Access
          ↓
   Security Review
          ↓
  Readiness Assessment
          ↓
   Generated Report
```
Users who satisfy all four fictional lab criteria receive:

READY

Users who require additional review receive:

REVIEW REQUIRED

The script also identifies the specific controls requiring review.

### Key Concepts

- Multi-control security assessment
- Identity security
- Copilot access
- AI governance
- Security awareness
- Input validation
- PowerShell automation
- Error handling
- Security reporting
- Readiness analysis

### Lab Components

```text
labs/02-copilot-security-readiness/README.md
                    ↓
sample-data/fictional-copilot-users.csv
                    ↓
scripts/Test-CopilotSecurityReadiness.ps1
                    ↓
reports/copilot-readiness-report.csv
```

The resulting security classifications are educational lab classifications and do not represent official Microsoft security or compliance determinations.

---

# PowerShell Automation

PowerShell is used throughout this project to turn security and governance concepts into repeatable technical exercises.
The first script:
PowerShell is used throughout this project to turn security and governance concepts into repeatable technical exercises. 

## Get-MFAStatus.ps1 Used in Lab 01 to analyze fictional MFA information. 

The script demonstrates: 

- CSV import
-  Data filtering
-  Conditional logic
-  MFA adoption calculations
-  Department grouping
-  Custom PowerShell objects
-  CSV report generation

##  Test-CopilotSecurityReadiness.ps1 

Used in Lab 02 to perform a fictional multi-control Copilot readiness assessment. 

The script demonstrates: 
- Input validation
- Required-column validation
- Multiple control checks
- Review-reason tracking
- Readiness calculations
- Department-level analysis
- Error handling
- Reliable project-relative file paths
- Automated CSV report generation
- Report verification

Neither script connects to Microsoft Graph, Microsoft Entra ID, or a production Microsoft 365 environment.
---

# Sample Data

All technical exercises use artificial data.

# Sample Data

All technical exercises use fictional or synthetic information.

Current datasets include:

- `sample-data/

```text
DisplayName
Department
License
MFAEnabled
```

The purpose of the dataset is to provide safe input for security and automation exercises without requiring real organizational information.

---

# Security and Privacy Approach

This repository follows several basic lab principles.

### No Production Data

The project should not contain:

- Real employee records
- Employer information
- Production tenant identifiers
- Internal URLs
- Customer information
- Authentication credentials
- Access tokens
- API secrets
- Private keys
- Proprietary configurations
- Internal security documentation

### Fictional Data by Default

Technical exercises use synthetic identities, departments, configurations, and security scenarios.

### Data Minimization

Only information necessary to demonstrate a technical concept should be included.

### Human Review

AI-generated code, documentation, recommendations, and configurations should be reviewed before being relied upon or used in another environment.

---

# Prompt Library

The `prompts/` directory contains fictional Copilot prompt examples designed to explore practical AI adoption across different business functions.

Current categories include:

- Accounting
- Human Resources
- Operations
- Information Technology

The examples are intended for educational demonstration and should not contain real organizational or employee information.

---

# Project Roadmap

## Foundation

- [x] Create repository structure
- [x] Develop rollout documentation
- [x] Document conceptual architecture
- [x] Develop adoption strategy

## Governance

- [x] AI Acceptable Use Policy
- [x] AI Data Handling Standard
- [ ] Copilot Security Readiness Checklist

## Technical Labs

- [x] Lab 01: Identity Security Foundation
- [x] Create fictional identity dataset
- [x] Build MFA PowerShell audit
- [x] Generate security report
- [x] Lab 02: Copilot Security Readiness
- [x] Create fictional Copilot readiness dataset
- [x] Build Copilot readiness PowerShell assessment
- [x] Generate Copilot readiness report
- [ ] Lab 03: Data Access and Oversharing

## Adoption

- [ ] Expand department-specific prompt examples
- [ ] Add responsible prompting examples
- [ ] Add AI security-awareness scenarios

## Future Technical Exploration

Potential future areas include:

- Copilot security readiness
- Permissions and oversharing
- Identity and access controls
- Data classification
- Information protection
- Security reporting
- Microsoft Graph PowerShell
- Administrative automation

---

# Skills Practiced

This project provides hands-on practice across several technical and governance areas.

### Security

- Identity security concepts
- MFA analysis
- Access governance
- Data handling
- AI security
- Security readiness

### Microsoft 365

- Microsoft 365 Copilot concepts
- AI governance
- Identity and access concepts
- Microsoft 365 administration concepts

### Automation

- PowerShell
- CSV processing
- Conditional logic
- Data filtering
- Data grouping
- Custom PowerShell objects
- Report generation

### Governance and Adoption

- AI acceptable-use guidance
- Data-handling standards
- Security checklists
- User adoption planning
- Training strategy
- Responsible AI practices

---

# Disclaimer

This repository is an independent educational lab.

All users, departments, configurations, scenarios, and datasets used in this project are fictional or synthetic.

Nothing in this repository should be interpreted as:

- An official Microsoft security assessment
- Microsoft certification guidance
- Legal advice
- Regulatory guidance
- A compliance determination
- A production deployment recommendation
- The policy or configuration of any real organization

Organizations deploying Microsoft 365 Copilot should evaluate their own security, compliance, privacy, licensing, governance, data, and operational requirements.

---

## Author

**Destiny Jones**

IT Engineer | Microsoft 365 | AI Governance | Security & Automation

This project documents my hands-on learning across Microsoft 365 Copilot administration, AI governance, cybersecurity, PowerShell, and secure AI adoption.
