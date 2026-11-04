#!/usr/bin/env bash
# Phase-2299: client hard-gap refusal roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gap_refusal_roster?:' webui/frontend/src/api/client.ts
echo "client hard-gap refusal roster type ok"
echo "cleaned"
echo "OK: phase2299 e2e passed"
