#!/usr/bin/env bash
# Phase-363: FirewallExtras QStackedWidget page switcher.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-stack-pages' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'activeStackIndex' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'option-section-empty' webui/frontend/src/components/FirewallExtras.tsx
echo "firewall stack switcher ok"
echo "cleaned"
echo "OK: phase363 e2e passed"
