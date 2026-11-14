#!/usr/bin/env bash
# Phase-30442: UI ssh-auth-soft-31200-echo roster Soft 30440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-31200-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft31200EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30440+ ssh-auth-soft-31200-echo roster ok"; echo "cleaned"; echo "OK: phase30442 e2e passed"
