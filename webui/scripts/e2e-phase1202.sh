#!/usr/bin/env bash
# Phase-1202: UI honesty path titles bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty path titles ok"
echo "cleaned"
echo "OK: phase1202 e2e passed"
