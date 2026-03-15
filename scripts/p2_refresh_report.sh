#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

HB_TOTAL=$(grep -c '"action":"heartbeat"' evidence/P1_node_ops.jsonl || true)
HB_OK=$(grep -c '"action":"heartbeat".*"status":"ok"' evidence/P1_node_ops.jsonl || true)
HB_FAIL=$((HB_TOTAL-HB_OK))
HB_RATE=0
if [ "$HB_TOTAL" -gt 0 ]; then
HB_RATE=$(awk "BEGIN { printf \"%.2f\", ($HB_OK/$HB_TOTAL)*100 }")
fi

TS_NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat > evidence/P2_REPORT.md <<RPT
# Shadowhand P2 Report

- generated_at: $TS_NOW
- heartbeat_total: $HB_TOTAL
- heartbeat_ok: $HB_OK
- heartbeat_fail: $HB_FAIL
- uptime_rate: $HB_RATE%

## latest heartbeat
$(tail -n 5 evidence/P1_node_ops.jsonl 2>/dev/null || true)

## next actions
- Add service health endpoint check (if app server exists)
- Add fail-threshold alert rule
- Add RTG submission evidence bundle
RPT

echo "updated evidence/P2_REPORT.md"
