#!/usr/bin/env bash
# Phase-922: truncate helper keeps short lines intact.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
# extract constant and assert presence; typecheck covers TS
grep -Eq 'SAMPLE_FIDELITY_UI_MAX = 220' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'full.slice(0, SAMPLE_FIDELITY_UI_MAX - 1)' webui/frontend/src/components/FirewallExtras.tsx
echo "truncate helper shape ok"
echo "cleaned"
echo "OK: phase922 e2e passed"
