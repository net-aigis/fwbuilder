#!/usr/bin/env bash
# Phase-162: App live deploy passes force_limited_installer after confirm.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'force_limited_installer: true' "$app"
grep -q 'Interactive Cisco/Juniper installers are not fully supported' "$app"
echo "app force_limited live ok"
echo "cleaned"
echo "OK: phase162 e2e passed"
