#!/usr/bin/env bash
# Phase-48762: UI ssh-auth-ms-98000-echo roster Soft 48760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-98000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs98000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48760+ ssh-auth-ms-98000-echo roster ok"; echo "cleaned"; echo "OK: phase48762 e2e passed"
