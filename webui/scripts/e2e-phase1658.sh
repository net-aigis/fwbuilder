#!/usr/bin/env bash
# Phase-1658: UI Clear honesty catalogs button.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Clear honesty catalogs' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Cleared honesty catalogs' webui/frontend/src/components/FirewallExtras.tsx
echo "UI clear honesty catalogs ok"
echo "cleaned"
echo "OK: phase1658 e2e passed"
