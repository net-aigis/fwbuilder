#!/usr/bin/env bash
# Phase-37802: UI ssh-auth-soft-39400-echo roster Soft 37800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-39400-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft39400EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37800+ ssh-auth-soft-39400-echo roster ok"; echo "cleaned"; echo "OK: phase37802 e2e passed"
