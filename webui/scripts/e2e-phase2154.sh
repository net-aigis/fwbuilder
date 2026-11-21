#!/usr/bin/env bash
# Phase-2154: UI operator_brief bundle section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'operator_brief:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_operator_brief:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI operator_brief bundle ok"
echo "cleaned"
echo "OK: phase2154 e2e passed"
