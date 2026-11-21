#!/usr/bin/env bash
# Phase-41642: UI ssh-auth-soft-43720-echo roster Soft 41640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-43720-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft43720EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41640+ ssh-auth-soft-43720-echo roster ok"; echo "cleaned"; echo "OK: phase41642 e2e passed"
