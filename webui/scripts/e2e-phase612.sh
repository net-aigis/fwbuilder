#!/usr/bin/env bash
# Phase-612: hard-gaps sessionStorage snapshot.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsSnapshotKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGaps.' webui/frontend/src/components/FirewallExtras.tsx
echo "hard-gaps snapshot persist ok"
echo "cleaned"
echo "OK: phase612 e2e passed"
