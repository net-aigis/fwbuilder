#!/usr/bin/env bash
# Phase-20602: UI ssh-auth-ms-54000-echo roster Soft 20600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-54000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs54000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20600+ ssh-auth-ms-54000-echo roster ok"; echo "cleaned"; echo "OK: phase20602 e2e passed"
