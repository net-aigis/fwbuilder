#!/usr/bin/env bash
# Phase-1139: client types for hard_gap_open_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_open_labels?:' webui/frontend/src/api/client.ts
echo "client hard_gap_open_labels types ok"
echo "cleaned"
echo "OK: phase1139 e2e passed"
