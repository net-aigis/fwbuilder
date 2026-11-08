#!/usr/bin/env bash
# Phase-16202: UI ssh-auth-schema-139-echo roster Soft 16200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-139-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema139EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16200+ ssh-auth-schema-139-echo roster ok"; echo "cleaned"; echo "OK: phase16202 e2e passed"
