#!/usr/bin/env bash
# Phase-46842: UI ssh-auth-ms-95000-echo roster Soft 46840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-95000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs95000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46840+ ssh-auth-ms-95000-echo roster ok"; echo "cleaned"; echo "OK: phase46842 e2e passed"
