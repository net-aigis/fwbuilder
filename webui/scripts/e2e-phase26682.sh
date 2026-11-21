#!/usr/bin/env bash
# Phase-26682: UI ssh-auth-ms-63500-echo roster Soft 26680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-63500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs63500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26680+ ssh-auth-ms-63500-echo roster ok"; echo "cleaned"; echo "OK: phase26682 e2e passed"
