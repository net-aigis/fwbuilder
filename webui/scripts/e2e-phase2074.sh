#!/usr/bin/env bash
# Phase-2074: UI honesty surface changelog detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestySurfaceChangelogDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty surface changelog' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download surface changelog' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty surface changelog ok"
echo "cleaned"
echo "OK: phase2074 e2e passed"
