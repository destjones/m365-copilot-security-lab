# Microsoft 365 Copilot Security Readiness Checklist

> This checklist is a fictional educational framework created for the
> M365 Copilot Security Lab. Completion does not represent an official
> Microsoft security, compliance, or Copilot readiness assessment.

---

## Identity & Access

- [x] MFA requirements reviewed
- [ ] Conditional Access requirements reviewed
- [ ] Administrative access reviewed
- [ ] Inactive accounts reviewed
- [ ] User access and permissions reviewed

**Evidence:**
- `labs/01-identity-security/`
- `scripts/Get-MFAStatus.ps1`
- `reports/mfa-audit-report.csv`

---

## Copilot Access & Readiness

- [x] Copilot access included in readiness assessment
- [x] User readiness criteria documented
- [x] Security review criteria documented
- [ ] Production licensing requirements validated
- [ ] Actual user Copilot access validated

**Evidence:**
- `labs/02-copilot-security-readiness/`
- `scripts/Test-CopilotSecurityReadiness.ps1`
- `reports/copilot-readiness-report.csv`

---

## Data Security

- [x] Data-handling expectations documented
- [x] Data minimization guidance documented
- [x] Credential and authentication-secret handling documented
- [x] Information sensitivity categories defined for the lab
- [ ] SharePoint permissions reviewed
- [ ] Oversharing risks assessed
- [ ] Sensitivity labels evaluated
- [ ] Data loss prevention controls evaluated

**Evidence:**
- `governance/data-handling-standard.md`

---

## AI Governance

- [x] AI acceptable-use guidance established
- [x] Appropriate AI use documented
- [x] Prohibited AI use documented
- [x] User responsibilities documented
- [x] Human review requirements documented
- [x] AI-related security reporting expectations documented

**Evidence:**
- `governance/ai-acceptable-use-policy.md`
- `governance/data-handling-standard.md`

---

## Training & Adoption

- [x] User training strategy documented
- [x] Security awareness included in adoption planning
- [x] Responsible AI education addressed
- [x] AI training included in readiness assessment
- [ ] Department-specific prompt library completed
- [ ] Training effectiveness measurement developed

**Evidence:**
- `docs/adoption-strategy.md`
- `labs/02-copilot-security-readiness/`

---

## Security Reporting & Automation

- [x] Fictional MFA audit automated
- [x] Fictional Copilot readiness assessment automated
- [x] CSV security reporting implemented
- [x] Review reasons included in readiness reporting
- [x] Department-level readiness analysis implemented
- [ ] Live Microsoft 365 data integration implemented
- [ ] Microsoft Graph integration implemented

**Evidence:**
- `scripts/Get-MFAStatus.ps1`
- `scripts/Test-CopilotSecurityReadiness.ps1`
- `reports/mfa-audit-report.csv`
- `reports/copilot-readiness-report.csv`

---

## Incident Readiness

- [x] AI-related security concerns defined
- [x] Unexpected data exposure addressed
- [x] Credential exposure addressed
- [x] Reporting expectations documented
- [x] Evidence-preservation expectations documented
- [ ] Technical incident-response workflow tested

**Evidence:**
- `governance/ai-acceptable-use-policy.md`
- `governance/data-handling-standard.md`

---

## Overall Lab Progress

- [x] Copilot rollout strategy documented
- [x] Copilot security architecture documented
- [x] Adoption strategy documented
- [x] AI governance documentation created
- [x] Identity-security lab completed
- [x] Copilot security-readiness lab completed
- [ ] Data access and oversharing lab completed
- [ ] Microsoft Graph-based lab completed
