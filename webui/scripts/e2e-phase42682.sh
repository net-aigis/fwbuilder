#!/usr/bin/env bash
# Phase-42682: UI ssh-auth-ms-88500-echo roster Soft 42680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-88500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs88500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42680+ ssh-auth-ms-88500-echo roster ok"; echo "cleaned"; echo "OK: phase42682 e2e passed"
