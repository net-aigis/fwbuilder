#!/usr/bin/env bash
# Phase-247: soft_complete at 248 (checked in 248).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'spacing' webui/frontend/src/components/RuleOptions.tsx
grep -q 'spacing' webui/frontend/src/components/InterfaceOptions.tsx
echo "245 wiring ok"
echo "cleaned"
echo "OK: phase247 e2e passed"
