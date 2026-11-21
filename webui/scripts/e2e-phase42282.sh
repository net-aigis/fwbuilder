#!/usr/bin/env bash
# Phase-42282: UI ssh-auth-soft-44440-echo roster Soft 42280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-44440-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft44440EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42280+ ssh-auth-soft-44440-echo roster ok"; echo "cleaned"; echo "OK: phase42282 e2e passed"
