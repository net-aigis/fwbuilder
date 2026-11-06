#!/usr/bin/env bash
# Phase-3979: client hard_gaps_field_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_field_roster?:' webui/frontend/src/api/client.ts
echo "client hard-gaps field roster type ok"
echo "cleaned"
echo "OK: phase3979 e2e passed"
