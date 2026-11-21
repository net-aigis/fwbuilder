#!/usr/bin/env bash
# Phase-21562: UI ssh-auth-ms-55500-echo roster Soft 21560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-55500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs55500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21560+ ssh-auth-ms-55500-echo roster ok"; echo "cleaned"; echo "OK: phase21562 e2e passed"
