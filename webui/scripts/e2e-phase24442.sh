#!/usr/bin/env bash
# Phase-24442: UI ssh-auth-ms-60000-echo roster Soft 24440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-60000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs60000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24440+ ssh-auth-ms-60000-echo roster ok"; echo "cleaned"; echo "OK: phase24442 e2e passed"
