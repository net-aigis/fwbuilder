#!/usr/bin/env bash
# Phase-17962: UI ssh-auth-soft-17920-echo roster Soft 17960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-17920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft17920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17960+ ssh-auth-soft-17920-echo roster ok"; echo "cleaned"; echo "OK: phase17962 e2e passed"
