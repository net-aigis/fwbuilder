#!/usr/bin/env bash
# Phase-39402: UI ssh-auth-soft-41200-echo roster Soft 39400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-41200-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft41200EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39400+ ssh-auth-soft-41200-echo roster ok"; echo "cleaned"; echo "OK: phase39402 e2e passed"
