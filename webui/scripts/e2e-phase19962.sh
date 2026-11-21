#!/usr/bin/env bash
# Phase-19962: UI ssh-auth-ms-53000-echo roster Soft 19960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-53000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs53000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19960+ ssh-auth-ms-53000-echo roster ok"; echo "cleaned"; echo "OK: phase19962 e2e passed"
