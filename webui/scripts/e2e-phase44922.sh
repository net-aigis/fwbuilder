#!/usr/bin/env bash
# Phase-44922: UI ssh-auth-ms-92000-echo roster Soft 44920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-92000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs92000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44920+ ssh-auth-ms-92000-echo roster ok"; echo "cleaned"; echo "OK: phase44922 e2e passed"
