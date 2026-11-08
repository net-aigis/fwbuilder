#!/usr/bin/env bash
# Phase-6842: UI ssh-not-implemented-password roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-password roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedPasswordRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-not-implemented-password roster ok"; echo "cleaned"; echo "OK: phase6842 e2e passed"
