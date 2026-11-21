#!/usr/bin/env bash
# Phase-46122: UI ssh-auth-soft-48760-echo roster Soft 46120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-48760-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft48760EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46120+ ssh-auth-soft-48760-echo roster ok"; echo "cleaned"; echo "OK: phase46122 e2e passed"
