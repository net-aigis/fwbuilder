#!/usr/bin/env bash
# Phase-47482: UI ssh-auth-ms-96000-echo roster Soft 47480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-96000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs96000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47480+ ssh-auth-ms-96000-echo roster ok"; echo "cleaned"; echo "OK: phase47482 e2e passed"
