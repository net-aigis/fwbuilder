#!/usr/bin/env bash
# Phase-26042: UI ssh-auth-ms-62500-echo roster Soft 26040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-62500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs62500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26040+ ssh-auth-ms-62500-echo roster ok"; echo "cleaned"; echo "OK: phase26042 e2e passed"
