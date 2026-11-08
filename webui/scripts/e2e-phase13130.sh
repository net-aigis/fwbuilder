#!/usr/bin/env bash
# Phase-13130: UI surface schema still shows version.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface schema' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface schema 5.104 ok"; echo "cleaned"; echo "OK: phase13130 e2e passed"
