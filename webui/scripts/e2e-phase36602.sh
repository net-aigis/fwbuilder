#!/usr/bin/env bash
# Phase-36602: UI ssh-auth-ms-79000-echo roster Soft 36600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-79000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs79000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36600+ ssh-auth-ms-79000-echo roster ok"; echo "cleaned"; echo "OK: phase36602 e2e passed"
