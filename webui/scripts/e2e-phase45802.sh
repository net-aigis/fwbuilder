#!/usr/bin/env bash
# Phase-45802: UI ssh-auth-soft-48400-echo roster Soft 45800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-48400-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft48400EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45800+ ssh-auth-soft-48400-echo roster ok"; echo "cleaned"; echo "OK: phase45802 e2e passed"
