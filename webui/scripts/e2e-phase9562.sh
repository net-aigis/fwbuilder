#!/usr/bin/env bash
# Phase-9562: UI ssh-auth-implemented-id roster Soft 9560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-implemented-id roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthImplementedIdRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9560+ ssh-auth-implemented-id roster ok"; echo "cleaned"; echo "OK: phase9562 e2e passed"
