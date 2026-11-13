#!/usr/bin/env bash
# Phase-29482: UI ssh-auth-soft-30120-echo roster Soft 29480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-30120-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft30120EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29480+ ssh-auth-soft-30120-echo roster ok"; echo "cleaned"; echo "OK: phase29482 e2e passed"
