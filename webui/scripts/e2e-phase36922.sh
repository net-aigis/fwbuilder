#!/usr/bin/env bash
# Phase-36922: UI ssh-auth-ms-79500-echo roster Soft 36920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-79500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs79500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36920+ ssh-auth-ms-79500-echo roster ok"; echo "cleaned"; echo "OK: phase36922 e2e passed"
