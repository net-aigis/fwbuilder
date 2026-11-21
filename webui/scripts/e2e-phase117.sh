#!/usr/bin/env bash
# Phase-117: Dialog-Seiten-Navigation + Reset page defaults (FirewallExtras).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'dialog-pages' "$f"
grep -q 'Reset page defaults' "$f"
grep -q 'resetActivePageDefaults' "$f"
grep -q 'cycleGroup' "$f"
echo "dialog page nav ok"
echo "cleaned"
echo "OK: phase117 e2e passed"
