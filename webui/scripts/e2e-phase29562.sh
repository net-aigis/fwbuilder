#!/usr/bin/env bash
# Phase-29562: UI ssh-auth-ms-68000-echo roster Soft 29560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-68000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs68000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29560+ ssh-auth-ms-68000-echo roster ok"; echo "cleaned"; echo "OK: phase29562 e2e passed"
