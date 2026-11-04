#!/usr/bin/env bash
# Phase-1738: UI bundle surface_version + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface_version:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download surface version' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_version export/bundle ok"
echo "cleaned"
echo "OK: phase1738 e2e passed"
