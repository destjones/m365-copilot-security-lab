# AI Data Handling Standard

> **M365 Copilot Security Lab**
>
> This document is a fictional educational standard created for the M365 Copilot Security Lab. It does not represent the data-handling requirements of any real organization and contains no production or employer data.

---

## 1. Purpose

This standard defines general data-handling practices for the use of Microsoft Copilot and other approved generative AI capabilities within a fictional Microsoft 365 environment.

The goal is to demonstrate how organizations can consider data sensitivity, authorized access, data minimization, human review, and responsible AI use when adopting generative AI tools.

AI access does not change the sensitivity, ownership, or access requirements of the information being used.

---

## 2. Core Data-Handling Principles

### Authorized Access

Only use information that you are authorized to access and use for the intended purpose.

Access to information does not automatically mean that the information is appropriate for every AI use case.

### Data Minimization

Provide only the information necessary to complete the task.

When possible:

- Remove unnecessary names and identifiers.
- Use excerpts instead of entire documents.
- Avoid submitting entire datasets when a smaller sample is sufficient.
- Remove information unrelated to the task.
- De-identify sensitive information when appropriate.

### Existing Protections Remain Important

AI tools should not be used to bypass:

- Access permissions
- Security controls
- Information classification requirements
- Data-sharing restrictions
- Retention requirements
- Other applicable protection mechanisms

### Human Responsibility

Users remain responsible for the information they provide to AI systems and for appropriately handling the resulting output.

---

## 3. Information Categories

For this lab, information is grouped into five simplified categories.

These categories are fictional examples created for educational purposes and do not represent an official Microsoft classification model.

### Public Information

Information approved or intended for public distribution.

Examples may include:

- Publicly available product information
- Published documentation
- Public announcements
- Public website content

**AI Handling:** Generally appropriate for approved AI use. Generated content should still be reviewed for accuracy and appropriate use.

---

### Internal Information

Routine organizational information intended for authorized internal users.

Examples may include:

- Internal procedures
- Routine project information
- Internal training materials
- General operational information

**AI Handling:** May be appropriate for use with an approved organizational AI service when the user is authorized to access and use the information.

Users should avoid including unnecessary information in prompts.

---

### Confidential Information

Information that could create business, privacy, financial, or operational risk if improperly disclosed.

Examples may include:

- Nonpublic business information
- Sensitive project information
- Financial information
- Customer or partner information
- Internal strategy
- Certain employee information

**AI Handling:** Use should receive greater scrutiny.

Users should minimize the information provided and consider whether the AI service, business purpose, and intended output are appropriate for the information involved.

---

### Restricted Information

Information requiring a high level of protection because of legal, regulatory, contractual, security, privacy, or organizational requirements.

Examples may include:

- Highly sensitive personal information
- Restricted legal information
- Security-sensitive information
- Regulated information
- Highly sensitive financial information

**AI Handling:** Do not provide restricted information to an AI system unless the use is specifically authorized and appropriate protections have been established.

When uncertain, users should not submit the information and should seek appropriate guidance.

---

### Authentication Secrets and Credentials

Authentication information requires special protection.

Examples include:

- Passwords
- Private keys
- Access tokens
- API secrets
- Recovery codes
- Authentication secrets

**AI Handling: Prohibited**

Credentials and authentication secrets should not be entered into AI prompts.

---

## 4. Prompt Data Minimization

Before submitting a prompt, users should ask:

> **What is the minimum amount of information the AI system needs to complete this task?**

For example, instead of providing an entire dataset when only a few fields are required:

```text
Entire Dataset
      ↓
Identify Required Information
      ↓
Remove Unnecessary Data
      ↓
Approved AI Service
`
