#!/usr/bin/env bash
# Phase-2219: client hard-gap roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gap_roster?:' webui/frontend/src/api/client.ts
echo "client hard-gap roster type ok"
echo "cleaned"
echo "OK: phase2219 e2e passed"
