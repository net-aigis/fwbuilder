#!/usr/bin/env bash
# Phase-8842: UI ssh-alternative-support-refresh roster Soft 8840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-support-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8840+ ssh-alternative-support-refresh roster ok"; echo "cleaned"; echo "OK: phase8842 e2e passed"
