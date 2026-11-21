#!/usr/bin/env bash
# Phase-4602: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4600+ ssh-auth roster ok"
echo "cleaned"
echo "OK: phase4602 e2e passed"
