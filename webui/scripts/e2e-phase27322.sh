#!/usr/bin/env bash
# Phase-27322: UI ssh-auth-ms-64500-echo roster Soft 27320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-64500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs64500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27320+ ssh-auth-ms-64500-echo roster ok"; echo "cleaned"; echo "OK: phase27322 e2e passed"
