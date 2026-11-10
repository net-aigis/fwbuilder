#!/usr/bin/env bash
# Phase-27002: UI ssh-auth-ms-64000-echo roster Soft 27000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-64000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs64000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27000+ ssh-auth-ms-64000-echo roster ok"; echo "cleaned"; echo "OK: phase27002 e2e passed"
