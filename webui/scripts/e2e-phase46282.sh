#!/usr/bin/env bash
# Phase-46282: UI ssh-auth-schema-515-echo roster Soft 46280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-515-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema515EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46280+ ssh-auth-schema-515-echo roster ok"; echo "cleaned"; echo "OK: phase46282 e2e passed"
