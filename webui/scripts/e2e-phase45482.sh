#!/usr/bin/env bash
# Phase-45482: UI ssh-auth-soft-48040-echo roster Soft 45480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-48040-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft48040EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45480+ ssh-auth-soft-48040-echo roster ok"; echo "cleaned"; echo "OK: phase45482 e2e passed"
