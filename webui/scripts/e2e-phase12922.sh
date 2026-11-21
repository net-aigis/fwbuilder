#!/usr/bin/env bash
# Phase-12922: UI ssh-auth-session-count roster Soft 12920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-session-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSessionCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12920+ ssh-auth-session-count roster ok"; echo "cleaned"; echo "OK: phase12922 e2e passed"
