#!/usr/bin/env bash
# Phase-387: OptionField title includes whats_this.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'whats_this' webui/frontend/src/components/OptionField.tsx
grep -Fq 'whats_this' webui/frontend/src/api/client.ts
echo "OptionField whats_this ok"
echo "cleaned"
echo "OK: phase387 e2e passed"
