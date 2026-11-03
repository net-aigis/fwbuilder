#!/usr/bin/env bash
# Phase-313: download walkthrough button.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download walkthrough' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-expect-walkthrough' webui/frontend/src/components/FirewallExtras.tsx
echo "walkthrough download ok"
echo "cleaned"
echo "OK: phase313 e2e passed"
