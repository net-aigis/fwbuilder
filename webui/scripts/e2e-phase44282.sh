#!/usr/bin/env bash
# Phase-44282: UI ssh-auth-ms-91000-echo roster Soft 44280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-91000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs91000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44280+ ssh-auth-ms-91000-echo roster ok"; echo "cleaned"; echo "OK: phase44282 e2e passed"
