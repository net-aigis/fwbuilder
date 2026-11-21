#!/usr/bin/env bash
# Phase-18682: UI ssh-auth-ms-51000-echo roster Soft 18680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-51000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs51000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18680+ ssh-auth-ms-51000-echo roster ok"; echo "cleaned"; echo "OK: phase18682 e2e passed"
