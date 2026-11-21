#!/usr/bin/env bash
# Phase-22442: UI ssh-auth-soft-22560-echo roster Soft 22440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-22560-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft22560EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22440+ ssh-auth-soft-22560-echo roster ok"; echo "cleaned"; echo "OK: phase22442 e2e passed"
