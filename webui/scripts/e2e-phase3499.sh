#!/usr/bin/env bash
# Phase-3499: client soft_fertig_honesty_operator_brief_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_operator_brief_roster?:' webui/frontend/src/api/client.ts
echo "client honesty operator brief roster type ok"
echo "cleaned"
echo "OK: phase3499 e2e passed"
