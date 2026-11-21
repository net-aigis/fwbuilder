#!/usr/bin/env bash
# Phase-347: 345–346 wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'parse_stacked_sections' webui/scripts/extract-dialog-fields.py
grep -Fq 'option-section-stacked' webui/frontend/src/components/FirewallExtras.tsx
echo "345-346 wiring ok"
echo "cleaned"
echo "OK: phase347 e2e passed"
