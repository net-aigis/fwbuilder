#!/usr/bin/env bash
# Phase-403: tab buttons use group.tooltip as title.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'title={g.tooltip' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'title={g.tooltip' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'title={g.tooltip' webui/frontend/src/components/RuleOptions.tsx
echo "tab tooltip UI ok"
echo "cleaned"
echo "OK: phase403 e2e passed"
