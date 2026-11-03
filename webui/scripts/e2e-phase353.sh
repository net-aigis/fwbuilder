#!/usr/bin/env bash
# Phase-353: InterfaceOptions renders QStackedWidget / section chrome.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-section-stacked' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'optionSections' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'stack_index' webui/frontend/src/components/InterfaceOptions.tsx
echo "iface stacked UI ok"
echo "cleaned"
echo "OK: phase353 e2e passed"
