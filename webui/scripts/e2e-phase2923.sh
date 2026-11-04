#!/usr/bin/env bash
# Phase-2923: client expect_step_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_step_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2920+ expect_step_roster type ok"
echo "cleaned"
echo "OK: phase2923 e2e passed"
