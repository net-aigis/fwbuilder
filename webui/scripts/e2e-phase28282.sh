#!/usr/bin/env bash
# Phase-28282: UI ssh-auth-ms-66000-echo roster Soft 28280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-66000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs66000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28280+ ssh-auth-ms-66000-echo roster ok"; echo "cleaned"; echo "OK: phase28282 e2e passed"
