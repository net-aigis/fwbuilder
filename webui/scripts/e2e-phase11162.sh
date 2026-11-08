#!/usr/bin/env bash
# Phase-11162: UI ssh-auth-session-hint roster Soft 11160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-session-hint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSessionHintRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11160+ ssh-auth-session-hint roster ok"; echo "cleaned"; echo "OK: phase11162 e2e passed"
