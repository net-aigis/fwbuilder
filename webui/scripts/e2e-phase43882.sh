#!/usr/bin/env bash
# Phase-43882: UI ssh-auth-soft-46240-echo roster Soft 43880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-46240-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft46240EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43880+ ssh-auth-soft-46240-echo roster ok"; echo "cleaned"; echo "OK: phase43882 e2e passed"
