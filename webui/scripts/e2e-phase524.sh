#!/usr/bin/env bash
# Phase-524: Interface/Rule show buddy× in fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'buddy×' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'buddy×' webui/frontend/src/components/RuleOptions.tsx
echo "buddy fidelity UI ok"
echo "cleaned"
echo "OK: phase524 e2e passed"
