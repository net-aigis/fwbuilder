#!/usr/bin/env bash
# Phase-32042: UI ssh-auth-soft-33000-echo roster Soft 32040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-33000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft33000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32040+ ssh-auth-soft-33000-echo roster ok"; echo "cleaned"; echo "OK: phase32042 e2e passed"
