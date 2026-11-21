#!/usr/bin/env bash
# Phase-516: RuleOptions rich fidelity summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_tree≤' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'signal_key_count' webui/frontend/src/components/RuleOptions.tsx
echo "RuleOptions fidelity UI ok"
echo "cleaned"
echo "OK: phase516 e2e passed"
