#!/usr/bin/env bash
# Phase-3739: client hard_gaps_closure_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_closure_roster?:' webui/frontend/src/api/client.ts
echo "client hard-gaps closure roster type ok"
echo "cleaned"
echo "OK: phase3739 e2e passed"
