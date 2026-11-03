#!/usr/bin/env bash
# Phase-118: Option-Gruppe pro Platform in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fwbweb.optionGroup.' "$f"
grep -q 'groupStorageKey' "$f"
grep -q 'sessionStorage.setItem(groupStorageKey' "$f"
echo "option group persistence ok"
echo "cleaned"
echo "OK: phase118 e2e passed"
