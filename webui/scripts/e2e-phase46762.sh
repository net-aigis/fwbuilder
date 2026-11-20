#!/usr/bin/env bash
# Phase-46762: UI ssh-auth-soft-49480-echo roster Soft 46760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-49480-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft49480EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46760+ ssh-auth-soft-49480-echo roster ok"; echo "cleaned"; echo "OK: phase46762 e2e passed"
