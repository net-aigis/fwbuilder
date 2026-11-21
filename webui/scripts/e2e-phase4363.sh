#!/usr/bin/env bash
# Phase-4363: client soft_fertig_expect_run_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_run_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4360+ soft_fertig_expect_run_roster type ok"
echo "cleaned"
echo "OK: phase4363 e2e passed"
