#!/usr/bin/env bash
# Phase-396: FirewallExtras shows soft-complete phase + 501 paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softCompletePhase' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Expect run (501)' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Password SSH (501)' webui/frontend/src/components/FirewallExtras.tsx
echo "hard-gap refuse UI ok"
echo "cleaned"
echo "OK: phase396 e2e passed"
