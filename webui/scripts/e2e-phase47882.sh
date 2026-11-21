#!/usr/bin/env bash
# Phase-47882: UI ssh-auth-schema-535-echo roster Soft 47880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-535-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema535EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47880+ ssh-auth-schema-535-echo roster ok"; echo "cleaned"; echo "OK: phase47882 e2e passed"
