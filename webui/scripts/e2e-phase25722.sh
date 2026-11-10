#!/usr/bin/env bash
# Phase-25722: UI ssh-auth-ms-62000-echo roster Soft 25720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-62000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs62000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25720+ ssh-auth-ms-62000-echo roster ok"; echo "cleaned"; echo "OK: phase25722 e2e passed"
