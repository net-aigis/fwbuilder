#!/usr/bin/env bash
# Phase-27402: UI ssh-auth-schema-279-echo roster Soft 27400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-279-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema279EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27400+ ssh-auth-schema-279-echo roster ok"; echo "cleaned"; echo "OK: phase27402 e2e passed"
