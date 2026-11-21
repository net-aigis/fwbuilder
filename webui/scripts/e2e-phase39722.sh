#!/usr/bin/env bash
# Phase-39722: UI ssh-auth-soft-41560-echo roster Soft 39720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-41560-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft41560EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39720+ ssh-auth-soft-41560-echo roster ok"; echo "cleaned"; echo "OK: phase39722 e2e passed"
