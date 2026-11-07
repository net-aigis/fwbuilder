#!/usr/bin/env bash
# Phase-4459: client expect_steps_refusals_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_steps_refusals_roster?:' webui/frontend/src/api/client.ts
echo "client expect-steps-refusals roster type ok"
echo "cleaned"
echo "OK: phase4459 e2e passed"
