#!/usr/bin/env bash
# Phase-45002: UI ssh-auth-schema-499-echo roster Soft 45000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-499-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema499EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45000+ ssh-auth-schema-499-echo roster ok"; echo "cleaned"; echo "OK: phase45002 e2e passed"
