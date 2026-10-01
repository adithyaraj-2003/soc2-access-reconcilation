#!/bin/bash

HR_FILE="hr_database.csv"
REPORT_FILE="access_discrepancy_report_$(date +%F).txt"

echo "SOC 2 CC6.3 Access Reconciliation Evidence" > $REPORT_FILE
echo "Generated on: $(date)" >> $REPORT_FILE
echo "--------------------------------------------------" >> $REPORT_FILE
echo "FLAGGED ORPHANED ACCOUNTS (Requires Immediate Removal):" >> $REPORT_FILE
echo "" >> $REPORT_FILE

grep "Terminated" $HR_FILE | while IFS=, read -r emp_id username status term_date; do
    if id "$username" &>/dev/null; then
        echo "[VIOLATION] User '$username' was terminated on $term_date but still has an active system account." >> $REPORT_FILE
    fi
done

echo "--------------------------------------------------" >> $REPORT_FILE
echo "Reconciliation complete. End of audit evidence." >> $REPORT_FILE
echo "Success: Audit report generated -> $REPORT_FILE"
