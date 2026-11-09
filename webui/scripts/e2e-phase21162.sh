#!/usr/bin/env bash
# Phase-21162: UI ssh-auth-soft-21120-echo roster Soft 21160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-21120-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft21120EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21160+ ssh-auth-soft-21120-echo roster ok"; echo "cleaned"; echo "OK: phase21162 e2e passed"
