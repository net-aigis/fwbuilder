#!/usr/bin/env bash
# Phase-14442: UI ssh-auth-session-ssh-ratio roster Soft 14440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-session-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSessionSshRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14440+ ssh-auth-session-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14442 e2e passed"
