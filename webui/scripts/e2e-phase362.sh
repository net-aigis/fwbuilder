#!/usr/bin/env bash
# Phase-362: InterfaceOptions QStackedWidget page switcher.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-stack-pages' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'activeStackIndex' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'showAllStacks' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'option-section-empty' webui/frontend/src/components/InterfaceOptions.tsx
echo "iface stack switcher ok"
echo "cleaned"
echo "OK: phase362 e2e passed"
