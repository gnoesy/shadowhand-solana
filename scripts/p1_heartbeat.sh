#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

TS=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "{\"ts\":\"$TS\",\"stage\":\"P1\",\"action\":\"heartbeat\",\"status\":\"ok\",\"host\":\"macbook\",\"note\":\"shadowhand heartbeat\"}" >> evidence/P1_node_ops.jsonl
echo "logged: ok at $TS"
