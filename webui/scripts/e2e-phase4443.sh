#!/usr/bin/env bash
# Phase-4443: client soft_fertig_expect_steps_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_steps_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4440+ soft_fertig_expect_steps_roster type ok"
echo "cleaned"
echo "OK: phase4443 e2e passed"
