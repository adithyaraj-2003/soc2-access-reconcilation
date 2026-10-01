# Automated Access Reconciliation Engine (SOC 2 CC6.3)

## Overview
This project automates the detection of "orphaned accounts" (former employees with active system access) to satisfy **SOC 2 Common Criteria 6.3**. 

In manual audits, GRC teams struggle to reconcile HR termination records against live server access inventories, often leading to audit exceptions. This script bridges that gap by programmatically cross-referencing system user bases with corporate HR databases, ensuring immediate identification of compliance violations.

## Framework Mapping
- **Framework:** SOC 2 Type II
- **Trust Services Criteria:** Security (Common Criteria)
- **Specific Control:** CC6.3 — *The entity restricts logical access to data, systems, and facilities to authorized users, and revokes access upon termination.*

## Audit Mechanics & Evidence Generation
Auditors require immutable, system-generated evidence to verify that access removal controls are operating effectively. 
1. **The Population:** Parses the master HR database (`hr_database.csv`) to identify personnel with a "Terminated" status.
2. **The Verification:** Queries the underlying Linux operating system to verify if active system user accounts still exist for those individuals.
3. **The Artifact:** Generates a timestamped audit artifact (`access_discrepancy_report_2026-10-01.txt`) flagging active accounts of former employees for immediate removal.
