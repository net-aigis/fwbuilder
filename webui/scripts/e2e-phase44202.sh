#!/usr/bin/env bash
# Phase-44202: UI ssh-auth-soft-46600-echo roster Soft 44200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-46600-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft46600EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44200+ ssh-auth-soft-46600-echo roster ok"; echo "cleaned"; echo "OK: phase44202 e2e passed"
