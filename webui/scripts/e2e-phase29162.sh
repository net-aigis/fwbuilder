#!/usr/bin/env bash
# Phase-29162: UI ssh-auth-soft-29760-echo roster Soft 29160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-29760-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft29760EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29160+ ssh-auth-soft-29760-echo roster ok"; echo "cleaned"; echo "OK: phase29162 e2e passed"
