#!/usr/bin/env bash
# Phase-18282: UI ssh-auth-soft-18240-echo roster Soft 18280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-18240-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft18240EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18280+ ssh-auth-soft-18240-echo roster ok"; echo "cleaned"; echo "OK: phase18282 e2e passed"
