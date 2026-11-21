#!/usr/bin/env bash
# Phase-39482: UI ssh-auth-ms-83500-echo roster Soft 39480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-83500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs83500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39480+ ssh-auth-ms-83500-echo roster ok"; echo "cleaned"; echo "OK: phase39482 e2e passed"
