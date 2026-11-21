#!/usr/bin/env bash
# Phase-266: QGroupBox flat/checkable CSS + UI chrome.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-section-flat' webui/frontend/src/styles/app.css
grep -Fq 'option-section-checkable' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'data-flat' webui/frontend/src/components/FirewallExtras.tsx
(cd webui/frontend && npm run typecheck)
echo "groupbox UI ok"
echo "cleaned"
echo "OK: phase266 e2e passed"
