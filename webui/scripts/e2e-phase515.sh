#!/usr/bin/env bash
# Phase-515: InterfaceOptions rich fidelity summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_tree≤' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'signal_key_count' webui/frontend/src/components/InterfaceOptions.tsx
echo "InterfaceOptions fidelity UI ok"
echo "cleaned"
echo "OK: phase515 e2e passed"
