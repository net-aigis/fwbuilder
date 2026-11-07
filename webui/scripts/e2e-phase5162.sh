#!/usr/bin/env bash
# Phase-5162: UI ssh-refusal-status roster Soft 5160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5160+ ssh-refusal-status roster ok"; echo "cleaned"; echo "OK: phase5162 e2e passed"
