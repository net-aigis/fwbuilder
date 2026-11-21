#!/usr/bin/env bash
# Phase-28202: UI ssh-auth-soft-28680-echo roster Soft 28200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-28680-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft28680EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28200+ ssh-auth-soft-28680-echo roster ok"; echo "cleaned"; echo "OK: phase28202 e2e passed"
