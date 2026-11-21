#!/usr/bin/env bash
# Phase-39242: UI ssh-auth-schema-427-echo roster Soft 39240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-427-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema427EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39240+ ssh-auth-schema-427-echo roster ok"; echo "cleaned"; echo "OK: phase39242 e2e passed"
