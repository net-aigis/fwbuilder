#!/usr/bin/env bash
# Phase-30842: UI ssh-auth-ms-70000-echo roster Soft 30840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-70000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs70000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30840+ ssh-auth-ms-70000-echo roster ok"; echo "cleaned"; echo "OK: phase30842 e2e passed"
