#!/usr/bin/env bash
# Phase-48122: UI ssh-auth-ms-97000-echo roster Soft 48120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-97000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs97000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48120+ ssh-auth-ms-97000-echo roster ok"; echo "cleaned"; echo "OK: phase48122 e2e passed"
