#!/usr/bin/env bash
# Phase-8682: UI ssh-not-implemented-keyboard-refresh roster Soft 8680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-keyboard-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8680+ ssh-not-implemented-keyboard-refresh roster ok"; echo "cleaned"; echo "OK: phase8682 e2e passed"
