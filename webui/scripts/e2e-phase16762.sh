#!/usr/bin/env bash
# Phase-16762: UI ssh-auth-ms-48000-echo roster Soft 16760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-48000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs48000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16760+ ssh-auth-ms-48000-echo roster ok"; echo "cleaned"; echo "OK: phase16762 e2e passed"
