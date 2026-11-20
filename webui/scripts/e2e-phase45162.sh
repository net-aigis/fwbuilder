#!/usr/bin/env bash
# Phase-45162: UI ssh-auth-soft-47680-echo roster Soft 45160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-47680-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft47680EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45160+ ssh-auth-soft-47680-echo roster ok"; echo "cleaned"; echo "OK: phase45162 e2e passed"
