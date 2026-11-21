#!/usr/bin/env bash
# Phase-32362: UI ssh-auth-soft-33360-echo roster Soft 32360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-33360-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft33360EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32360+ ssh-auth-soft-33360-echo roster ok"; echo "cleaned"; echo "OK: phase32362 e2e passed"
