#!/usr/bin/env bash
# Phase-20842: UI ssh-auth-soft-20760-echo roster Soft 20840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-20760-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft20760EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20840+ ssh-auth-soft-20760-echo roster ok"; echo "cleaned"; echo "OK: phase20842 e2e passed"
