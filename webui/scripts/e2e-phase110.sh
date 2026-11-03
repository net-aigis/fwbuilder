#!/usr/bin/env bash
# Phase-110: Unused-/Trash-Type-Filter in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.unusedTypeFilter' "$app"
grep -q 'fwbweb.trashTypeFilter' "$app"
grep -q 'sessionStorage.getItem("fwbweb.unusedTypeFilter")' "$app"
grep -q 'sessionStorage.setItem("fwbweb.unusedTypeFilter"' "$app"
grep -q 'sessionStorage.getItem("fwbweb.trashTypeFilter")' "$app"
grep -q 'sessionStorage.setItem("fwbweb.trashTypeFilter"' "$app"
echo "unused/trash filter persistence ok"
echo "cleaned"
echo "OK: phase110 e2e passed"
