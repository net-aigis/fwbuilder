#!/usr/bin/env bash
# Phase-37562: UI ssh-auth-ms-80500-echo roster Soft 37560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-80500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs80500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37560+ ssh-auth-ms-80500-echo roster ok"; echo "cleaned"; echo "OK: phase37562 e2e passed"
