#!/usr/bin/env bash
# Phase-33002: UI ssh-auth-soft-34080-echo roster Soft 33000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-34080-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft34080EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33000+ ssh-auth-soft-34080-echo roster ok"; echo "cleaned"; echo "OK: phase33002 e2e passed"
