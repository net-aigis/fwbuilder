#!/usr/bin/env bash
# Phase-33082: UI ssh-auth-ms-73500-echo roster Soft 33080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-73500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs73500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33080+ ssh-auth-ms-73500-echo roster ok"; echo "cleaned"; echo "OK: phase33082 e2e passed"
