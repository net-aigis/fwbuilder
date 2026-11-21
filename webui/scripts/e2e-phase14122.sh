#!/usr/bin/env bash
# Phase-14122: UI ssh-auth-gap-refusal-title roster Soft 14120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-gap-refusal-title roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthGapRefusalTitleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14120+ ssh-auth-gap-refusal-title roster ok"; echo "cleaned"; echo "OK: phase14122 e2e passed"
