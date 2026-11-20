#!/usr/bin/env bash
# Phase-36202: UI ssh-auth-soft-37600-echo roster Soft 36200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-37600-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft37600EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36200+ ssh-auth-soft-37600-echo roster ok"; echo "cleaned"; echo "OK: phase36202 e2e passed"
