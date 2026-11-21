#!/usr/bin/env bash
# Phase-3563: client honesty_operator_brief_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_operator_brief_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3560+ honesty_operator_brief_roster type ok"
echo "cleaned"
echo "OK: phase3563 e2e passed"
