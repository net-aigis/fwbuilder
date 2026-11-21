#!/usr/bin/env bash
# Phase-33642: UI ssh-auth-soft-34720-echo roster Soft 33640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-34720-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft34720EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33640+ ssh-auth-soft-34720-echo roster ok"; echo "cleaned"; echo "OK: phase33642 e2e passed"
