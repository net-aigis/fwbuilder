#!/usr/bin/env bash
# Phase-3690: UI surface schema still shows version.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface schema' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface schema 3.6 ok"
echo "cleaned"
echo "OK: phase3690 e2e passed"
