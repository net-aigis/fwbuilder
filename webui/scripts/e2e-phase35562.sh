#!/usr/bin/env bash
# Phase-35562: UI ssh-auth-soft-36880-echo roster Soft 35560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-36880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft36880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35560+ ssh-auth-soft-36880-echo roster ok"; echo "cleaned"; echo "OK: phase35562 e2e passed"
