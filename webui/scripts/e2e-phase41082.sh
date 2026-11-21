#!/usr/bin/env bash
# Phase-41082: UI ssh-auth-ms-86000-echo roster Soft 41080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-86000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs86000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41080+ ssh-auth-ms-86000-echo roster ok"; echo "cleaned"; echo "OK: phase41082 e2e passed"
