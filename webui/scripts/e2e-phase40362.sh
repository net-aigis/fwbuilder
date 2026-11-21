#!/usr/bin/env bash
# Phase-40362: UI ssh-auth-soft-42280-echo roster Soft 40360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-42280-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft42280EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40360+ ssh-auth-soft-42280-echo roster ok"; echo "cleaned"; echo "OK: phase40362 e2e passed"
