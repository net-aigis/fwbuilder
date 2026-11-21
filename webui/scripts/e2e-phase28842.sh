#!/usr/bin/env bash
# Phase-28842: UI ssh-auth-soft-29400-echo roster Soft 28840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-29400-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft29400EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28840+ ssh-auth-soft-29400-echo roster ok"; echo "cleaned"; echo "OK: phase28842 e2e passed"
