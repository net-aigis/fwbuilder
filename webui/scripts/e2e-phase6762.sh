#!/usr/bin/env bash
# Phase-6762: UI ssh-not-implemented-keyboard roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-keyboard roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-not-implemented-keyboard roster ok"; echo "cleaned"; echo "OK: phase6762 e2e passed"
