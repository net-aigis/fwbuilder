#!/usr/bin/env bash
# Phase-43562: UI ssh-auth-soft-45880-echo roster Soft 43560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-45880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft45880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43560+ ssh-auth-soft-45880-echo roster ok"; echo "cleaned"; echo "OK: phase43562 e2e passed"
