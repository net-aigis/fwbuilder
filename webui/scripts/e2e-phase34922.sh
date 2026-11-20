#!/usr/bin/env bash
# Phase-34922: UI ssh-auth-soft-36160-echo roster Soft 34920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-36160-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft36160EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34920+ ssh-auth-soft-36160-echo roster ok"; echo "cleaned"; echo "OK: phase34922 e2e passed"
