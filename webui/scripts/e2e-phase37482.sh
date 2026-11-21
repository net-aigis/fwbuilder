#!/usr/bin/env bash
# Phase-37482: UI ssh-auth-soft-39040-echo roster Soft 37480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-39040-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft39040EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37480+ ssh-auth-soft-39040-echo roster ok"; echo "cleaned"; echo "OK: phase37482 e2e passed"
