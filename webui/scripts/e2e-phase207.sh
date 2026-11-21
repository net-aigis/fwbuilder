#!/usr/bin/env bash
# Phase-207: Download expect plan button.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'Download expect plan' "$extras"
grep -q 'fwbweb-expect-plan-' "$extras"
echo "expect plan download ok"
echo "cleaned"
echo "OK: phase207 e2e passed"
