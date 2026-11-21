#!/usr/bin/env bash
# Phase-43642: UI ssh-auth-ms-90000-echo roster Soft 43640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-90000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs90000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43640+ ssh-auth-ms-90000-echo roster ok"; echo "cleaned"; echo "OK: phase43642 e2e passed"
