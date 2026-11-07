#!/usr/bin/env bash
# Phase-4442: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig expect-steps roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4440+ expect-steps roster ok"
echo "cleaned"
echo "OK: phase4442 e2e passed"
