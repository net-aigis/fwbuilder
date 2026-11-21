#!/usr/bin/env bash
# Phase-274: buddy_labels wired through platforms + frontend types/render.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'buddy_labels' webui/backend/fwbweb_api/platforms.py
grep -Fq 'buddy_labels' webui/frontend/src/api/client.ts
grep -Fq 'qt-buddy-label' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'qt-buddy-label' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'qt-buddy-label' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'external_label' webui/frontend/src/components/OptionField.tsx
(cd webui/frontend && npm run typecheck)
echo "buddy_labels UI ok"
echo "cleaned"
echo "OK: phase274 e2e passed"
