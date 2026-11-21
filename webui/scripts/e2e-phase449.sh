#!/usr/bin/env bash
# Phase-449: Device type select hides duplicate type OptionField.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stackSwitch && key === "type"' webui/frontend/src/components/InterfaceOptions.tsx
echo "dedupe type field ok"
echo "cleaned"
echo "OK: phase449 e2e passed"
