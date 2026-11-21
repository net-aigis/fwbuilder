#!/usr/bin/env bash
# Phase-4491: client surface version + expect_steps_refusals_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_expect_steps_refusals_roster?:' webui/frontend/src/api/client.ts
echo "client surface/expect_steps_refusals_roster types ok"
echo "cleaned"
echo "OK: phase4491 e2e passed"
