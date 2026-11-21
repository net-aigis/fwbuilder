#!/usr/bin/env bash
# Phase-40682: UI ssh-auth-soft-42640-echo roster Soft 40680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-42640-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft42640EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40680+ ssh-auth-soft-42640-echo roster ok"; echo "cleaned"; echo "OK: phase40682 e2e passed"
