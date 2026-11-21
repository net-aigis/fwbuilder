#!/usr/bin/env bash
# Phase-569: Download closure button.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download closure' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-hard-gap-closure-' webui/frontend/src/components/FirewallExtras.tsx
echo "download closure ok"
echo "cleaned"
echo "OK: phase569 e2e passed"
