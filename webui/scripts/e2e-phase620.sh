#!/usr/bin/env bash
# Phase-620: Copy hard-gaps JSON UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Copy hard-gaps JSON' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copied hard-gaps JSON' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'navigator.clipboard.writeText' webui/frontend/src/components/FirewallExtras.tsx
echo "copy hard-gaps UI ok"
echo "cleaned"
echo "OK: phase620 e2e passed"
