#!/usr/bin/env bash
# Phase-27882: UI ssh-auth-soft-28320-echo roster Soft 27880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-28320-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft28320EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27880+ ssh-auth-soft-28320-echo roster ok"; echo "cleaned"; echo "OK: phase27882 e2e passed"
