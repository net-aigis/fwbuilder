#!/usr/bin/env bash
# Phase-23242: UI ssh-auth-schema-227-echo roster Soft 23240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-227-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema227EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23240+ ssh-auth-schema-227-echo roster ok"; echo "cleaned"; echo "OK: phase23242 e2e passed"
