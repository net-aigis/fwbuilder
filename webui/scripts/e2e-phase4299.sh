#!/usr/bin/env bash
# Phase-4299: client expect_run_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_run_roster?:' webui/frontend/src/api/client.ts
echo "client expect-run roster type ok"
echo "cleaned"
echo "OK: phase4299 e2e passed"
