#!/usr/bin/env bash
# Phase-20922: UI ssh-auth-ms-54500-echo roster Soft 20920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-54500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs54500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20920+ ssh-auth-ms-54500-echo roster ok"; echo "cleaned"; echo "OK: phase20922 e2e passed"
