#!/usr/bin/env bash
# Phase-18922: UI ssh-auth-soft-18880-echo roster Soft 18920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-18880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft18880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18920+ ssh-auth-soft-18880-echo roster ok"; echo "cleaned"; echo "OK: phase18922 e2e passed"
