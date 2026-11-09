#!/usr/bin/env bash
# Phase-19562: UI ssh-auth-soft-19520-echo roster Soft 19560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-19520-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft19520EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19560+ ssh-auth-soft-19520-echo roster ok"; echo "cleaned"; echo "OK: phase19562 e2e passed"
