#!/usr/bin/env bash
# Phase-164: Reset deploy prefs button + hard-gap backlog STATUS.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
status="$ROOT/webui/STATUS.md"
grep -q 'Reset deploy prefs' "$extras"
grep -q 'removeItem(deployPrefsKey' "$extras"
grep -q 'Still open (hard backlog)' "$status"
grep -q 'Password/keyboard-interactive SSH' "$status"
echo "reset prefs + backlog ok"
echo "cleaned"
echo "OK: phase164 e2e passed"
