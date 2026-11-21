#!/usr/bin/env bash
# Phase-104: Tree-Filter und Search-Type in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.treeFilter' "$app"
grep -q 'fwbweb.searchType' "$app"
grep -q 'sessionStorage.getItem("fwbweb.treeFilter")' "$app"
grep -q 'sessionStorage.setItem("fwbweb.treeFilter"' "$app"
grep -q 'sessionStorage.getItem("fwbweb.searchType")' "$app"
grep -q 'sessionStorage.setItem("fwbweb.searchType"' "$app"
echo "treeFilter + searchType persistence ok"
echo "cleaned"
echo "OK: phase104 e2e passed"
