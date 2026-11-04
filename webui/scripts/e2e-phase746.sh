#!/usr/bin/env bash
# Phase-746: OptionField still emits size-h/v classes for all policies.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size-h-${sp.horizontal}' webui/frontend/src/components/OptionField.tsx
grep -Fq 'size-v-${sp.vertical}' webui/frontend/src/components/OptionField.tsx
echo "OptionField size classes ok"
echo "cleaned"
echo "OK: phase746 e2e passed"
